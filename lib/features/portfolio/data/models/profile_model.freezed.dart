// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'profile_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ProfileModel {

@JsonKey(name: 'full_name') String get fullName; String get title; String get summary; String get email; String? get phone; String? get location;@JsonKey(name: 'linkedin_url') String? get linkedinUrl;@JsonKey(name: 'github_url') String? get githubUrl;@JsonKey(name: 'avatar_url') String? get avatarUrl;@JsonKey(name: 'resume_url') String? get resumeUrl;
/// Create a copy of ProfileModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ProfileModelCopyWith<ProfileModel> get copyWith => _$ProfileModelCopyWithImpl<ProfileModel>(this as ProfileModel, _$identity);

  /// Serializes this ProfileModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ProfileModel&&(identical(other.fullName, fullName) || other.fullName == fullName)&&(identical(other.title, title) || other.title == title)&&(identical(other.summary, summary) || other.summary == summary)&&(identical(other.email, email) || other.email == email)&&(identical(other.phone, phone) || other.phone == phone)&&(identical(other.location, location) || other.location == location)&&(identical(other.linkedinUrl, linkedinUrl) || other.linkedinUrl == linkedinUrl)&&(identical(other.githubUrl, githubUrl) || other.githubUrl == githubUrl)&&(identical(other.avatarUrl, avatarUrl) || other.avatarUrl == avatarUrl)&&(identical(other.resumeUrl, resumeUrl) || other.resumeUrl == resumeUrl));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,fullName,title,summary,email,phone,location,linkedinUrl,githubUrl,avatarUrl,resumeUrl);

@override
String toString() {
  return 'ProfileModel(fullName: $fullName, title: $title, summary: $summary, email: $email, phone: $phone, location: $location, linkedinUrl: $linkedinUrl, githubUrl: $githubUrl, avatarUrl: $avatarUrl, resumeUrl: $resumeUrl)';
}


}

/// @nodoc
abstract mixin class $ProfileModelCopyWith<$Res>  {
  factory $ProfileModelCopyWith(ProfileModel value, $Res Function(ProfileModel) _then) = _$ProfileModelCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: 'full_name') String fullName, String title, String summary, String email, String? phone, String? location,@JsonKey(name: 'linkedin_url') String? linkedinUrl,@JsonKey(name: 'github_url') String? githubUrl,@JsonKey(name: 'avatar_url') String? avatarUrl,@JsonKey(name: 'resume_url') String? resumeUrl
});




}
/// @nodoc
class _$ProfileModelCopyWithImpl<$Res>
    implements $ProfileModelCopyWith<$Res> {
  _$ProfileModelCopyWithImpl(this._self, this._then);

  final ProfileModel _self;
  final $Res Function(ProfileModel) _then;

/// Create a copy of ProfileModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? fullName = null,Object? title = null,Object? summary = null,Object? email = null,Object? phone = freezed,Object? location = freezed,Object? linkedinUrl = freezed,Object? githubUrl = freezed,Object? avatarUrl = freezed,Object? resumeUrl = freezed,}) {
  return _then(_self.copyWith(
fullName: null == fullName ? _self.fullName : fullName // ignore: cast_nullable_to_non_nullable
as String,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,summary: null == summary ? _self.summary : summary // ignore: cast_nullable_to_non_nullable
as String,email: null == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String,phone: freezed == phone ? _self.phone : phone // ignore: cast_nullable_to_non_nullable
as String?,location: freezed == location ? _self.location : location // ignore: cast_nullable_to_non_nullable
as String?,linkedinUrl: freezed == linkedinUrl ? _self.linkedinUrl : linkedinUrl // ignore: cast_nullable_to_non_nullable
as String?,githubUrl: freezed == githubUrl ? _self.githubUrl : githubUrl // ignore: cast_nullable_to_non_nullable
as String?,avatarUrl: freezed == avatarUrl ? _self.avatarUrl : avatarUrl // ignore: cast_nullable_to_non_nullable
as String?,resumeUrl: freezed == resumeUrl ? _self.resumeUrl : resumeUrl // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [ProfileModel].
extension ProfileModelPatterns on ProfileModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ProfileModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ProfileModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ProfileModel value)  $default,){
final _that = this;
switch (_that) {
case _ProfileModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ProfileModel value)?  $default,){
final _that = this;
switch (_that) {
case _ProfileModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: 'full_name')  String fullName,  String title,  String summary,  String email,  String? phone,  String? location, @JsonKey(name: 'linkedin_url')  String? linkedinUrl, @JsonKey(name: 'github_url')  String? githubUrl, @JsonKey(name: 'avatar_url')  String? avatarUrl, @JsonKey(name: 'resume_url')  String? resumeUrl)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ProfileModel() when $default != null:
return $default(_that.fullName,_that.title,_that.summary,_that.email,_that.phone,_that.location,_that.linkedinUrl,_that.githubUrl,_that.avatarUrl,_that.resumeUrl);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: 'full_name')  String fullName,  String title,  String summary,  String email,  String? phone,  String? location, @JsonKey(name: 'linkedin_url')  String? linkedinUrl, @JsonKey(name: 'github_url')  String? githubUrl, @JsonKey(name: 'avatar_url')  String? avatarUrl, @JsonKey(name: 'resume_url')  String? resumeUrl)  $default,) {final _that = this;
switch (_that) {
case _ProfileModel():
return $default(_that.fullName,_that.title,_that.summary,_that.email,_that.phone,_that.location,_that.linkedinUrl,_that.githubUrl,_that.avatarUrl,_that.resumeUrl);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: 'full_name')  String fullName,  String title,  String summary,  String email,  String? phone,  String? location, @JsonKey(name: 'linkedin_url')  String? linkedinUrl, @JsonKey(name: 'github_url')  String? githubUrl, @JsonKey(name: 'avatar_url')  String? avatarUrl, @JsonKey(name: 'resume_url')  String? resumeUrl)?  $default,) {final _that = this;
switch (_that) {
case _ProfileModel() when $default != null:
return $default(_that.fullName,_that.title,_that.summary,_that.email,_that.phone,_that.location,_that.linkedinUrl,_that.githubUrl,_that.avatarUrl,_that.resumeUrl);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ProfileModel extends ProfileModel {
  const _ProfileModel({@JsonKey(name: 'full_name') required this.fullName, required this.title, required this.summary, required this.email, this.phone, this.location, @JsonKey(name: 'linkedin_url') this.linkedinUrl, @JsonKey(name: 'github_url') this.githubUrl, @JsonKey(name: 'avatar_url') this.avatarUrl, @JsonKey(name: 'resume_url') this.resumeUrl}): super._();
  factory _ProfileModel.fromJson(Map<String, dynamic> json) => _$ProfileModelFromJson(json);

@override@JsonKey(name: 'full_name') final  String fullName;
@override final  String title;
@override final  String summary;
@override final  String email;
@override final  String? phone;
@override final  String? location;
@override@JsonKey(name: 'linkedin_url') final  String? linkedinUrl;
@override@JsonKey(name: 'github_url') final  String? githubUrl;
@override@JsonKey(name: 'avatar_url') final  String? avatarUrl;
@override@JsonKey(name: 'resume_url') final  String? resumeUrl;

/// Create a copy of ProfileModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ProfileModelCopyWith<_ProfileModel> get copyWith => __$ProfileModelCopyWithImpl<_ProfileModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ProfileModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ProfileModel&&(identical(other.fullName, fullName) || other.fullName == fullName)&&(identical(other.title, title) || other.title == title)&&(identical(other.summary, summary) || other.summary == summary)&&(identical(other.email, email) || other.email == email)&&(identical(other.phone, phone) || other.phone == phone)&&(identical(other.location, location) || other.location == location)&&(identical(other.linkedinUrl, linkedinUrl) || other.linkedinUrl == linkedinUrl)&&(identical(other.githubUrl, githubUrl) || other.githubUrl == githubUrl)&&(identical(other.avatarUrl, avatarUrl) || other.avatarUrl == avatarUrl)&&(identical(other.resumeUrl, resumeUrl) || other.resumeUrl == resumeUrl));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,fullName,title,summary,email,phone,location,linkedinUrl,githubUrl,avatarUrl,resumeUrl);

@override
String toString() {
  return 'ProfileModel(fullName: $fullName, title: $title, summary: $summary, email: $email, phone: $phone, location: $location, linkedinUrl: $linkedinUrl, githubUrl: $githubUrl, avatarUrl: $avatarUrl, resumeUrl: $resumeUrl)';
}


}

/// @nodoc
abstract mixin class _$ProfileModelCopyWith<$Res> implements $ProfileModelCopyWith<$Res> {
  factory _$ProfileModelCopyWith(_ProfileModel value, $Res Function(_ProfileModel) _then) = __$ProfileModelCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: 'full_name') String fullName, String title, String summary, String email, String? phone, String? location,@JsonKey(name: 'linkedin_url') String? linkedinUrl,@JsonKey(name: 'github_url') String? githubUrl,@JsonKey(name: 'avatar_url') String? avatarUrl,@JsonKey(name: 'resume_url') String? resumeUrl
});




}
/// @nodoc
class __$ProfileModelCopyWithImpl<$Res>
    implements _$ProfileModelCopyWith<$Res> {
  __$ProfileModelCopyWithImpl(this._self, this._then);

  final _ProfileModel _self;
  final $Res Function(_ProfileModel) _then;

/// Create a copy of ProfileModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? fullName = null,Object? title = null,Object? summary = null,Object? email = null,Object? phone = freezed,Object? location = freezed,Object? linkedinUrl = freezed,Object? githubUrl = freezed,Object? avatarUrl = freezed,Object? resumeUrl = freezed,}) {
  return _then(_ProfileModel(
fullName: null == fullName ? _self.fullName : fullName // ignore: cast_nullable_to_non_nullable
as String,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,summary: null == summary ? _self.summary : summary // ignore: cast_nullable_to_non_nullable
as String,email: null == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String,phone: freezed == phone ? _self.phone : phone // ignore: cast_nullable_to_non_nullable
as String?,location: freezed == location ? _self.location : location // ignore: cast_nullable_to_non_nullable
as String?,linkedinUrl: freezed == linkedinUrl ? _self.linkedinUrl : linkedinUrl // ignore: cast_nullable_to_non_nullable
as String?,githubUrl: freezed == githubUrl ? _self.githubUrl : githubUrl // ignore: cast_nullable_to_non_nullable
as String?,avatarUrl: freezed == avatarUrl ? _self.avatarUrl : avatarUrl // ignore: cast_nullable_to_non_nullable
as String?,resumeUrl: freezed == resumeUrl ? _self.resumeUrl : resumeUrl // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
