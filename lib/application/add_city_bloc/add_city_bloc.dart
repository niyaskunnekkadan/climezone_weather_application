import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:clime_zone/domain/add_city/add_city_service.dart';
import 'package:clime_zone/domain/add_city/model/search_city_model/search_city_model.dart';
import 'package:clime_zone/domain/core/failure/main_failure.dart';
import 'package:clime_zone/domain/saved_places/saved_place_model.dart';
import 'package:clime_zone/infrastructure/saved_place_db/i_db_service.dart';
import 'package:clime_zone/presentation/add_city/screen_add_city.dart';
import 'package:clime_zone/presentation/add_city/widgets/added_cities_widget.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

part 'add_city_event.dart';
part 'add_city_state.dart';
part 'add_city_bloc.freezed.dart';

@injectable
class AddCityBloc extends Bloc<AddCityEvent, AddCityState> {
  AddCityService addCityService;
  AddCityBloc(this.addCityService) : super(AddCityState.initial()) {
    on<Initial>((event, emit) async {
      emit(state.copyWith(isLoading: true));
      final modelList = await IDBService().refreshUi();

      emit(
        state.copyWith(
          isLoading: false,
          addedCities: modelList,
          searchingCities: [],
          isError: false,
          isDelete: false,
        ),
      );
    });

    /*
    
    
      Searching places
    
     */
    on<Searching>((event, emit) async {
      emit(state.copyWith(isLoading: true));
      if (event.place.isEmpty) {
        emit(
          AddCityState(
            searchingCities: [],
            addedCities: state.addedCities,
            isLoading: false,
            isError: false,
            isDelete: false,
          ),
        );
      } else {
        final data = await addCityService.getCities(event.place);
        data.fold(
          (MainFailure fail) {
            return emit(
              AddCityState(
                searchingCities: [],
                addedCities: state.addedCities,
                isLoading: false,
                isError: true,
                isDelete: false,
              ),
            );
          },
          (List<SearchCityModel> success) => emit(
            AddCityState(
              addedCities: state.addedCities,
              searchingCities: success,
              isLoading: false,
              isError: false,
              isDelete: false,
            ),
          ),
        );
      }
    });

    /**
     * 
     * delete event
     * 
     */

    on<Delete>((event, emit) async {
      final modelList = await IDBService().refreshUi();

      emit(
        state.copyWith(
          isLoading: false,
          addedCities: modelList,
          searchingCities: [],
          isDelete: true,
        ),
      );
    });
  }
}
