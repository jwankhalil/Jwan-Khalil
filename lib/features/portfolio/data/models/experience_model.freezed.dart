// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'experience_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ExperienceModel {

 String get id; String get company; String get role;@JsonKey(name: 'employment_type') String? get employmentType; String? get location;@JsonKey(name: 'start_date') String get startDate;@JsonKey(name: 'end_date') String? get endDate;@JsonKey(name: 'is_current') bool get isCurrent; List<String> get highlights;
/// Create a copy of ExperienceModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ExperienceModelCopyWith<ExperienceModel> get copyWith => _$ExperienceModelCopyWithImpl<ExperienceModel>(this as ExperienceModel, _$identity);

  /// Serializes this ExperienceModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ExperienceModel&&(identical(other.id, id) || other.id == id)&&(identical(other.company, company) || other.company == company)&&(identical(other.role, role) || other.role == role)&&(identical(other.employmentType, employmentType) || other.employmentType == employmentType)&&(identical(other.location, location) || other.location == location)&&(identical(other.startDate, startDate) || other.startDate == startDate)&&(identical(other.endDate, endDate) || other.endDate == endDate)&&(identical(other.isCurrent, isCurrent) || other.isCurrent == isCurrent)&&const DeepCollectionEquality().equals(other.highlights, highlights));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,company,role,employmentType,location,startDate,endDate,isCurrent,const DeepCollectionEquality().hash(highlights));

@override
String toString() {
  return 'ExperienceModel(id: $id, company: $company, role: $role, employmentType: $employmentType, location: $location, startDate: $startDate, endDate: $endDate, isCurrent: $isCurrent, highlights: $highlights)';
}


}

/// @nodoc
abstract mixin class $ExperienceModelCopyWith<$Res>  {
  factory $ExperienceModelCopyWith(ExperienceModel value, $Res Function(ExperienceModel) _then) = _$ExperienceModelCopyWithImpl;
@useResult
$Res call({
 String id, String company, String role,@JsonKey(name: 'employment_type') String? employmentType, String? location,@JsonKey(name: 'start_date') String startDate,@JsonKey(name: 'end_date') String? endDate,@JsonKey(name: 'is_current') bool isCurrent, List<String> highlights
});




}
/// @nodoc
class _$ExperienceModelCopyWithImpl<$Res>
    implements $ExperienceModelCopyWith<$Res> {
  _$ExperienceModelCopyWithImpl(this._self, this._then);

  final ExperienceModel _self;
  final $Res Function(ExperienceModel) _then;

/// Create a copy of ExperienceModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? company = null,Object? role = null,Object? employmentType = freezed,Object? location = freezed,Object? startDate = null,Object? endDate = freezed,Object? isCurrent = null,Object? highlights = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,company: null == company ? _self.company : company // ignore: cast_nullable_to_non_nullable
as String,role: null == role ? _self.role : role // ignore: cast_nullable_to_non_nullable
as String,employmentType: freezed == employmentType ? _self.employmentType : employmentType // ignore: cast_nullable_to_non_nullable
as String?,location: freezed == location ? _self.location : location // ignore: cast_nullable_to_non_nullable
as String?,startDate: null == startDate ? _self.startDate : startDate // ignore: cast_nullable_to_non_nullable
as String,endDate: freezed == endDate ? _self.endDate : endDate // ignore: cast_nullable_to_non_nullable
as String?,isCurrent: null == isCurrent ? _self.isCurrent : isCurrent // ignore: cast_nullable_to_non_nullable
as bool,highlights: null == highlights ? _self.highlights : highlights // ignore: cast_nullable_to_non_nullable
as List<String>,
  ));
}

}


/// Adds pattern-matching-related methods to [ExperienceModel].
extension ExperienceModelPatterns on ExperienceModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ExperienceModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ExperienceModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ExperienceModel value)  $default,){
final _that = this;
switch (_that) {
case _ExperienceModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ExperienceModel value)?  $default,){
final _that = this;
switch (_that) {
case _ExperienceModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String company,  String role, @JsonKey(name: 'employment_type')  String? employmentType,  String? location, @JsonKey(name: 'start_date')  String startDate, @JsonKey(name: 'end_date')  String? endDate, @JsonKey(name: 'is_current')  bool isCurrent,  List<String> highlights)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ExperienceModel() when $default != null:
return $default(_that.id,_that.company,_that.role,_that.employmentType,_that.location,_that.startDate,_that.endDate,_that.isCurrent,_that.highlights);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String company,  String role, @JsonKey(name: 'employment_type')  String? employmentType,  String? location, @JsonKey(name: 'start_date')  String startDate, @JsonKey(name: 'end_date')  String? endDate, @JsonKey(name: 'is_current')  bool isCurrent,  List<String> highlights)  $default,) {final _that = this;
switch (_that) {
case _ExperienceModel():
return $default(_that.id,_that.company,_that.role,_that.employmentType,_that.location,_that.startDate,_that.endDate,_that.isCurrent,_that.highlights);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String company,  String role, @JsonKey(name: 'employment_type')  String? employmentType,  String? location, @JsonKey(name: 'start_date')  String startDate, @JsonKey(name: 'end_date')  String? endDate, @JsonKey(name: 'is_current')  bool isCurrent,  List<String> highlights)?  $default,) {final _that = this;
switch (_that) {
case _ExperienceModel() when $default != null:
return $default(_that.id,_that.company,_that.role,_that.employmentType,_that.location,_that.startDate,_that.endDate,_that.isCurrent,_that.highlights);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ExperienceModel extends ExperienceModel {
  const _ExperienceModel({required this.id, required this.company, required this.role, @JsonKey(name: 'employment_type') this.employmentType, this.location, @JsonKey(name: 'start_date') required this.startDate, @JsonKey(name: 'end_date') this.endDate, @JsonKey(name: 'is_current') this.isCurrent = false, final  List<String> highlights = const []}): _highlights = highlights,super._();
  factory _ExperienceModel.fromJson(Map<String, dynamic> json) => _$ExperienceModelFromJson(json);

@override final  String id;
@override final  String company;
@override final  String role;
@override@JsonKey(name: 'employment_type') final  String? employmentType;
@override final  String? location;
@override@JsonKey(name: 'start_date') final  String startDate;
@override@JsonKey(name: 'end_date') final  String? endDate;
@override@JsonKey(name: 'is_current') final  bool isCurrent;
 final  List<String> _highlights;
@override@JsonKey() List<String> get highlights {
  if (_highlights is EqualUnmodifiableListView) return _highlights;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_highlights);
}


/// Create a copy of ExperienceModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ExperienceModelCopyWith<_ExperienceModel> get copyWith => __$ExperienceModelCopyWithImpl<_ExperienceModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ExperienceModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ExperienceModel&&(identical(other.id, id) || other.id == id)&&(identical(other.company, company) || other.company == company)&&(identical(other.role, role) || other.role == role)&&(identical(other.employmentType, employmentType) || other.employmentType == employmentType)&&(identical(other.location, location) || other.location == location)&&(identical(other.startDate, startDate) || other.startDate == startDate)&&(identical(other.endDate, endDate) || other.endDate == endDate)&&(identical(other.isCurrent, isCurrent) || other.isCurrent == isCurrent)&&const DeepCollectionEquality().equals(other._highlights, _highlights));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,company,role,employmentType,location,startDate,endDate,isCurrent,const DeepCollectionEquality().hash(_highlights));

@override
String toString() {
  return 'ExperienceModel(id: $id, company: $company, role: $role, employmentType: $employmentType, location: $location, startDate: $startDate, endDate: $endDate, isCurrent: $isCurrent, highlights: $highlights)';
}


}

/// @nodoc
abstract mixin class _$ExperienceModelCopyWith<$Res> implements $ExperienceModelCopyWith<$Res> {
  factory _$ExperienceModelCopyWith(_ExperienceModel value, $Res Function(_ExperienceModel) _then) = __$ExperienceModelCopyWithImpl;
@override @useResult
$Res call({
 String id, String company, String role,@JsonKey(name: 'employment_type') String? employmentType, String? location,@JsonKey(name: 'start_date') String startDate,@JsonKey(name: 'end_date') String? endDate,@JsonKey(name: 'is_current') bool isCurrent, List<String> highlights
});




}
/// @nodoc
class __$ExperienceModelCopyWithImpl<$Res>
    implements _$ExperienceModelCopyWith<$Res> {
  __$ExperienceModelCopyWithImpl(this._self, this._then);

  final _ExperienceModel _self;
  final $Res Function(_ExperienceModel) _then;

/// Create a copy of ExperienceModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? company = null,Object? role = null,Object? employmentType = freezed,Object? location = freezed,Object? startDate = null,Object? endDate = freezed,Object? isCurrent = null,Object? highlights = null,}) {
  return _then(_ExperienceModel(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,company: null == company ? _self.company : company // ignore: cast_nullable_to_non_nullable
as String,role: null == role ? _self.role : role // ignore: cast_nullable_to_non_nullable
as String,employmentType: freezed == employmentType ? _self.employmentType : employmentType // ignore: cast_nullable_to_non_nullable
as String?,location: freezed == location ? _self.location : location // ignore: cast_nullable_to_non_nullable
as String?,startDate: null == startDate ? _self.startDate : startDate // ignore: cast_nullable_to_non_nullable
as String,endDate: freezed == endDate ? _self.endDate : endDate // ignore: cast_nullable_to_non_nullable
as String?,isCurrent: null == isCurrent ? _self.isCurrent : isCurrent // ignore: cast_nullable_to_non_nullable
as bool,highlights: null == highlights ? _self._highlights : highlights // ignore: cast_nullable_to_non_nullable
as List<String>,
  ));
}


}

// dart format on
