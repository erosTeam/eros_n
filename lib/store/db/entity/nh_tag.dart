import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:isar/isar.dart';

part 'nh_tag.g.dart';

@CopyWith()
@Collection()
@JsonSerializable()
class NhTag {
  NhTag({
    required this.id,
    this.name,
    this.count,
    this.type,
    this.lastUseTime = 0,
    this.translateName,
  });

  factory NhTag.fromJson(Map<String, Object?> json) => _$NhTagFromJson(json);
  Map<String, dynamic> toJson() => _$NhTagToJson(this);

  @Index(unique: true, replace: true)
  final Id? id;
  @Index()
  @JsonKey(ignore: true)
  final String? type;
  @Index()
  final String? name;
  @Index()
  final String? translateName;
  int? count;
  @Index()
  final int lastUseTime;

  @override
  String toString() {
    return 'NhTag{id: $id, type: $type, name: $name, translateName: $translateName, count: $count, lastUseTime: $lastUseTime}';
  }
}
