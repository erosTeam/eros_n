import 'dart:async';
import 'dart:math';

import 'package:auto_route/auto_route.dart';
import 'package:eros_n/common/const/const.dart';
import 'package:eros_n/common/provider/settings_provider.dart';
import 'package:eros_n/component/models/comment.dart';
import 'package:eros_n/component/widget/adaptive_app_bar.dart';
import 'package:eros_n/component/widget/eros_cached_network_image.dart';
import 'package:eros_n/generated/l10n.dart';
import 'package:eros_n/network/app_dio/pdio.dart';
import 'package:eros_n/pages/gallery/comment_translation_provider.dart';
import 'package:eros_n/pages/gallery/gallery_provider.dart';
import 'package:eros_n/utils/get_utils/extensions/context_extensions.dart';
import 'package:eros_n/utils/logger.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:intl/intl.dart';

@RoutePage()
class CommentsPage extends HookConsumerWidget {
  const CommentsPage({super.key, required this.gid, this.colorScheme});
  final int gid;
  final ColorScheme? colorScheme;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final comments = ref.watch(galleryProvider(gid).select((g) => g.comments));

    final galleryNotifier = useMemoized(
      () => ref.read(galleryProvider(gid).notifier),
    );

    String? errorText;
    bool isSending = false;

    late StreamSubscription<bool> keyboardSubscription;
    useEffect(() {
      final keyboardVisibilityController = KeyboardVisibilityController();
      keyboardSubscription = keyboardVisibilityController.onChange.listen((
        visible,
      ) {
        if (!visible && context.mounted) {
          FocusScope.of(context).requestFocus(FocusNode());
        }
      });
      return () {
        keyboardSubscription.cancel();
      };
    });

    return Theme(
      data: Theme.of(context).copyWith(colorScheme: colorScheme),
      child: Builder(
        builder: (context) {
          final glass = isLiquidGlass(ref);
          return Scaffold(
            extendBodyBehindAppBar: glass,
            appBar: adaptiveAppBar(
              context: context,
              ref: ref,
              title: const Text('评论'),
            ),
            body: Padding(
              padding: glass ? glassBodyPadding(context) : EdgeInsets.zero,
              child: Column(
                children: [
                  Expanded(child: CommentsListView(comments: comments)),
                  Container(
                    color: Theme.of(
                      context,
                    ).colorScheme.surfaceContainerHighest,
                    padding: EdgeInsets.only(
                      left: max(16, context.mediaQueryPadding.left),
                      right: max(8, context.mediaQueryPadding.right),
                      bottom: context.mediaQueryPadding.bottom,
                    ),
                    child: StatefulBuilder(
                      builder: (context, setState) {
                        return Row(
                          children: [
                            Expanded(
                              child: TextField(
                                enabled: !isSending,
                                controller:
                                    galleryNotifier.commentEditingController,
                                decoration: InputDecoration(
                                  border: InputBorder.none,
                                  errorText: errorText,
                                  errorMaxLines: 10,
                                  // border: OutlineInputBorder(),
                                  contentPadding: const EdgeInsets.symmetric(
                                    horizontal: 4,
                                    vertical: 8,
                                  ),
                                ),
                                maxLines: null,
                                onChanged: (value) {
                                  setState(() {
                                    errorText = null;
                                  });
                                },
                              ),
                            ),
                            IconButton(
                              onPressed: isSending
                                  ? null
                                  : () async {
                                      if (galleryNotifier
                                              .commentEditingController
                                              .text
                                              .trim()
                                              .length >
                                          10) {
                                        try {
                                          setState(() {
                                            isSending = true;
                                          });
                                          await galleryNotifier.comment();
                                        } on HttpException catch (e) {
                                          logger.e(
                                            '${e.runtimeType} ${e.message}',
                                          );
                                          setState(() {
                                            errorText = e.message;
                                          });
                                        } finally {
                                          setState(() {
                                            isSending = false;
                                          });
                                        }
                                      } else {
                                        setState(() {
                                          errorText = L10n.of(
                                            context,
                                          ).comment_length_error;
                                        });
                                      }
                                    },
                              icon: Icon(
                                isSending ? Icons.send : Icons.send_outlined,
                                color: Theme.of(
                                  context,
                                ).colorScheme.onSurfaceVariant,
                              ),
                            ),
                          ],
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

class CommentsListView extends ConsumerStatefulWidget {
  const CommentsListView({super.key, required this.comments});

  final List<Comment> comments;

  @override
  ConsumerState<CommentsListView> createState() => _CommentsListViewState();
}

class _CommentsListViewState extends ConsumerState<CommentsListView> {
  final Set<int> _showTranslation = {};

  @override
  Widget build(BuildContext context) {
    final commentTranslation = ref.watch(
      settingsProvider.select((s) => s.commentTranslation),
    );
    final translations = ref.watch(commentTranslationProvider);

    return ListView.separated(
      itemCount: widget.comments.length,
      itemBuilder: (context, index) {
        final comment = widget.comments[index];
        final commentId = comment.commentId ?? index;
        final date = DateTime.fromMillisecondsSinceEpoch(
          (comment.postDate ?? 0) * 1000,
        );
        final dateFormatted = DateFormat(
          'yyyy-MM-dd HH:mm',
        ).format(date.toLocal());

        final translatedText = translations[commentId];
        final isLoading = ref
            .read(commentTranslationProvider.notifier)
            .isLoading(commentId);
        final showTrans = _showTranslation.contains(commentId);
        final originalText = comment.commentText ?? '';
        final displayText = (showTrans && translatedText != null)
            ? translatedText
            : originalText;

        return ListTile(
          leading: Container(
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.surface,
              borderRadius: BorderRadius.circular(24),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withValues(alpha: 0.2),
                  spreadRadius: 1,
                  blurRadius: 7,
                  offset: const Offset(0, 2),
                ),
              ],
            ),
            child: ClipOval(
              child: SizedBox(
                height: 48,
                width: 48,
                child: ErosCachedNetworkImage(
                  imageUrl:
                      'https://i.${NHConst.baseHost}/${comment.poster?.avatarUrl ?? ''}',
                  fit: BoxFit.cover,
                  placeholder: (_, _) =>
                      Container(color: Theme.of(context).colorScheme.primary),
                ),
              ),
            ),
          ),
          title: Row(
            children: [
              Expanded(
                child: Text(
                  comment.poster?.username ?? '',
                  textScaler: const TextScaler.linear(0.9),
                ),
              ),
              const SizedBox(width: 8),
              Text(
                dateFormatted,
                textScaler: const TextScaler.linear(0.94),
                style: Theme.of(context).textTheme.bodySmall,
              ),
            ],
          ),
          subtitle: AnimatedSize(
            duration: const Duration(milliseconds: 200),
            alignment: Alignment.topLeft,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  displayText,
                  style: Theme.of(context).textTheme.bodyMedium,
                  textScaler: const TextScaler.linear(0.94),
                ),
                if (commentTranslation && originalText.isNotEmpty)
                  Align(
                    alignment: Alignment.centerRight,
                    child: GestureDetector(
                      onTap: isLoading
                          ? null
                          : () {
                              if (translatedText != null) {
                                setState(() {
                                  if (_showTranslation.contains(commentId)) {
                                    _showTranslation.remove(commentId);
                                  } else {
                                    _showTranslation.add(commentId);
                                  }
                                });
                              } else {
                                _showTranslation.add(commentId);
                                ref
                                    .read(commentTranslationProvider.notifier)
                                    .translate(commentId, originalText);
                              }
                            },
                      child: Padding(
                        padding: const EdgeInsets.only(top: 4),
                        child: isLoading
                            ? SizedBox(
                                width: 18,
                                height: 18,
                                child: CircularProgressIndicator(
                                  strokeWidth: 2,
                                  color: Theme.of(
                                    context,
                                  ).colorScheme.onSurfaceVariant,
                                ),
                              )
                            : Icon(
                                Icons.translate,
                                size: 18,
                                color: showTrans && translatedText != null
                                    ? Theme.of(context).colorScheme.primary
                                    : Theme.of(
                                        context,
                                      ).colorScheme.onSurfaceVariant,
                              ),
                      ),
                    ),
                  ),
              ],
            ),
          ),
        );
      },
      separatorBuilder: (BuildContext context, int index) {
        return const SizedBox(height: 12);
      },
    );
  }
}
