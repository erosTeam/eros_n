import 'package:flutter/foundation.dart';
import 'gallery_provider.dart';
import 'gallery_provider.dart';

@immutable
class GalleryList {
  
  const GalleryList({
    this.gallerys,
    this.populars,
    this.maxPage,
  });

  final List<GalleryProvider>? gallerys;
  final List<GalleryProvider>? populars;
  final int? maxPage;

  factory GalleryList.fromJson(Map<String,dynamic> json) => GalleryList(
    gallerys: json['gallerys'] != null ? (json['gallerys'] as List? ?? []).map((e) => GalleryProvider.fromJson(e as Map<String, dynamic>)).toList() : null,
    populars: json['populars'] != null ? (json['populars'] as List? ?? []).map((e) => GalleryProvider.fromJson(e as Map<String, dynamic>)).toList() : null,
    maxPage: json['maxPage'] != null ? json['maxPage'] as int : null
  );
  
  Map<String, dynamic> toJson() => {
    'gallerys': gallerys?.map((e) => e.toJson()).toList(),
    'populars': populars?.map((e) => e.toJson()).toList(),
    'maxPage': maxPage
  };

  GalleryList clone() => GalleryList(
    gallerys: gallerys?.map((e) => e.clone()).toList(),
    populars: populars?.map((e) => e.clone()).toList(),
    maxPage: maxPage
  );

    
  GalleryList copyWith({
    List<GalleryProvider>? gallerys,
    List<GalleryProvider>? populars,
    int? maxPage
  }) => GalleryList(
    gallerys: gallerys ?? this.gallerys,
    populars: populars ?? this.populars,
    maxPage: maxPage ?? this.maxPage,
  );  

  @override
  bool operator ==(Object other) => identical(this, other) 
    || other is GalleryList && gallerys == other.gallerys && populars == other.populars && maxPage == other.maxPage;

  @override
  int get hashCode => gallerys.hashCode ^ populars.hashCode ^ maxPage.hashCode;
}
