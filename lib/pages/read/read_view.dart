import 'package:eros_n/component/models/index.dart';
import 'package:eros_n/component/widget/eros_cached_network_image.dart';
import 'package:eros_n/pages/gallery/gallery_provider.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class ReadPage extends HookConsumerWidget {
  const ReadPage({
    Key? key,
    this.gid,
    this.initialPage = 0,
  }) : super(key: key);
  final int initialPage;
  final String? gid;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final thumbs = ref.watch(galleryProvider(gid)).thumbs;
    return PageView(
      controller: PageController(initialPage: initialPage),
      children: thumbs.map((e) => ErosCachedNetworkImage(e.thumbUrl!)).toList(),
    );
  }
}
