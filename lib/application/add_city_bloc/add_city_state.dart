part of 'add_city_bloc.dart';

@freezed
class AddCityState with _$AddCityState {
  const factory AddCityState({
    required List<AddedCityItem> addedCities,
    required List<SearchCityModel> searchingCities,
    required bool isLoading,
    required bool isError,
  }) = _AddCityState;

  factory AddCityState.initial() => const AddCityState(
        addedCities: [],
        searchingCities: [],
        isLoading: false,
        isError: false,
      );
}
