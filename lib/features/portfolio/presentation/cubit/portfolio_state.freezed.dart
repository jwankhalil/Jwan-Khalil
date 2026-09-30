// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'portfolio_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$PortfolioState {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PortfolioState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'PortfolioState()';
}


}

/// @nodoc
class $PortfolioStateCopyWith<$Res>  {
$PortfolioStateCopyWith(PortfolioState _, $Res Function(PortfolioState) __);
}


/// Adds pattern-matching-related methods to [PortfolioState].
extension PortfolioStatePatterns on PortfolioState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( PortfolioInitial value)?  initial,TResult Function( PortfolioLoading value)?  loading,TResult Function( PortfolioSuccess value)?  success,TResult Function( PortfolioError value)?  error,required TResult orElse(),}){
final _that = this;
switch (_that) {
case PortfolioInitial() when initial != null:
return initial(_that);case PortfolioLoading() when loading != null:
return loading(_that);case PortfolioSuccess() when success != null:
return success(_that);case PortfolioError() when error != null:
return error(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( PortfolioInitial value)  initial,required TResult Function( PortfolioLoading value)  loading,required TResult Function( PortfolioSuccess value)  success,required TResult Function( PortfolioError value)  error,}){
final _that = this;
switch (_that) {
case PortfolioInitial():
return initial(_that);case PortfolioLoading():
return loading(_that);case PortfolioSuccess():
return success(_that);case PortfolioError():
return error(_that);case _:
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( PortfolioInitial value)?  initial,TResult? Function( PortfolioLoading value)?  loading,TResult? Function( PortfolioSuccess value)?  success,TResult? Function( PortfolioError value)?  error,}){
final _that = this;
switch (_that) {
case PortfolioInitial() when initial != null:
return initial(_that);case PortfolioLoading() when loading != null:
return loading(_that);case PortfolioSuccess() when success != null:
return success(_that);case PortfolioError() when error != null:
return error(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  initial,TResult Function()?  loading,TResult Function( PortfolioContent content)?  success,TResult Function( Failure failure)?  error,required TResult orElse(),}) {final _that = this;
switch (_that) {
case PortfolioInitial() when initial != null:
return initial();case PortfolioLoading() when loading != null:
return loading();case PortfolioSuccess() when success != null:
return success(_that.content);case PortfolioError() when error != null:
return error(_that.failure);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  initial,required TResult Function()  loading,required TResult Function( PortfolioContent content)  success,required TResult Function( Failure failure)  error,}) {final _that = this;
switch (_that) {
case PortfolioInitial():
return initial();case PortfolioLoading():
return loading();case PortfolioSuccess():
return success(_that.content);case PortfolioError():
return error(_that.failure);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  initial,TResult? Function()?  loading,TResult? Function( PortfolioContent content)?  success,TResult? Function( Failure failure)?  error,}) {final _that = this;
switch (_that) {
case PortfolioInitial() when initial != null:
return initial();case PortfolioLoading() when loading != null:
return loading();case PortfolioSuccess() when success != null:
return success(_that.content);case PortfolioError() when error != null:
return error(_that.failure);case _:
  return null;

}
}

}

/// @nodoc


class PortfolioInitial implements PortfolioState {
  const PortfolioInitial();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PortfolioInitial);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'PortfolioState.initial()';
}


}




/// @nodoc


class PortfolioLoading implements PortfolioState {
  const PortfolioLoading();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PortfolioLoading);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'PortfolioState.loading()';
}


}




/// @nodoc


class PortfolioSuccess implements PortfolioState {
  const PortfolioSuccess(this.content);
  

 final  PortfolioContent content;

/// Create a copy of PortfolioState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PortfolioSuccessCopyWith<PortfolioSuccess> get copyWith => _$PortfolioSuccessCopyWithImpl<PortfolioSuccess>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PortfolioSuccess&&(identical(other.content, content) || other.content == content));
}


@override
int get hashCode => Object.hash(runtimeType,content);

@override
String toString() {
  return 'PortfolioState.success(content: $content)';
}


}

/// @nodoc
abstract mixin class $PortfolioSuccessCopyWith<$Res> implements $PortfolioStateCopyWith<$Res> {
  factory $PortfolioSuccessCopyWith(PortfolioSuccess value, $Res Function(PortfolioSuccess) _then) = _$PortfolioSuccessCopyWithImpl;
@useResult
$Res call({
 PortfolioContent content
});




}
/// @nodoc
class _$PortfolioSuccessCopyWithImpl<$Res>
    implements $PortfolioSuccessCopyWith<$Res> {
  _$PortfolioSuccessCopyWithImpl(this._self, this._then);

  final PortfolioSuccess _self;
  final $Res Function(PortfolioSuccess) _then;

/// Create a copy of PortfolioState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? content = null,}) {
  return _then(PortfolioSuccess(
null == content ? _self.content : content // ignore: cast_nullable_to_non_nullable
as PortfolioContent,
  ));
}


}

/// @nodoc


class PortfolioError implements PortfolioState {
  const PortfolioError(this.failure);
  

 final  Failure failure;

/// Create a copy of PortfolioState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PortfolioErrorCopyWith<PortfolioError> get copyWith => _$PortfolioErrorCopyWithImpl<PortfolioError>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PortfolioError&&(identical(other.failure, failure) || other.failure == failure));
}


@override
int get hashCode => Object.hash(runtimeType,failure);

@override
String toString() {
  return 'PortfolioState.error(failure: $failure)';
}


}

/// @nodoc
abstract mixin class $PortfolioErrorCopyWith<$Res> implements $PortfolioStateCopyWith<$Res> {
  factory $PortfolioErrorCopyWith(PortfolioError value, $Res Function(PortfolioError) _then) = _$PortfolioErrorCopyWithImpl;
@useResult
$Res call({
 Failure failure
});




}
/// @nodoc
class _$PortfolioErrorCopyWithImpl<$Res>
    implements $PortfolioErrorCopyWith<$Res> {
  _$PortfolioErrorCopyWithImpl(this._self, this._then);

  final PortfolioError _self;
  final $Res Function(PortfolioError) _then;

/// Create a copy of PortfolioState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? failure = null,}) {
  return _then(PortfolioError(
null == failure ? _self.failure : failure // ignore: cast_nullable_to_non_nullable
as Failure,
  ));
}


}

// dart format on
