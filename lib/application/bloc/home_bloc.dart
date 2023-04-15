import 'package:bloc/bloc.dart';
import 'package:clime_zone/domain/core/failure/main_failure.dart';
import 'package:clime_zone/domain/home/home_service.dart';
import 'package:clime_zone/domain/home/models/main_weather_model/main_weather_model.dart';

import 'package:clime_zone/infrastructure/home/i_home_service.dart';
import 'package:dartz/dartz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

part 'home_event.dart';
part 'home_state.dart';
part 'home_bloc.freezed.dart';

@injectable
class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeService homeService;
  HomeBloc(this.homeService) : super(HomeState.initial()) {
    on<MainCard>((event, emit) async {
      emit(state.copyWith(
        isLoading: true,
      ));
      final data =
          await homeService.getMainWeatherData('${event.lat}', '${event.lon}');

      data.fold(
        (failure) {
          if (failure == const MainFailure.clientFailure()) {
            return emit(state.copyWith(
              isLoading: false,
              isClientError: true,
            ));
          } else {
            return emit(state.copyWith(
              isLoading: false,
              isServerError: true,
            ));
          }
        },
        (success) => emit(state.copyWith(
          isLoading: false,
          data: success,
        )),
      );
    });
  }
}
