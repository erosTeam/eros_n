import 'package:eros_n/component/widget/blur_image.dart';
import 'package:eros_n/component/widget/eros_cached_network_image.dart';
import 'package:eros_n/models/index.dart';
import 'package:eros_n/pages/gallery/gallery_view.dart';
import 'package:eros_n/pages/list_view/item/item_base.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ItemCard extends StatelessWidget {
  const ItemCard(
      {Key? key, required this.galleryProvider, this.index, this.page})
      : super(key: key);

  final GalleryProvider galleryProvider;
  final int? index;
  final int? page;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Get.to(() => GalleryPage());
      },
      child: Container(
        height: 180,
        child: Card(
          clipBehavior: Clip.antiAlias,
          margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
          child: Row(
            children: [
              Container(
                width: 120,
                child: BlurImage(
                  blur: kDebugMode,
                  child: ErosCachedNetworkImage(
                    imageUrl: galleryProvider.thumbUrl ?? '',
                    fit: BoxFit.scaleDown,
                    placeholder: (context, url) => const Center(
                      child: CircularProgressIndicator(),
                    ),
                  ),
                ),
              ),
              Expanded(
                child: Container(
                  padding: const EdgeInsets.all(12),
                  child: Column(
                    // mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        galleryProvider.title ?? '',
                        textAlign: TextAlign.start,
                        maxLines: 4,
                        overflow: TextOverflow.ellipsis,
                        // style: TextStyle(fontSize: 20),
                      ),
                      Spacer(),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
