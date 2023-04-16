part of 'add_city_bloc.dart';

@freezed
class AddCityState with _$AddCityState {
  const factory AddCityState({
    required List<AddedCityItem> addedCities,
    SearchCityModel? searchingCities,
    required bool isLoading,
    required bool isError,
  }) = _AddCityState;

  factory AddCityState.initial() => const AddCityState(
        addedCities: [],
        isLoading: false,
        isError: false,
      );
}
