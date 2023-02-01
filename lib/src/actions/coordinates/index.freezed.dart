// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of coordinates_actions;

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$GetCoordinates {
  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function() $default, {
    required TResult Function(List<GeoPointModel> coordinates) successful,
    required TResult Function(Object error, StackTrace stackTrace) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>(
    TResult? Function()? $default, {
    TResult? Function(List<GeoPointModel> coordinates)? successful,
    TResult? Function(Object error, StackTrace stackTrace)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function()? $default, {
    TResult Function(List<GeoPointModel> coordinates)? successful,
    TResult Function(Object error, StackTrace stackTrace)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>(
    TResult Function(GetCoordinatesStart value) $default, {
    required TResult Function(GetCoordinatesSuccessful value) successful,
    required TResult Function(GetCoordinatesError value) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>(
    TResult? Function(GetCoordinatesStart value)? $default, {
    TResult? Function(GetCoordinatesSuccessful value)? successful,
    TResult? Function(GetCoordinatesError value)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(GetCoordinatesStart value)? $default, {
    TResult Function(GetCoordinatesSuccessful value)? successful,
    TResult Function(GetCoordinatesError value)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GetCoordinatesCopyWith<$Res> {
  factory $GetCoordinatesCopyWith(
          GetCoordinates value, $Res Function(GetCoordinates) then) =
      _$GetCoordinatesCopyWithImpl<$Res, GetCoordinates>;
}

/// @nodoc
class _$GetCoordinatesCopyWithImpl<$Res, $Val extends GetCoordinates>
    implements $GetCoordinatesCopyWith<$Res> {
  _$GetCoordinatesCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$GetCoordinatesStartCopyWith<$Res> {
  factory _$$GetCoordinatesStartCopyWith(_$GetCoordinatesStart value,
          $Res Function(_$GetCoordinatesStart) then) =
      __$$GetCoordinatesStartCopyWithImpl<$Res>;
}

/// @nodoc
class __$$GetCoordinatesStartCopyWithImpl<$Res>
    extends _$GetCoordinatesCopyWithImpl<$Res, _$GetCoordinatesStart>
    implements _$$GetCoordinatesStartCopyWith<$Res> {
  __$$GetCoordinatesStartCopyWithImpl(
      _$GetCoordinatesStart _value, $Res Function(_$GetCoordinatesStart) _then)
      : super(_value, _then);
}

/// @nodoc

class _$GetCoordinatesStart implements GetCoordinatesStart {
  const _$GetCoordinatesStart();

  @override
  String toString() {
    return 'GetCoordinates()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$GetCoordinatesStart);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function() $default, {
    required TResult Function(List<GeoPointModel> coordinates) successful,
    required TResult Function(Object error, StackTrace stackTrace) error,
  }) {
    return $default();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>(
    TResult? Function()? $default, {
    TResult? Function(List<GeoPointModel> coordinates)? successful,
    TResult? Function(Object error, StackTrace stackTrace)? error,
  }) {
    return $default?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function()? $default, {
    TResult Function(List<GeoPointModel> coordinates)? successful,
    TResult Function(Object error, StackTrace stackTrace)? error,
    required TResult orElse(),
  }) {
    if ($default != null) {
      return $default();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>(
    TResult Function(GetCoordinatesStart value) $default, {
    required TResult Function(GetCoordinatesSuccessful value) successful,
    required TResult Function(GetCoordinatesError value) error,
  }) {
    return $default(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>(
    TResult? Function(GetCoordinatesStart value)? $default, {
    TResult? Function(GetCoordinatesSuccessful value)? successful,
    TResult? Function(GetCoordinatesError value)? error,
  }) {
    return $default?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(GetCoordinatesStart value)? $default, {
    TResult Function(GetCoordinatesSuccessful value)? successful,
    TResult Function(GetCoordinatesError value)? error,
    required TResult orElse(),
  }) {
    if ($default != null) {
      return $default(this);
    }
    return orElse();
  }
}

abstract class GetCoordinatesStart implements GetCoordinates {
  const factory GetCoordinatesStart() = _$GetCoordinatesStart;
}

/// @nodoc
abstract class _$$GetCoordinatesSuccessfulCopyWith<$Res> {
  factory _$$GetCoordinatesSuccessfulCopyWith(_$GetCoordinatesSuccessful value,
          $Res Function(_$GetCoordinatesSuccessful) then) =
      __$$GetCoordinatesSuccessfulCopyWithImpl<$Res>;
  @useResult
  $Res call({List<GeoPointModel> coordinates});
}

/// @nodoc
class __$$GetCoordinatesSuccessfulCopyWithImpl<$Res>
    extends _$GetCoordinatesCopyWithImpl<$Res, _$GetCoordinatesSuccessful>
    implements _$$GetCoordinatesSuccessfulCopyWith<$Res> {
  __$$GetCoordinatesSuccessfulCopyWithImpl(_$GetCoordinatesSuccessful _value,
      $Res Function(_$GetCoordinatesSuccessful) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? coordinates = null,
  }) {
    return _then(_$GetCoordinatesSuccessful(
      null == coordinates
          ? _value._coordinates
          : coordinates // ignore: cast_nullable_to_non_nullable
              as List<GeoPointModel>,
    ));
  }
}

/// @nodoc

class _$GetCoordinatesSuccessful implements GetCoordinatesSuccessful {
  const _$GetCoordinatesSuccessful(final List<GeoPointModel> coordinates)
      : _coordinates = coordinates;

  final List<GeoPointModel> _coordinates;
  @override
  List<GeoPointModel> get coordinates {
    if (_coordinates is EqualUnmodifiableListView) return _coordinates;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_coordinates);
  }

  @override
  String toString() {
    return 'GetCoordinates.successful(coordinates: $coordinates)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GetCoordinatesSuccessful &&
            const DeepCollectionEquality()
                .equals(other._coordinates, _coordinates));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(_coordinates));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$GetCoordinatesSuccessfulCopyWith<_$GetCoordinatesSuccessful>
      get copyWith =>
          __$$GetCoordinatesSuccessfulCopyWithImpl<_$GetCoordinatesSuccessful>(
              this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function() $default, {
    required TResult Function(List<GeoPointModel> coordinates) successful,
    required TResult Function(Object error, StackTrace stackTrace) error,
  }) {
    return successful(coordinates);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>(
    TResult? Function()? $default, {
    TResult? Function(List<GeoPointModel> coordinates)? successful,
    TResult? Function(Object error, StackTrace stackTrace)? error,
  }) {
    return successful?.call(coordinates);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function()? $default, {
    TResult Function(List<GeoPointModel> coordinates)? successful,
    TResult Function(Object error, StackTrace stackTrace)? error,
    required TResult orElse(),
  }) {
    if (successful != null) {
      return successful(coordinates);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>(
    TResult Function(GetCoordinatesStart value) $default, {
    required TResult Function(GetCoordinatesSuccessful value) successful,
    required TResult Function(GetCoordinatesError value) error,
  }) {
    return successful(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>(
    TResult? Function(GetCoordinatesStart value)? $default, {
    TResult? Function(GetCoordinatesSuccessful value)? successful,
    TResult? Function(GetCoordinatesError value)? error,
  }) {
    return successful?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(GetCoordinatesStart value)? $default, {
    TResult Function(GetCoordinatesSuccessful value)? successful,
    TResult Function(GetCoordinatesError value)? error,
    required TResult orElse(),
  }) {
    if (successful != null) {
      return successful(this);
    }
    return orElse();
  }
}

abstract class GetCoordinatesSuccessful implements GetCoordinates {
  const factory GetCoordinatesSuccessful(
      final List<GeoPointModel> coordinates) = _$GetCoordinatesSuccessful;

  List<GeoPointModel> get coordinates;
  @JsonKey(ignore: true)
  _$$GetCoordinatesSuccessfulCopyWith<_$GetCoordinatesSuccessful>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$GetCoordinatesErrorCopyWith<$Res> {
  factory _$$GetCoordinatesErrorCopyWith(_$GetCoordinatesError value,
          $Res Function(_$GetCoordinatesError) then) =
      __$$GetCoordinatesErrorCopyWithImpl<$Res>;
  @useResult
  $Res call({Object error, StackTrace stackTrace});
}

/// @nodoc
class __$$GetCoordinatesErrorCopyWithImpl<$Res>
    extends _$GetCoordinatesCopyWithImpl<$Res, _$GetCoordinatesError>
    implements _$$GetCoordinatesErrorCopyWith<$Res> {
  __$$GetCoordinatesErrorCopyWithImpl(
      _$GetCoordinatesError _value, $Res Function(_$GetCoordinatesError) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? error = null,
    Object? stackTrace = null,
  }) {
    return _then(_$GetCoordinatesError(
      null == error ? _value.error : error,
      null == stackTrace
          ? _value.stackTrace
          : stackTrace // ignore: cast_nullable_to_non_nullable
              as StackTrace,
    ));
  }
}

/// @nodoc

class _$GetCoordinatesError implements GetCoordinatesError {
  const _$GetCoordinatesError(this.error, this.stackTrace);

  @override
  final Object error;
  @override
  final StackTrace stackTrace;

  @override
  String toString() {
    return 'GetCoordinates.error(error: $error, stackTrace: $stackTrace)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GetCoordinatesError &&
            const DeepCollectionEquality().equals(other.error, error) &&
            (identical(other.stackTrace, stackTrace) ||
                other.stackTrace == stackTrace));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(error), stackTrace);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$GetCoordinatesErrorCopyWith<_$GetCoordinatesError> get copyWith =>
      __$$GetCoordinatesErrorCopyWithImpl<_$GetCoordinatesError>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function() $default, {
    required TResult Function(List<GeoPointModel> coordinates) successful,
    required TResult Function(Object error, StackTrace stackTrace) error,
  }) {
    return error(this.error, stackTrace);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>(
    TResult? Function()? $default, {
    TResult? Function(List<GeoPointModel> coordinates)? successful,
    TResult? Function(Object error, StackTrace stackTrace)? error,
  }) {
    return error?.call(this.error, stackTrace);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function()? $default, {
    TResult Function(List<GeoPointModel> coordinates)? successful,
    TResult Function(Object error, StackTrace stackTrace)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this.error, stackTrace);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>(
    TResult Function(GetCoordinatesStart value) $default, {
    required TResult Function(GetCoordinatesSuccessful value) successful,
    required TResult Function(GetCoordinatesError value) error,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>(
    TResult? Function(GetCoordinatesStart value)? $default, {
    TResult? Function(GetCoordinatesSuccessful value)? successful,
    TResult? Function(GetCoordinatesError value)? error,
  }) {
    return error?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(GetCoordinatesStart value)? $default, {
    TResult Function(GetCoordinatesSuccessful value)? successful,
    TResult Function(GetCoordinatesError value)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class GetCoordinatesError implements GetCoordinates {
  const factory GetCoordinatesError(
      final Object error, final StackTrace stackTrace) = _$GetCoordinatesError;

  Object get error;
  StackTrace get stackTrace;
  @JsonKey(ignore: true)
  _$$GetCoordinatesErrorCopyWith<_$GetCoordinatesError> get copyWith =>
      throw _privateConstructorUsedError;
}
