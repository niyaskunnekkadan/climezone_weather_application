// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'home_bloc_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$HomeEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(List<SavedPlaceModel> placeList) initialLoadList,
    required TResult Function(double lat, double lon) mainCard,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(List<SavedPlaceModel> placeList)? initialLoadList,
    TResult? Function(double lat, double lon)? mainCard,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(List<SavedPlaceModel> placeList)? initialLoadList,
    TResult Function(double lat, double lon)? mainCard,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_InitialLoadList value) initialLoadList,
    required TResult Function(MainCard value) mainCard,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_InitialLoadList value)? initialLoadList,
    TResult? Function(MainCard value)? mainCard,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_InitialLoadList value)? initialLoadList,
    TResult Function(MainCard value)? mainCard,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $HomeEventCopyWith<$Res> {
  factory $HomeEventCopyWith(HomeEvent value, $Res Function(HomeEvent) then) =
      _$HomeEventCopyWithImpl<$Res, HomeEvent>;
}

/// @nodoc
class _$HomeEventCopyWithImpl<$Res, $Val extends HomeEvent>
    implements $HomeEventCopyWith<$Res> {
  _$HomeEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$_InitialLoadListCopyWith<$Res> {
  factory _$$_InitialLoadListCopyWith(
          _$_InitialLoadList value, $Res Function(_$_InitialLoadList) then) =
      __$$_InitialLoadListCopyWithImpl<$Res>;
  @useResult
  $Res call({List<SavedPlaceModel> placeList});
}

/// @nodoc
class __$$_InitialLoadListCopyWithImpl<$Res>
    extends _$HomeEventCopyWithImpl<$Res, _$_InitialLoadList>
    implements _$$_InitialLoadListCopyWith<$Res> {
  __$$_InitialLoadListCopyWithImpl(
      _$_InitialLoadList _value, $Res Function(_$_InitialLoadList) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? placeList = null,
  }) {
    return _then(_$_InitialLoadList(
      placeList: null == placeList
          ? _value._placeList
          : placeList // ignore: cast_nullable_to_non_nullable
              as List<SavedPlaceModel>,
    ));
  }
}

/// @nodoc

class _$_InitialLoadList implements _InitialLoadList {
  const _$_InitialLoadList({required final List<SavedPlaceModel> placeList})
      : _placeList = placeList;

  final List<SavedPlaceModel> _placeList;
  @override
  List<SavedPlaceModel> get placeList {
    if (_placeList is EqualUnmodifiableListView) return _placeList;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_placeList);
  }

  @override
  String toString() {
    return 'HomeEvent.initialLoadList(placeList: $placeList)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_InitialLoadList &&
            const DeepCollectionEquality()
                .equals(other._placeList, _placeList));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_placeList));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_InitialLoadListCopyWith<_$_InitialLoadList> get copyWith =>
      __$$_InitialLoadListCopyWithImpl<_$_InitialLoadList>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(List<SavedPlaceModel> placeList) initialLoadList,
    required TResult Function(double lat, double lon) mainCard,
  }) {
    return initialLoadList(placeList);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(List<SavedPlaceModel> placeList)? initialLoadList,
    TResult? Function(double lat, double lon)? mainCard,
  }) {
    return initialLoadList?.call(placeList);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(List<SavedPlaceModel> placeList)? initialLoadList,
    TResult Function(double lat, double lon)? mainCard,
    required TResult orElse(),
  }) {
    if (initialLoadList != null) {
      return initialLoadList(placeList);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_InitialLoadList value) initialLoadList,
    required TResult Function(MainCard value) mainCard,
  }) {
    return initialLoadList(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_InitialLoadList value)? initialLoadList,
    TResult? Function(MainCard value)? mainCard,
  }) {
    return initialLoadList?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_InitialLoadList value)? initialLoadList,
    TResult Function(MainCard value)? mainCard,
    required TResult orElse(),
  }) {
    if (initialLoadList != null) {
      return initialLoadList(this);
    }
    return orElse();
  }
}

abstract class _InitialLoadList implements HomeEvent {
  const factory _InitialLoadList(
      {required final List<SavedPlaceModel> placeList}) = _$_InitialLoadList;

  List<SavedPlaceModel> get placeList;
  @JsonKey(ignore: true)
  _$$_InitialLoadListCopyWith<_$_InitialLoadList> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$MainCardCopyWith<$Res> {
  factory _$$MainCardCopyWith(
          _$MainCard value, $Res Function(_$MainCard) then) =
      __$$MainCardCopyWithImpl<$Res>;
  @useResult
  $Res call({double lat, double lon});
}

/// @nodoc
class __$$MainCardCopyWithImpl<$Res>
    extends _$HomeEventCopyWithImpl<$Res, _$MainCard>
    implements _$$MainCardCopyWith<$Res> {
  __$$MainCardCopyWithImpl(_$MainCard _value, $Res Function(_$MainCard) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? lat = null,
    Object? lon = null,
  }) {
    return _then(_$MainCard(
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

class _$MainCard implements MainCard {
  const _$MainCard({required this.lat, required this.lon});

  @override
  final double lat;
  @override
  final double lon;

  @override
  String toString() {
    return 'HomeEvent.mainCard(lat: $lat, lon: $lon)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MainCard &&
            (identical(other.lat, lat) || other.lat == lat) &&
            (identical(other.lon, lon) || other.lon == lon));
  }

  @override
  int get hashCode => Object.hash(runtimeType, lat, lon);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$MainCardCopyWith<_$MainCard> get copyWith =>
      __$$MainCardCopyWithImpl<_$MainCard>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(List<SavedPlaceModel> placeList) initialLoadList,
    required TResult Function(double lat, double lon) mainCard,
  }) {
    return mainCard(lat, lon);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(List<SavedPlaceModel> placeList)? initialLoadList,
    TResult? Function(double lat, double lon)? mainCard,
  }) {
    return mainCard?.call(lat, lon);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(List<SavedPlaceModel> placeList)? initialLoadList,
    TResult Function(double lat, double lon)? mainCard,
    required TResult orElse(),
  }) {
    if (mainCard != null) {
      return mainCard(lat, lon);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_InitialLoadList value) initialLoadList,
    required TResult Function(MainCard value) mainCard,
  }) {
    return mainCard(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_InitialLoadList value)? initialLoadList,
    TResult? Function(MainCard value)? mainCard,
  }) {
    return mainCard?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_InitialLoadList value)? initialLoadList,
    TResult Function(MainCard value)? mainCard,
    required TResult orElse(),
  }) {
    if (mainCard != null) {
      return mainCard(this);
    }
    return orElse();
  }
}

abstract class MainCard implements HomeEvent {
  const factory MainCard(
      {required final double lat, required final double lon}) = _$MainCard;

  double get lat;
  double get lon;
  @JsonKey(ignore: true)
  _$$MainCardCopyWith<_$MainCard> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$HomeState {
  List<SavedPlaceModel> get listOfPlaces => throw _privateConstructorUsedError;
  List<AQIDataList> get aqiList => throw _privateConstructorUsedError;
  MainWeatherModel? get data => throw _privateConstructorUsedError;
  bool get isLoading => throw _privateConstructorUsedError;
  bool get isError => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $HomeStateCopyWith<HomeState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $HomeStateCopyWith<$Res> {
  factory $HomeStateCopyWith(HomeState value, $Res Function(HomeState) then) =
      _$HomeStateCopyWithImpl<$Res, HomeState>;
  @useResult
  $Res call(
      {List<SavedPlaceModel> listOfPlaces,
      List<AQIDataList> aqiList,
      MainWeatherModel? data,
      bool isLoading,
      bool isError});
}

/// @nodoc
class _$HomeStateCopyWithImpl<$Res, $Val extends HomeState>
    implements $HomeStateCopyWith<$Res> {
  _$HomeStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? listOfPlaces = null,
    Object? aqiList = null,
    Object? data = freezed,
    Object? isLoading = null,
    Object? isError = null,
  }) {
    return _then(_value.copyWith(
      listOfPlaces: null == listOfPlaces
          ? _value.listOfPlaces
          : listOfPlaces // ignore: cast_nullable_to_non_nullable
              as List<SavedPlaceModel>,
      aqiList: null == aqiList
          ? _value.aqiList
          : aqiList // ignore: cast_nullable_to_non_nullable
              as List<AQIDataList>,
      data: freezed == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as MainWeatherModel?,
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      isError: null == isError
          ? _value.isError
          : isError // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_HomeStateCopyWith<$Res> implements $HomeStateCopyWith<$Res> {
  factory _$$_HomeStateCopyWith(
          _$_HomeState value, $Res Function(_$_HomeState) then) =
      __$$_HomeStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {List<SavedPlaceModel> listOfPlaces,
      List<AQIDataList> aqiList,
      MainWeatherModel? data,
      bool isLoading,
      bool isError});
}

/// @nodoc
class __$$_HomeStateCopyWithImpl<$Res>
    extends _$HomeStateCopyWithImpl<$Res, _$_HomeState>
    implements _$$_HomeStateCopyWith<$Res> {
  __$$_HomeStateCopyWithImpl(
      _$_HomeState _value, $Res Function(_$_HomeState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? listOfPlaces = null,
    Object? aqiList = null,
    Object? data = freezed,
    Object? isLoading = null,
    Object? isError = null,
  }) {
    return _then(_$_HomeState(
      listOfPlaces: null == listOfPlaces
          ? _value._listOfPlaces
          : listOfPlaces // ignore: cast_nullable_to_non_nullable
              as List<SavedPlaceModel>,
      aqiList: null == aqiList
          ? _value._aqiList
          : aqiList // ignore: cast_nullable_to_non_nullable
              as List<AQIDataList>,
      data: freezed == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as MainWeatherModel?,
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      isError: null == isError
          ? _value.isError
          : isError // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$_HomeState implements _HomeState {
  const _$_HomeState(
      {required final List<SavedPlaceModel> listOfPlaces,
      required final List<AQIDataList> aqiList,
      this.data,
      required this.isLoading,
      required this.isError})
      : _listOfPlaces = listOfPlaces,
        _aqiList = aqiList;

  final List<SavedPlaceModel> _listOfPlaces;
  @override
  List<SavedPlaceModel> get listOfPlaces {
    if (_listOfPlaces is EqualUnmodifiableListView) return _listOfPlaces;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_listOfPlaces);
  }

  final List<AQIDataList> _aqiList;
  @override
  List<AQIDataList> get aqiList {
    if (_aqiList is EqualUnmodifiableListView) return _aqiList;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_aqiList);
  }

  @override
  final MainWeatherModel? data;
  @override
  final bool isLoading;
  @override
  final bool isError;

  @override
  String toString() {
    return 'HomeState(listOfPlaces: $listOfPlaces, aqiList: $aqiList, data: $data, isLoading: $isLoading, isError: $isError)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_HomeState &&
            const DeepCollectionEquality()
                .equals(other._listOfPlaces, _listOfPlaces) &&
            const DeepCollectionEquality().equals(other._aqiList, _aqiList) &&
            (identical(other.data, data) || other.data == data) &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading) &&
            (identical(other.isError, isError) || other.isError == isError));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_listOfPlaces),
      const DeepCollectionEquality().hash(_aqiList),
      data,
      isLoading,
      isError);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_HomeStateCopyWith<_$_HomeState> get copyWith =>
      __$$_HomeStateCopyWithImpl<_$_HomeState>(this, _$identity);
}

abstract class _HomeState implements HomeState {
  const factory _HomeState(
      {required final List<SavedPlaceModel> listOfPlaces,
      required final List<AQIDataList> aqiList,
      final MainWeatherModel? data,
      required final bool isLoading,
      required final bool isError}) = _$_HomeState;

  @override
  List<SavedPlaceModel> get listOfPlaces;
  @override
  List<AQIDataList> get aqiList;
  @override
  MainWeatherModel? get data;
  @override
  bool get isLoading;
  @override
  bool get isError;
  @override
  @JsonKey(ignore: true)
  _$$_HomeStateCopyWith<_$_HomeState> get copyWith =>
      throw _privateConstructorUsedError;
}
