// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'certification_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$CertificationModel {

 String get id; String get title; String get issuer;@JsonKey(name: 'credential_url') String? get credentialUrl;
/// Create a copy of CertificationModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CertificationModelCopyWith<CertificationModel> get copyWith => _$CertificationModelCopyWithImpl<CertificationModel>(this as CertificationModel, _$identity);

  /// Serializes this CertificationModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CertificationModel&&(identical(other.id, id) || other.id == id)&&(identical(other.title, title) || other.title == title)&&(identical(other.issuer, issuer) || other.issuer == issuer)&&(identical(other.credentialUrl, credentialUrl) || other.credentialUrl == credentialUrl));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,title,issuer,credentialUrl);

@override
String toString() {
  return 'CertificationModel(id: $id, title: $title, issuer: $issuer, credentialUrl: $credentialUrl)';
}


}

/// @nodoc
abstract mixin class $CertificationModelCopyWith<$Res>  {
  factory $CertificationModelCopyWith(CertificationModel value, $Res Function(CertificationModel) _then) = _$CertificationModelCopyWithImpl;
@useResult
$Res call({
 String id, String title, String issuer,@JsonKey(name: 'credential_url') String? credentialUrl
});




}
/// @nodoc
class _$CertificationModelCopyWithImpl<$Res>
    implements $CertificationModelCopyWith<$Res> {
  _$CertificationModelCopyWithImpl(this._self, this._then);

  final CertificationModel _self;
  final $Res Function(CertificationModel) _then;

/// Create a copy of CertificationModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? title = null,Object? issuer = null,Object? credentialUrl = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,issuer: null == issuer ? _self.issuer : issuer // ignore: cast_nullable_to_non_nullable
as String,credentialUrl: freezed == credentialUrl ? _self.credentialUrl : credentialUrl // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [CertificationModel].
extension CertificationModelPatterns on CertificationModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _CertificationModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _CertificationModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _CertificationModel value)  $default,){
final _that = this;
switch (_that) {
case _CertificationModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _CertificationModel value)?  $default,){
final _that = this;
switch (_that) {
case _CertificationModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String title,  String issuer, @JsonKey(name: 'credential_url')  String? credentialUrl)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _CertificationModel() when $default != null:
return $default(_that.id,_that.title,_that.issuer,_that.credentialUrl);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String title,  String issuer, @JsonKey(name: 'credential_url')  String? credentialUrl)  $default,) {final _that = this;
switch (_that) {
case _CertificationModel():
return $default(_that.id,_that.title,_that.issuer,_that.credentialUrl);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String title,  String issuer, @JsonKey(name: 'credential_url')  String? credentialUrl)?  $default,) {final _that = this;
switch (_that) {
case _CertificationModel() when $default != null:
return $default(_that.id,_that.title,_that.issuer,_that.credentialUrl);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _CertificationModel extends CertificationModel {
  const _CertificationModel({required this.id, required this.title, required this.issuer, @JsonKey(name: 'credential_url') this.credentialUrl}): super._();
  factory _CertificationModel.fromJson(Map<String, dynamic> json) => _$CertificationModelFromJson(json);

@override final  String id;
@override final  String title;
@override final  String issuer;
@override@JsonKey(name: 'credential_url') final  String? credentialUrl;

/// Create a copy of CertificationModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CertificationModelCopyWith<_CertificationModel> get copyWith => __$CertificationModelCopyWithImpl<_CertificationModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$CertificationModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _CertificationModel&&(identical(other.id, id) || other.id == id)&&(identical(other.title, title) || other.title == title)&&(identical(other.issuer, issuer) || other.issuer == issuer)&&(identical(other.credentialUrl, credentialUrl) || other.credentialUrl == credentialUrl));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,title,issuer,credentialUrl);

@override
String toString() {
  return 'CertificationModel(id: $id, title: $title, issuer: $issuer, credentialUrl: $credentialUrl)';
}


}

/// @nodoc
abstract mixin class _$CertificationModelCopyWith<$Res> implements $CertificationModelCopyWith<$Res> {
  factory _$CertificationModelCopyWith(_CertificationModel value, $Res Function(_CertificationModel) _then) = __$CertificationModelCopyWithImpl;
@override @useResult
$Res call({
 String id, String title, String issuer,@JsonKey(name: 'credential_url') String? credentialUrl
});




}
/// @nodoc
class __$CertificationModelCopyWithImpl<$Res>
    implements _$CertificationModelCopyWith<$Res> {
  __$CertificationModelCopyWithImpl(this._self, this._then);

  final _CertificationModel _self;
  final $Res Function(_CertificationModel) _then;

/// Create a copy of CertificationModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? title = null,Object? issuer = null,Object? credentialUrl = freezed,}) {
  return _then(_CertificationModel(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,issuer: null == issuer ? _self.issuer : issuer // ignore: cast_nullable_to_non_nullable
as String,credentialUrl: freezed == credentialUrl ? _self.credentialUrl : credentialUrl // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
