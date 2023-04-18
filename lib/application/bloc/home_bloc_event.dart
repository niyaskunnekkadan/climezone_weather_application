part of 'home_bloc_bloc.dart';

@freezed
class HomeEvent with _$HomeEvent {
  const factory HomeEvent.initialLoadList({
    required List<SavedPlaceModel> placeList,
  }) = _InitialLoadList;

  const factory HomeEvent.mainCard({
    required double lat,
    required double lon,
  }) = MainCard;
}
