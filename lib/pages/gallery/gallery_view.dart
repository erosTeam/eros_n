import 'package:eros_n/component/widget/eros_cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'gallery_provider.dart';

class GalleryPage extends HookConsumerWidget {
  const GalleryPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final gallery = ref.watch(galleryProvider);
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            // title: Text(gallery.title ?? ''),
            floating: true,
            pinned: true,
            bottom: PreferredSize(
              preferredSize: Size.fromHeight(0),
              child: SizedBox(height: 0),
            ),
            // expandedHeight: 230,
            // flexibleSpace: FlexibleSpaceBar(
            //   // title: Text(gallery.title ?? ''),
            //   background: ErosCachedNetworkImage(
            //     gallery.thumbUrl ?? '',
            //     fit: BoxFit.cover,
            //   ),
            // ),
          ),
          SliverToBoxAdapter(
            child: Container(
              padding: const EdgeInsets.all(0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    height: 180,
                    child: Row(
                      // crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Card(
                          margin: const EdgeInsets.symmetric(horizontal: 12),
                          clipBehavior: Clip.antiAlias,
                          child: Container(
                            width: 120,
                            child: ErosCachedNetworkImage(
                              gallery.thumbUrl ?? '',
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                gallery.title ?? '',
                                style: Theme.of(context).textTheme.titleMedium,
                                maxLines: 5,
                                overflow: TextOverflow.ellipsis,
                              ),
                              const SizedBox(height: 8),
                              Text(
                                '#${gallery.gid}',
                                style: Theme.of(context).textTheme.caption,
                                textAlign: TextAlign.start,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(height: 8),
                  // Text(
                  //   'imgWidth: ${gallery.imgWidth}',
                  //   style: Theme.of(context).textTheme.caption,
                  // ),
                  // const SizedBox(height: 8),
                  // Text(
                  //   'imgHeight: ${gallery.imgHeight}',
                  //   style: Theme.of(context).textTheme.caption,
                  // ),
                ],
              ),
            ),
          ),
          SliverFixedExtentList(
            itemExtent: 50.0,
            delegate: new SliverChildBuilderDelegate(
              (context, index) => new ListTile(
                title: new Text("Item $index"),
              ),
              childCount: 30,
            ),
          ),
        ],
      ),
    );
  }
}
