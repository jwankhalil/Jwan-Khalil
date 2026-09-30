// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'project_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ProjectModel {

 String get id; String get title; String get description;@JsonKey(name: 'github_url') String? get githubUrl;@JsonKey(name: 'live_url') String? get liveUrl;@JsonKey(name: 'image_url') String? get imageUrl;@JsonKey(name: 'tech_stack') List<String> get techStack;@JsonKey(name: 'is_featured') bool get isFeatured;
/// Create a copy of ProjectModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ProjectModelCopyWith<ProjectModel> get copyWith => _$ProjectModelCopyWithImpl<ProjectModel>(this as ProjectModel, _$identity);

  /// Serializes this ProjectModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ProjectModel&&(identical(other.id, id) || other.id == id)&&(identical(other.title, title) || other.title == title)&&(identical(other.description, description) || other.description == description)&&(identical(other.githubUrl, githubUrl) || other.githubUrl == githubUrl)&&(identical(other.liveUrl, liveUrl) || other.liveUrl == liveUrl)&&(identical(other.imageUrl, imageUrl) || other.imageUrl == imageUrl)&&const DeepCollectionEquality().equals(other.techStack, techStack)&&(identical(other.isFeatured, isFeatured) || other.isFeatured == isFeatured));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,title,description,githubUrl,liveUrl,imageUrl,const DeepCollectionEquality().hash(techStack),isFeatured);

@override
String toString() {
  return 'ProjectModel(id: $id, title: $title, description: $description, githubUrl: $githubUrl, liveUrl: $liveUrl, imageUrl: $imageUrl, techStack: $techStack, isFeatured: $isFeatured)';
}


}

/// @nodoc
abstract mixin class $ProjectModelCopyWith<$Res>  {
  factory $ProjectModelCopyWith(ProjectModel value, $Res Function(ProjectModel) _then) = _$ProjectModelCopyWithImpl;
@useResult
$Res call({
 String id, String title, String description,@JsonKey(name: 'github_url') String? githubUrl,@JsonKey(name: 'live_url') String? liveUrl,@JsonKey(name: 'image_url') String? imageUrl,@JsonKey(name: 'tech_stack') List<String> techStack,@JsonKey(name: 'is_featured') bool isFeatured
});




}
/// @nodoc
class _$ProjectModelCopyWithImpl<$Res>
    implements $ProjectModelCopyWith<$Res> {
  _$ProjectModelCopyWithImpl(this._self, this._then);

  final ProjectModel _self;
  final $Res Function(ProjectModel) _then;

/// Create a copy of ProjectModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? title = null,Object? description = null,Object? githubUrl = freezed,Object? liveUrl = freezed,Object? imageUrl = freezed,Object? techStack = null,Object? isFeatured = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,description: null == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String,githubUrl: freezed == githubUrl ? _self.githubUrl : githubUrl // ignore: cast_nullable_to_non_nullable
as String?,liveUrl: freezed == liveUrl ? _self.liveUrl : liveUrl // ignore: cast_nullable_to_non_nullable
as String?,imageUrl: freezed == imageUrl ? _self.imageUrl : imageUrl // ignore: cast_nullable_to_non_nullable
as String?,techStack: null == techStack ? _self.techStack : techStack // ignore: cast_nullable_to_non_nullable
as List<String>,isFeatured: null == isFeatured ? _self.isFeatured : isFeatured // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

}


/// Adds pattern-matching-related methods to [ProjectModel].
extension ProjectModelPatterns on ProjectModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ProjectModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ProjectModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ProjectModel value)  $default,){
final _that = this;
switch (_that) {
case _ProjectModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ProjectModel value)?  $default,){
final _that = this;
switch (_that) {
case _ProjectModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String title,  String description, @JsonKey(name: 'github_url')  String? githubUrl, @JsonKey(name: 'live_url')  String? liveUrl, @JsonKey(name: 'image_url')  String? imageUrl, @JsonKey(name: 'tech_stack')  List<String> techStack, @JsonKey(name: 'is_featured')  bool isFeatured)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ProjectModel() when $default != null:
return $default(_that.id,_that.title,_that.description,_that.githubUrl,_that.liveUrl,_that.imageUrl,_that.techStack,_that.isFeatured);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String title,  String description, @JsonKey(name: 'github_url')  String? githubUrl, @JsonKey(name: 'live_url')  String? liveUrl, @JsonKey(name: 'image_url')  String? imageUrl, @JsonKey(name: 'tech_stack')  List<String> techStack, @JsonKey(name: 'is_featured')  bool isFeatured)  $default,) {final _that = this;
switch (_that) {
case _ProjectModel():
return $default(_that.id,_that.title,_that.description,_that.githubUrl,_that.liveUrl,_that.imageUrl,_that.techStack,_that.isFeatured);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String title,  String description, @JsonKey(name: 'github_url')  String? githubUrl, @JsonKey(name: 'live_url')  String? liveUrl, @JsonKey(name: 'image_url')  String? imageUrl, @JsonKey(name: 'tech_stack')  List<String> techStack, @JsonKey(name: 'is_featured')  bool isFeatured)?  $default,) {final _that = this;
switch (_that) {
case _ProjectModel() when $default != null:
return $default(_that.id,_that.title,_that.description,_that.githubUrl,_that.liveUrl,_that.imageUrl,_that.techStack,_that.isFeatured);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ProjectModel extends ProjectModel {
  const _ProjectModel({required this.id, required this.title, required this.description, @JsonKey(name: 'github_url') this.githubUrl, @JsonKey(name: 'live_url') this.liveUrl, @JsonKey(name: 'image_url') this.imageUrl, @JsonKey(name: 'tech_stack') final  List<String> techStack = const [], @JsonKey(name: 'is_featured') this.isFeatured = true}): _techStack = techStack,super._();
  factory _ProjectModel.fromJson(Map<String, dynamic> json) => _$ProjectModelFromJson(json);

@override final  String id;
@override final  String title;
@override final  String description;
@override@JsonKey(name: 'github_url') final  String? githubUrl;
@override@JsonKey(name: 'live_url') final  String? liveUrl;
@override@JsonKey(name: 'image_url') final  String? imageUrl;
 final  List<String> _techStack;
@override@JsonKey(name: 'tech_stack') List<String> get techStack {
  if (_techStack is EqualUnmodifiableListView) return _techStack;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_techStack);
}

@override@JsonKey(name: 'is_featured') final  bool isFeatured;

/// Create a copy of ProjectModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ProjectModelCopyWith<_ProjectModel> get copyWith => __$ProjectModelCopyWithImpl<_ProjectModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ProjectModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ProjectModel&&(identical(other.id, id) || other.id == id)&&(identical(other.title, title) || other.title == title)&&(identical(other.description, description) || other.description == description)&&(identical(other.githubUrl, githubUrl) || other.githubUrl == githubUrl)&&(identical(other.liveUrl, liveUrl) || other.liveUrl == liveUrl)&&(identical(other.imageUrl, imageUrl) || other.imageUrl == imageUrl)&&const DeepCollectionEquality().equals(other._techStack, _techStack)&&(identical(other.isFeatured, isFeatured) || other.isFeatured == isFeatured));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,title,description,githubUrl,liveUrl,imageUrl,const DeepCollectionEquality().hash(_techStack),isFeatured);

@override
String toString() {
  return 'ProjectModel(id: $id, title: $title, description: $description, githubUrl: $githubUrl, liveUrl: $liveUrl, imageUrl: $imageUrl, techStack: $techStack, isFeatured: $isFeatured)';
}


}

/// @nodoc
abstract mixin class _$ProjectModelCopyWith<$Res> implements $ProjectModelCopyWith<$Res> {
  factory _$ProjectModelCopyWith(_ProjectModel value, $Res Function(_ProjectModel) _then) = __$ProjectModelCopyWithImpl;
@override @useResult
$Res call({
 String id, String title, String description,@JsonKey(name: 'github_url') String? githubUrl,@JsonKey(name: 'live_url') String? liveUrl,@JsonKey(name: 'image_url') String? imageUrl,@JsonKey(name: 'tech_stack') List<String> techStack,@JsonKey(name: 'is_featured') bool isFeatured
});




}
/// @nodoc
class __$ProjectModelCopyWithImpl<$Res>
    implements _$ProjectModelCopyWith<$Res> {
  __$ProjectModelCopyWithImpl(this._self, this._then);

  final _ProjectModel _self;
  final $Res Function(_ProjectModel) _then;

/// Create a copy of ProjectModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? title = null,Object? description = null,Object? githubUrl = freezed,Object? liveUrl = freezed,Object? imageUrl = freezed,Object? techStack = null,Object? isFeatured = null,}) {
  return _then(_ProjectModel(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,description: null == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String,githubUrl: freezed == githubUrl ? _self.githubUrl : githubUrl // ignore: cast_nullable_to_non_nullable
as String?,liveUrl: freezed == liveUrl ? _self.liveUrl : liveUrl // ignore: cast_nullable_to_non_nullable
as String?,imageUrl: freezed == imageUrl ? _self.imageUrl : imageUrl // ignore: cast_nullable_to_non_nullable
as String?,techStack: null == techStack ? _self._techStack : techStack // ignore: cast_nullable_to_non_nullable
as List<String>,isFeatured: null == isFeatured ? _self.isFeatured : isFeatured // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}

// dart format on
