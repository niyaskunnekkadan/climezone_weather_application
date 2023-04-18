import 'dart:ui';
import 'package:clime_zone/application/bloc/home_bloc_bloc.dart';
import 'package:clime_zone/application/day_hour_forecast/day_hour_forecast_bloc.dart';
import 'package:clime_zone/domain/saved_places/saved_place_model.dart';
import 'package:clime_zone/infrastructure/saved_place_db/i_db_service.dart';
import 'package:clime_zone/presentation/home/widgets/screen_widget.dart';
import 'package:clime_zone/presentation/widgets/error_widget.dart';
import 'package:clime_zone/presentation/widgets/loading_indicator.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ScreenHome extends StatelessWidget {
  const ScreenHome({
    super.key,
    required this.value,
  });

  final int value;

  @override
  Widget build(BuildContext context) {
    List<SavedPlaceModel>? model;

    WidgetsBinding.instance.addPostFrameCallback((_) async {
      // rebuilding ui
      model = await IDBService().refreshUi();
      // model passing state and emiting
      BlocProvider.of<HomeBloc>(context)
          .add(HomeEvent.initialLoadList(placeList: model!));
      // screen rebuilding the list of item (based of shared value)
      context.read<HomeBloc>().add(
            HomeEvent.mainCard(
              lat: model![value].latitude,
              lon: model![value].longitude,
            ),
          );
      context.read<DayHourForecastBloc>().add(
            DayHourForecastEvent.init(
              lat: model![value].latitude,
              lon: model![value].longitude,
            ),
          );
    });

    return Container(
      height: double.infinity,
      width: double.infinity,
      decoration: const BoxDecoration(
        image: DecorationImage(
          fit: BoxFit.cover,
          image: AssetImage(
            'assets/image/desktop-wallpaper-best-ultra-nature-data-src-full-261978-nature-mobile.jpg',
          ),
        ),
      ),
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 3, sigmaY: 3),
        child: BlocBuilder<HomeBloc, HomeState>(
          builder: (context, state) {
            //
            // state value isLoading is true
            if (state.isLoading) {
              return const KonstLoadingIndictor.white();
            }

            // state value isLoading is false
            else {
              return state.listOfPlaces.isEmpty

                  // state listOfPlaces is empty
                  ? const KonstErrorWidget.customize(
                      content: 'Empty saved place',
                      title: 'Oh no!',
                    )

                  // listOfPlaces has value
                  : ScreenHomeWidget(
                      lat: state.listOfPlaces[value].latitude,
                      lon: state.listOfPlaces[value].longitude,
                    );
            }
          },
        ),
      ),
    );
  }
}
