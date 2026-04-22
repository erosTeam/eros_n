import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:objectbox/objectbox.dart';

part 'nh_tag.g.dart';

@CopyWith()
@Entity()
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

  @Id(assignable: true)
  int id;

  @Index()
  @JsonKey(includeFromJson: false, includeToJson: false)
  String? type;

  @Index()
  String? name;

  @Index()
  String? translateName;

  int? count;

  @Index()
  int lastUseTime;

  @override
  String toString() {
    return 'NhTag{id: $id, type: $type, name: $name, translateName: $translateName, count: $count, lastUseTime: $lastUseTime}';
  }
}
