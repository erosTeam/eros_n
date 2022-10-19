import 'package:eros_n/common/enum.dart';
import 'package:eros_n/common/provider/settings_provider.dart';
import 'package:eros_n/component/models/index.dart';
import 'package:eros_n/component/widget/blur_image.dart';
import 'package:eros_n/component/widget/eros_cached_network_image.dart';
import 'package:eros_n/utils/get_utils/get_utils.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class CoverImg extends StatelessWidget {
  const CoverImg({
    Key? key,
    required this.imgUrl,
    this.height,
    this.width,
    this.fit = BoxFit.contain,
  }) : super(key: key);

  final String imgUrl;
  final double? height;
  final double? width;

  final BoxFit fit;

  @override
  Widget build(BuildContext context) {
    Widget image() {
      if (imgUrl.isNotEmpty) {
        return ErosCachedNetworkImage(
          imageUrl: imgUrl,
          width: width,
          height: height,
          fit: fit,
        );
      } else {
        return Container();
      }
    }

    return Consumer(
      builder: (context, ref, child) {
        final isCoverBlur = ref
            .watch(settingsProvider.select((settings) => settings.isCoverBlur));
        return BlurImage(
          blur: isCoverBlur,
          sigma: 8,
          child: child!,
        );
      },
      child: image(),
    );
  }
}

class SimpleTagsView extends HookConsumerWidget {
  const SimpleTagsView({
    Key? key,
    required this.simpleTags,
    this.padding = const EdgeInsets.symmetric(horizontal: 6),
    this.tagLayoutOnItem,
    this.color,
    this.borderColor,
  }) : super(key: key);

  final List<Tag> simpleTags;
  final EdgeInsetsGeometry? padding;
  final TagLayoutOnItem? tagLayoutOnItem;
  final Color? color;
  final Color? borderColor;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final showTags = ref.watch(settingsProvider.select((s) => s.showTags));
    final tagLayoutOnItem =
        ref.watch(settingsProvider.select((s) => s.tagLayoutOnItem));

    if (!showTags || simpleTags.isEmpty) {
      return const SizedBox();
    }

    final tags = simpleTags.take(10).toList();
    // final tags = gallery.simpleTags;

    switch (this.tagLayoutOnItem ?? tagLayoutOnItem) {
      // case TagLayoutOnItem.row:
      //   return SingleChildScrollView(
      //     scrollDirection: Axis.horizontal,
      //     child: Container(
      //       padding: padding,
      //       child: Row(
      //         children: [
      //           ...tags
      //               .where((tag) => tag.name != null)
      //               .map((e) => SimpleTag(tag: e).paddingOnly(right: 4)),
      //         ],
      //       ),
      //     ),
      //   );

      case TagLayoutOnItem.singleLine:
        return SizedBox(
          height: 26,
          child: ListView.builder(
            padding: padding,
            scrollDirection: Axis.horizontal,
            shrinkWrap: true,
            itemBuilder: (context, index) {
              final tag = tags[index];

              if (tag.name == null) {
                return const SizedBox();
              }

              // 圆角边框
              return Container(
                alignment: Alignment.center,
                margin: const EdgeInsets.only(right: 4),
                child:
                    SimpleTag(tag: tag, color: color, borderColor: borderColor),
              );
            },
            itemCount: tags.length,
          ),
        );
      case TagLayoutOnItem.wrap:
        return Container(
          padding: padding,
          child: Wrap(
            spacing: 4,
            runSpacing: 4,
            children: tags
                .where((tag) => tag.name != null)
                .map((tag) =>
                    SimpleTag(tag: tag, color: color, borderColor: borderColor))
                .toList(),
          ),
        );
    }
  }
}

class SimpleTag extends HookConsumerWidget {
  const SimpleTag({
    Key? key,
    required this.tag,
    this.color,
    this.borderColor,
  }) : super(key: key);
  final Tag tag;
  final Color? color;
  final Color? borderColor;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isTagTranslate =
        ref.watch(settingsProvider.select((value) => value.isTagTranslate));

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 1.5),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(6),
        border: Border.all(color: borderColor ?? Colors.grey[600]!),
      ),
      child: Text(
        isTagTranslate ? tag.translatedName ?? '' : tag.name ?? '',
        style: TextStyle(
          fontSize: 12,
          color: color ?? Theme.of(context).colorScheme.primary,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }
}
