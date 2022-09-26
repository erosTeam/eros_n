import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'user.freezed.dart';
part 'user.g.dart';

@freezed
class User with _$User {
  const factory User({
    String? userName,
    String? avatarUrl,
    String? userId,
    String? userUrl,
    String? sessionid,
  }) = _User;

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);

  const User._();

  bool get isLogin => sessionid != null && sessionid!.isNotEmpty;
}
