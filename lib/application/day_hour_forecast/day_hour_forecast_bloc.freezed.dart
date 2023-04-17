// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'day_hour_forecast_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$DayHourForecastEvent {
  double get lat => throw _privateConstructorUsedError;
  double get lon => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(double lat, double lon) init,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(double lat, double lon)? init,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(double lat, double lon)? init,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Init value) init,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(Init value)? init,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Init value)? init,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $DayHourForecastEventCopyWith<DayHourForecastEvent> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DayHourForecastEventCopyWith<$Res> {
  factory $DayHourForecastEventCopyWith(DayHourForecastEvent value,
          $Res Function(DayHourForecastEvent) then) =
      _$DayHourForecastEventCopyWithImpl<$Res, DayHourForecastEvent>;
  @useResult
  $Res call({double lat, double lon});
}

/// @nodoc
class _$DayHourForecastEventCopyWithImpl<$Res,
        $Val extends DayHourForecastEvent>
    implements $DayHourForecastEventCopyWith<$Res> {
  _$DayHourForecastEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? lat = null,
    Object? lon = null,
  }) {
    return _then(_value.copyWith(
      lat: null == lat
          ? _value.lat
          : lat // ignore: cast_nullable_to_non_nullable
              as double,
      lon: null == lon
          ? _value.lon
          : lon // ignore: cast_nullable_to_non_nullable
              as double,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$InitCopyWith<$Res>
    implements $DayHourForecastEventCopyWith<$Res> {
  factory _$$InitCopyWith(_$Init value, $Res Function(_$Init) then) =
      __$$InitCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({double lat, double lon});
}

/// @nodoc
class __$$InitCopyWithImpl<$Res>
    extends _$DayHourForecastEventCopyWithImpl<$Res, _$Init>
    implements _$$InitCopyWith<$Res> {
  __$$InitCopyWithImpl(_$Init _value, $Res Function(_$Init) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? lat = null,
    Object? lon = null,
  }) {
    return _then(_$Init(
      lat: null == lat
          ? _value.lat
          : lat // ignore: cast_nullable_to_non_nullable
              as double,
      lon: null == lon
          ? _value.lon
          : lon // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }
}

/// @nodoc

class _$Init implements Init {
  const _$Init({required this.lat, required this.lon});

  @override
  final double lat;
  @override
  final double lon;

  @override
  String toString() {
    return 'DayHourForecastEvent.init(lat: $lat, lon: $lon)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$Init &&
            (identical(other.lat, lat) || other.lat == lat) &&
            (identical(other.lon, lon) || other.lon == lon));
  }

  @override
  int get hashCode => Object.hash(runtimeType, lat, lon);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$InitCopyWith<_$Init> get copyWith =>
      __$$InitCopyWithImpl<_$Init>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(double lat, double lon) init,
  }) {
    return init(lat, lon);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(double lat, double lon)? init,
  }) {
    return init?.call(lat, lon);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(double lat, double lon)? init,
    required TResult orElse(),
  }) {
    if (init != null) {
      return init(lat, lon);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Init value) init,
  }) {
    return init(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(Init value)? init,
  }) {
    return init?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Init value)? init,
    required TResult orElse(),
  }) {
    if (init != null) {
      return init(this);
    }
    return orElse();
  }
}

abstract class Init implements DayHourForecastEvent {
  const factory Init({required final double lat, required final double lon}) =
      _$Init;

  @override
  double get lat;
  @override
  double get lon;
  @override
  @JsonKey(ignore: true)
  _$$InitCopyWith<_$Init> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$DayHourForecastState {
  List<MainList> get perThreeHour => throw _privateConstructorUsedError;
  City? get city => throw _privateConstructorUsedError;
  bool get isLoading => throw _privateConstructorUsedError;
  bool get hasError => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $DayHourForecastStateCopyWith<DayHourForecastState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DayHourForecastStateCopyWith<$Res> {
  factory $DayHourForecastStateCopyWith(DayHourForecastState value,
          $Res Function(DayHourForecastState) then) =
      _$DayHourForecastStateCopyWithImpl<$Res, DayHourForecastState>;
  @useResult
  $Res call(
      {List<MainList> perThreeHour, City? city, bool isLoading, bool hasError});
}

/// @nodoc
class _$DayHourForecastStateCopyWithImpl<$Res,
        $Val extends DayHourForecastState>
    implements $DayHourForecastStateCopyWith<$Res> {
  _$DayHourForecastStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? perThreeHour = null,
    Object? city = freezed,
    Object? isLoading = null,
    Object? hasError = null,
  }) {
    return _then(_value.copyWith(
      perThreeHour: null == perThreeHour
          ? _value.perThreeHour
          : perThreeHour // ignore: cast_nullable_to_non_nullable
              as List<MainList>,
      city: freezed == city
          ? _value.city
          : city // ignore: cast_nullable_to_non_nullable
              as City?,
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      hasError: null == hasError
          ? _value.hasError
          : hasError // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_DayHourForecastStateCopyWith<$Res>
    implements $DayHourForecastStateCopyWith<$Res> {
  factory _$$_DayHourForecastStateCopyWith(_$_DayHourForecastState value,
          $Res Function(_$_DayHourForecastState) then) =
      __$$_DayHourForecastStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {List<MainList> perThreeHour, City? city, bool isLoading, bool hasError});
}

/// @nodoc
class __$$_DayHourForecastStateCopyWithImpl<$Res>
    extends _$DayHourForecastStateCopyWithImpl<$Res, _$_DayHourForecastState>
    implements _$$_DayHourForecastStateCopyWith<$Res> {
  __$$_DayHourForecastStateCopyWithImpl(_$_DayHourForecastState _value,
      $Res Function(_$_DayHourForecastState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? perThreeHour = null,
    Object? city = freezed,
    Object? isLoading = null,
    Object? hasError = null,
  }) {
    return _then(_$_DayHourForecastState(
      perThreeHour: null == perThreeHour
          ? _value._perThreeHour
          : perThreeHour // ignore: cast_nullable_to_non_nullable
              as List<MainList>,
      city: freezed == city
          ? _value.city
          : city // ignore: cast_nullable_to_non_nullable
              as City?,
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      hasError: null == hasError
          ? _value.hasError
          : hasError // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$_DayHourForecastState implements _DayHourForecastState {
  const _$_DayHourForecastState(
      {required final List<MainList> perThreeHour,
      this.city,
      required this.isLoading,
      required this.hasError})
      : _perThreeHour = perThreeHour;

  final List<MainList> _perThreeHour;
  @override
  List<MainList> get perThreeHour {
    if (_perThreeHour is EqualUnmodifiableListView) return _perThreeHour;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_perThreeHour);
  }

  @override
  final City? city;
  @override
  final bool isLoading;
  @override
  final bool hasError;

  @override
  String toString() {
    return 'DayHourForecastState(perThreeHour: $perThreeHour, city: $city, isLoading: $isLoading, hasError: $hasError)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_DayHourForecastState &&
            const DeepCollectionEquality()
                .equals(other._perThreeHour, _perThreeHour) &&
            (identical(other.city, city) || other.city == city) &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading) &&
            (identical(other.hasError, hasError) ||
                other.hasError == hasError));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_perThreeHour),
      city,
      isLoading,
      hasError);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_DayHourForecastStateCopyWith<_$_DayHourForecastState> get copyWith =>
      __$$_DayHourForecastStateCopyWithImpl<_$_DayHourForecastState>(
          this, _$identity);
}

abstract class _DayHourForecastState implements DayHourForecastState {
  const factory _DayHourForecastState(
      {required final List<MainList> perThreeHour,
      final City? city,
      required final bool isLoading,
      required final bool hasError}) = _$_DayHourForecastState;

  @override
  List<MainList> get perThreeHour;
  @override
  City? get city;
  @override
  bool get isLoading;
  @override
  bool get hasError;
  @override
  @JsonKey(ignore: true)
  _$$_DayHourForecastStateCopyWith<_$_DayHourForecastState> get copyWith =>
      throw _privateConstructorUsedError;
}
