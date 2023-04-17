import 'package:bloc/bloc.dart';
import 'package:clime_zone/domain/core/failure/main_failure.dart';
import 'package:clime_zone/domain/home/home_service.dart';
import 'package:clime_zone/domain/home/models/day_hour_forecast_model/city.dart';
import 'package:clime_zone/domain/home/models/day_hour_forecast_model/day_hour_forecast_model.dart';
import 'package:clime_zone/domain/home/models/day_hour_forecast_model/list.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

part 'day_hour_forecast_event.dart';
part 'day_hour_forecast_state.dart';
part 'day_hour_forecast_bloc.freezed.dart';

@injectable
class DayHourForecastBloc
    extends Bloc<DayHourForecastEvent, DayHourForecastState> {
  HomeService homeService;
  DayHourForecastBloc(this.homeService)
      : super(DayHourForecastState.initial()) {
    on<Init>((event, emit) async {
      emit(state.copyWith(isLoading: true));
      final data = await homeService.getDayHourForecastData(
          '${event.lat}', '${event.lon}');

      data.fold(
        (MainFailure fail) => emit(state.copyWith(
          isLoading: false,
          hasError: true,
        )),
        (DayHourForecastModel success) => emit(DayHourForecastState(
          perThreeHour: success.list ?? [],
          city: success.city,
          isLoading: false,
          hasError: false,
        )),
      );
    });
  }
}
