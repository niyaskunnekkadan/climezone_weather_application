part of 'home_bloc_bloc.dart';

@freezed
class HomeState with _$HomeState {
  const factory HomeState({
    required List<SavedPlaceModel> listOfPlaces,
    required List<AQIDataList> aqiList,
    MainWeatherModel? data,
    required bool isLoading,
    required bool isError,
  }) = _HomeState;

  factory HomeState.initial() => const HomeState(
        listOfPlaces: [],
        aqiList: [],
        isLoading: false,
        isError: false,
      );
}
