part of 'home_bloc.dart';

@freezed
class HomeState with _$HomeState {
  const factory HomeState({
    MainWeatherModel? data,
    required bool isLoading,
    required bool isClientError,
    required bool isServerError,
  }) = _HomeState;

  factory HomeState.initial() => const HomeState(
        isLoading: false,
        isClientError: false,
        isServerError: false,
      );
}
