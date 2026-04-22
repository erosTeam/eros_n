// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'tag.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$Tag implements DiagnosticableTreeMixin {

 int? get id; String? get type; String? get name; String? get url; int? get count;@JsonKey(ignore: true) String? get translatedName;
/// Create a copy of Tag
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TagCopyWith<Tag> get copyWith => _$TagCopyWithImpl<Tag>(this as Tag, _$identity);

  /// Serializes this Tag to a JSON map.
  Map<String, dynamic> toJson();

@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'Tag'))
    ..add(DiagnosticsProperty('id', id))..add(DiagnosticsProperty('type', type))..add(DiagnosticsProperty('name', name))..add(DiagnosticsProperty('url', url))..add(DiagnosticsProperty('count', count))..add(DiagnosticsProperty('translatedName', translatedName));
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Tag&&(identical(other.id, id) || other.id == id)&&(identical(other.type, type) || other.type == type)&&(identical(other.name, name) || other.name == name)&&(identical(other.url, url) || other.url == url)&&(identical(other.count, count) || other.count == count)&&(identical(other.translatedName, translatedName) || other.translatedName == translatedName));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,type,name,url,count,translatedName);

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'Tag(id: $id, type: $type, name: $name, url: $url, count: $count, translatedName: $translatedName)';
}


}

/// @nodoc
abstract mixin class $TagCopyWith<$Res>  {
  factory $TagCopyWith(Tag value, $Res Function(Tag) _then) = _$TagCopyWithImpl;
@useResult
$Res call({
 int? id, String? type, String? name, String? url, int? count,@JsonKey(ignore: true) String? translatedName
});




}
/// @nodoc
class _$TagCopyWithImpl<$Res>
    implements $TagCopyWith<$Res> {
  _$TagCopyWithImpl(this._self, this._then);

  final Tag _self;
  final $Res Function(Tag) _then;

/// Create a copy of Tag
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = freezed,Object? type = freezed,Object? name = freezed,Object? url = freezed,Object? count = freezed,Object? translatedName = freezed,}) {
  return _then(_self.copyWith(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int?,type: freezed == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as String?,name: freezed == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String?,url: freezed == url ? _self.url : url // ignore: cast_nullable_to_non_nullable
as String?,count: freezed == count ? _self.count : count // ignore: cast_nullable_to_non_nullable
as int?,translatedName: freezed == translatedName ? _self.translatedName : translatedName // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [Tag].
extension TagPatterns on Tag {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Tag value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Tag() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Tag value)  $default,){
final _that = this;
switch (_that) {
case _Tag():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Tag value)?  $default,){
final _that = this;
switch (_that) {
case _Tag() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int? id,  String? type,  String? name,  String? url,  int? count, @JsonKey(ignore: true)  String? translatedName)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Tag() when $default != null:
return $default(_that.id,_that.type,_that.name,_that.url,_that.count,_that.translatedName);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int? id,  String? type,  String? name,  String? url,  int? count, @JsonKey(ignore: true)  String? translatedName)  $default,) {final _that = this;
switch (_that) {
case _Tag():
return $default(_that.id,_that.type,_that.name,_that.url,_that.count,_that.translatedName);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int? id,  String? type,  String? name,  String? url,  int? count, @JsonKey(ignore: true)  String? translatedName)?  $default,) {final _that = this;
switch (_that) {
case _Tag() when $default != null:
return $default(_that.id,_that.type,_that.name,_that.url,_that.count,_that.translatedName);case _:
  return null;

}
}

}

/// @nodoc

@JsonSerializable(fieldRename: FieldRename.snake, explicitToJson: true)
class _Tag with DiagnosticableTreeMixin implements Tag {
  const _Tag({this.id, this.type, this.name, this.url, this.count, @JsonKey(ignore: true) this.translatedName});
  factory _Tag.fromJson(Map<String, dynamic> json) => _$TagFromJson(json);

@override final  int? id;
@override final  String? type;
@override final  String? name;
@override final  String? url;
@override final  int? count;
@override@JsonKey(ignore: true) final  String? translatedName;

/// Create a copy of Tag
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$TagCopyWith<_Tag> get copyWith => __$TagCopyWithImpl<_Tag>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$TagToJson(this, );
}
@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'Tag'))
    ..add(DiagnosticsProperty('id', id))..add(DiagnosticsProperty('type', type))..add(DiagnosticsProperty('name', name))..add(DiagnosticsProperty('url', url))..add(DiagnosticsProperty('count', count))..add(DiagnosticsProperty('translatedName', translatedName));
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Tag&&(identical(other.id, id) || other.id == id)&&(identical(other.type, type) || other.type == type)&&(identical(other.name, name) || other.name == name)&&(identical(other.url, url) || other.url == url)&&(identical(other.count, count) || other.count == count)&&(identical(other.translatedName, translatedName) || other.translatedName == translatedName));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,type,name,url,count,translatedName);

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'Tag(id: $id, type: $type, name: $name, url: $url, count: $count, translatedName: $translatedName)';
}


}

/// @nodoc
abstract mixin class _$TagCopyWith<$Res> implements $TagCopyWith<$Res> {
  factory _$TagCopyWith(_Tag value, $Res Function(_Tag) _then) = __$TagCopyWithImpl;
@override @useResult
$Res call({
 int? id, String? type, String? name, String? url, int? count,@JsonKey(ignore: true) String? translatedName
});




}
/// @nodoc
class __$TagCopyWithImpl<$Res>
    implements _$TagCopyWith<$Res> {
  __$TagCopyWithImpl(this._self, this._then);

  final _Tag _self;
  final $Res Function(_Tag) _then;

/// Create a copy of Tag
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = freezed,Object? type = freezed,Object? name = freezed,Object? url = freezed,Object? count = freezed,Object? translatedName = freezed,}) {
  return _then(_Tag(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int?,type: freezed == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as String?,name: freezed == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String?,url: freezed == url ? _self.url : url // ignore: cast_nullable_to_non_nullable
as String?,count: freezed == count ? _self.count : count // ignore: cast_nullable_to_non_nullable
as int?,translatedName: freezed == translatedName ? _self.translatedName : translatedName // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
