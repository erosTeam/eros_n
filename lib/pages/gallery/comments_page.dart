import 'package:eros_n/common/const/const.dart';
import 'package:eros_n/component/widget/eros_cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:intl/intl.dart';

import 'gallery_provider.dart';

class CommentsPage extends HookConsumerWidget {
  const CommentsPage({
    Key? key,
    required this.gid,
  }) : super(key: key);
  final int gid;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final comments = ref.watch(galleryProvider(gid)).comments;
    return Scaffold(
      appBar: AppBar(
        title: const Text('评论'),
      ),
      body: ListView.separated(
        itemCount: comments.length,
        itemBuilder: (context, index) {
          final comment = comments[index];
          final date = DateTime.fromMillisecondsSinceEpoch(
              (comment.postDate ?? 0) * 1000);
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
      ),
    );
  }
}
