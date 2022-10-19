import 'dart:async';
import 'dart:math';

import 'package:eros_n/common/const/const.dart';
import 'package:eros_n/component/models/comment.dart';
import 'package:eros_n/component/widget/eros_cached_network_image.dart';
import 'package:eros_n/generated/l10n.dart';
import 'package:eros_n/utils/get_utils/extensions/context_extensions.dart';
import 'package:eros_n/utils/logger.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:intl/intl.dart';

import '../../network/app_dio/pdio.dart';
import 'gallery_provider.dart';

class CommentsPage extends HookConsumerWidget {
  const CommentsPage({
    Key? key,
    required this.gid,
    this.colorScheme,
  }) : super(key: key);
  final int gid;
  final ColorScheme? colorScheme;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final comments = ref.watch(galleryProvider(gid).select((g) => g.comments));

    final galleryNotifier =
        useMemoized(() => ref.read(galleryProvider(gid).notifier));

    String? errorText;
    bool isSending = false;

    late StreamSubscription<bool> keyboardSubscription;
    useEffect(() {
      final keyboardVisibilityController = KeyboardVisibilityController();
      keyboardSubscription =
          keyboardVisibilityController.onChange.listen((visible) {
        if (!visible) {
          FocusScope.of(context).requestFocus(FocusNode());
        }
      });
      return () {
        keyboardSubscription.cancel();
      };
    });

    return Theme(
      data: Theme.of(context).copyWith(colorScheme: colorScheme),
      child: Builder(builder: (context) {
        return Scaffold(
          appBar: AppBar(
            title: const Text('评论'),
          ),
          body: Column(
            children: [
              Expanded(child: CommentsListView(comments: comments)),
              Container(
                color: Theme.of(context).colorScheme.surfaceVariant,
                padding: EdgeInsets.only(
                  left: max(16, context.mediaQueryPadding.left),
                  right: max(8, context.mediaQueryPadding.right),
                  bottom: context.mediaQueryPadding.bottom,
                ),
                child: StatefulBuilder(builder: (context, setState) {
                  return Row(
                    children: [
                      Expanded(
                        child: TextField(
                          enabled: !isSending,
                          controller: galleryNotifier.commentEditingController,
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            errorText: errorText,
                            errorMaxLines: 10,
                            // border: OutlineInputBorder(),
                            contentPadding: const EdgeInsets.symmetric(
                                horizontal: 4, vertical: 8),
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
                                          .commentEditingController.text
                                          .trim()
                                          .length >
                                      10) {
                                    try {
                                      setState(() {
                                        isSending = true;
                                      });
                                      await galleryNotifier.comment();
                                    } on HttpException catch (e) {
                                      logger.e('${e.runtimeType} ${e.message}');
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
                                      errorText =
                                          L10n.of(context).comment_length_error;
                                    });
                                  }
                                },
                          icon: Icon(
                            isSending ? Icons.send : Icons.send_outlined,
                            color:
                                Theme.of(context).colorScheme.onSurfaceVariant,
                          )),
                    ],
                  );
                }),
              ),
            ],
          ),
        );
      }),
    );
  }
}

class CommentsListView extends StatelessWidget {
  const CommentsListView({
    super.key,
    required this.comments,
  });

  final List<Comment> comments;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemCount: comments.length,
      itemBuilder: (context, index) {
        final comment = comments[index];
        final date =
            DateTime.fromMillisecondsSinceEpoch((comment.postDate ?? 0) * 1000);
        final dateFormatted =
            DateFormat('yyyy-MM-dd HH:mm').format(date.toLocal());
        return ListTile(
          leading: Container(
            //shadow
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.surface,
              borderRadius: BorderRadius.circular(24),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.2),
                  spreadRadius: 1,
                  blurRadius: 7,
                  offset: const Offset(0, 2), // changes position of shadow
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
                  placeholder: (_, __) => Container(
                    color: Theme.of(context).colorScheme.primary,
                  ),
                ),
              ),
            ),
          ),
          title: Row(
            children: [
              Expanded(
                child: Text(
                  comment.poster?.username ?? '',
                  textScaleFactor: 0.9,
                  maxLines: 2,
                ),
              ),
              const SizedBox(width: 8),
              Text(
                dateFormatted,
                textScaleFactor: 0.94,
                style: Theme.of(context).textTheme.caption,
              ),
            ],
          ),
          subtitle: Text(
            comment.commentText ?? '',
            style: Theme.of(context).textTheme.bodyText2,
            textScaleFactor: 0.94,
          ),
        );
      },
      separatorBuilder: (BuildContext context, int index) {
        return const SizedBox(height: 12);
      },
    );
  }
}
