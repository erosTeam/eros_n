import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:isar/isar.dart';

part 'nh_tag.g.dart';

@Collection()
@JsonSerializable()
class NhTag {
  NhTag({this.id, this.name, this.count, this.type});

  factory NhTag.fromJson(Map<String, Object?> json) => _$NhTagFromJson(json);
  Map<String, dynamic> toJson() => _$NhTagToJson(this);

  @Index(unique: true, replace: true)
  Id? id;
  @Index()
  @JsonKey(ignore: true)
  String? type;
  @Index()
  String? name;
  @Index()
  String? translateName;
  int? count;
}
