part of 'home_bloc.dart';

@freezed
class HomeEvent with _$HomeEvent {
  const factory HomeEvent.mainCard({
    required double lat,
    required double lon,
  }) = MainCard;
}
