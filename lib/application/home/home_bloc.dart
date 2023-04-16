import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:clime_zone/domain/core/failure/main_failure.dart';
import 'package:clime_zone/domain/home/home_service.dart';
import 'package:clime_zone/domain/home/models/aqi_model/aq_index_model/list.dart';
import 'package:clime_zone/domain/home/models/main_weather_model/main_weather_model.dart';
import 'package:flutter/material.dart';
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

      final mainData =
          await homeService.getMainWeatherData('${event.lat}', '${event.lon}');
      final aqiData =
          await homeService.getAirQualityData('${event.lat}', '${event.lon}');

      mainData.fold(
        (failure) {
          if (failure == const MainFailure.clientFailure()) {
            return emit(const HomeState(
              aqiList: [],
              isLoading: false,
              isClientError: true,
              isServerError: false,
            ));
          } else {
            return emit(
              const HomeState(
                aqiList: [],
                isLoading: false,
                isClientError: false,
                isServerError: true,
              ),
            );
          }
        },
        (success) => emit(
          HomeState(
            aqiList: [],
            data: success,
            isLoading: false,
            isClientError: false,
            isServerError: false,
          ),
        ),
      );

      aqiData.fold(
        (failure) {
          if (failure == const MainFailure.clientFailure()) {
            return emit(
              HomeState(
                aqiList: [],
                data: state.data,
                isLoading: false,
                isClientError: true,
                isServerError: false,
              ),
            );
          } else {
            return emit(
              HomeState(
                aqiList: [],
                data: state.data,
                isLoading: false,
                isClientError: false,
                isServerError: true,
              ),
            );
          }
        },
        (success) => emit(
          HomeState(
            aqiList: success.list ?? [],
            data: state.data,
            isLoading: false,
            isClientError: false,
            isServerError: false,
          ),
        ),
      );
    });
  }
}
