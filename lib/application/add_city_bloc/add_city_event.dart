part of 'add_city_bloc.dart';

@freezed
class AddCityEvent with _$AddCityEvent {
  const factory AddCityEvent.initial() = Initial;
  const factory AddCityEvent.searching({
    required String place,
  }) = Searching;
}
