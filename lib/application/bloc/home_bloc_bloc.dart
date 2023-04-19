import 'package:bloc/bloc.dart';
import 'package:clime_zone/domain/core/failure/main_failure.dart';
import 'package:clime_zone/domain/home/home_service.dart';
import 'package:clime_zone/domain/home/models/aqi_model/aq_index_model/list.dart';
import 'package:clime_zone/domain/home/models/main_weather_model/main_weather_model.dart';
import 'package:clime_zone/domain/saved_places/saved_place_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

part 'home_bloc_event.dart';
part 'home_bloc_state.dart';
part 'home_bloc_bloc.freezed.dart';

@injectable
class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeService homeService;
  HomeBloc(this.homeService) : super(HomeState.initial()) {
    /*
    
      Initial Event
    
     */
    on<_InitialLoadList>((event, emit) async {
      emit(state.copyWith(
        isLoading: false,
        listOfPlaces: event.placeList,
      ));
    });

    /*
    
      MainData Weather Data Feching Event
    
     */
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
          HomeState(
            listOfPlaces: state.listOfPlaces,
            aqiList: [],
            isLoading: false,
            isError: true,
          );
        },
        (success) => emit(
          HomeState(
            listOfPlaces: state.listOfPlaces,
            aqiList: [],
            data: success,
            isLoading: false,
            isError: false,
          ),
        ),
      );

      /*
    
      AQI Data Fetching Event
    
     */
      aqiData.fold(
        (failure) {
          HomeState(
            listOfPlaces: state.listOfPlaces,
            aqiList: [],
            data: state.data,
            isLoading: false,
            isError: true,
          );
        },
        (success) => emit(
          HomeState(
            listOfPlaces: state.listOfPlaces,
            aqiList: success.list ?? [],
            data: state.data,
            isLoading: false,
            isError: false,
          ),
        ),
      );
    });
  }
}
