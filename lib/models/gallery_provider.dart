import 'package:flutter/foundation.dart';


@immutable
class GalleryProvider {
  
  const GalleryProvider({
    this.gid,
    this.title,
    this.url,
    this.thumbUrl,
  });

  final String? gid;
  final String? title;
  final String? url;
  final String? thumbUrl;

  factory GalleryProvider.fromJson(Map<String,dynamic> json) => GalleryProvider(
    gid: json['gid'] != null ? json['gid'] as String : null,
    title: json['title'] != null ? json['title'] as String : null,
    url: json['url'] != null ? json['url'] as String : null,
    thumbUrl: json['thumbUrl'] != null ? json['thumbUrl'] as String : null
  );
  
  Map<String, dynamic> toJson() => {
    'gid': gid,
    'title': title,
    'url': url,
    'thumbUrl': thumbUrl
  };

  GalleryProvider clone() => GalleryProvider(
    gid: gid,
    title: title,
    url: url,
    thumbUrl: thumbUrl
  );

    
  GalleryProvider copyWith({
    String? gid,
    String? title,
    String? url,
    String? thumbUrl
  }) => GalleryProvider(
    gid: gid ?? this.gid,
    title: title ?? this.title,
    url: url ?? this.url,
    thumbUrl: thumbUrl ?? this.thumbUrl,
  );  

  @override
  bool operator ==(Object other) => identical(this, other) 
    || other is GalleryProvider && gid == other.gid && title == other.title && url == other.url && thumbUrl == other.thumbUrl;

  @override
  int get hashCode => gid.hashCode ^ title.hashCode ^ url.hashCode ^ thumbUrl.hashCode;
}
