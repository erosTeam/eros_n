import 'package:eros_n/models/index.dart';
import 'package:eros_n/pages/gallery/gallery_view.dart';
import 'package:eros_n/pages/list_view/item/item_base.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ItemWaterfallFlowCard extends StatelessWidget {
  const ItemWaterfallFlowCard({
    Key? key,
    required this.galleryProvider,
    this.index,
    this.page,
    required this.width,
  }) : super(key: key);

  final GalleryProvider galleryProvider;
  final int? index;
  final int? page;
  final double width;

  // 获取图片高度
  double? _getHeigth(double constraintsMaxWidth) {
    if ((galleryProvider.imgWidth ?? 0) >= constraintsMaxWidth) {
      return (galleryProvider.imgHeight ?? 0) *
          constraintsMaxWidth /
          (galleryProvider.imgWidth ?? 0);
    } else {
      return galleryProvider.imgHeight?.roundToDouble();
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Get.to(() => GalleryPage());
      },
      child: Container(
        child: Card(
          clipBehavior: Clip.antiAlias,
          margin: const EdgeInsets.all(0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: _getHeigth(width),
                child: CoverImg(
                  imgUrl: galleryProvider.thumbUrl ?? '',
                  fit: BoxFit.scaleDown,
                ),
              ),
              Container(
                padding: const EdgeInsets.all(8),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      galleryProvider.title ?? '',
                      textAlign: TextAlign.start,
                      maxLines: 3,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
