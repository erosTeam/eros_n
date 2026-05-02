import 'dart:convert';

import 'package:objectbox/objectbox.dart';

enum DownloadStatus { pending, downloading, paused, completed, failed }

@Entity()
class DownloadTask {
  DownloadTask({
    required this.gid,
    required this.title,
    required this.thumbUrl,
    required this.mediaId,
    required this.totalPages,
    required this.savedDir,
    this.downloadedPages = 0,
    this.statusValue = 0,
    DownloadStatus? status,
    String? pageExtsJson,
    int? createdAt,
  })  : pageExtsJson = pageExtsJson ?? '[]',
        createdAt = createdAt ?? DateTime.now().millisecondsSinceEpoch {
    if (status != null) statusValue = status.index;
  }

  @Id(assignable: true)
  int gid;

  String title;
  String thumbUrl;
  String mediaId;
  int totalPages;
  String savedDir;
  int downloadedPages;
  int createdAt;

  // DownloadStatus stored as int index
  int statusValue;

  // List<String> stored as JSON
  String pageExtsJson;

  DownloadStatus get status => DownloadStatus.values[statusValue];
  set status(DownloadStatus v) => statusValue = v.index;

  List<String> get pageExts =>
      List<String>.from(jsonDecode(pageExtsJson) as List);
  set pageExts(List<String> v) => pageExtsJson = jsonEncode(v);

  DownloadTask copyWith({
    int? downloadedPages,
    DownloadStatus? status,
    List<String>? pageExts,
  }) {
    return DownloadTask(
      gid: gid,
      title: title,
      thumbUrl: thumbUrl,
      mediaId: mediaId,
      totalPages: totalPages,
      savedDir: savedDir,
      downloadedPages: downloadedPages ?? this.downloadedPages,
      statusValue: status?.index ?? statusValue,
      pageExtsJson: pageExts != null ? jsonEncode(pageExts) : pageExtsJson,
      createdAt: createdAt,
    );
  }
}
