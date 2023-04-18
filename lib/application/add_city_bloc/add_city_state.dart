part of 'add_city_bloc.dart';

@freezed
class AddCityState with _$AddCityState {
  const factory AddCityState({
    required List<SavedPlaceModel> addedCities,
    required List<SearchCityModel> searchingCities,
    required bool isLoading,
    required bool isError,
    required bool isDelete,
  }) = _AddCityState;

  factory AddCityState.initial() => const AddCityState(
        addedCities: [],
        searchingCities: [],
        isLoading: false,
        isError: false,
        isDelete: false,
      );
}
