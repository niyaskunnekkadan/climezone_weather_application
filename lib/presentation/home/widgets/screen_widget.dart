import 'package:clime_zone/application/bloc/home_bloc_bloc.dart';
import 'package:clime_zone/application/day_hour_forecast/day_hour_forecast_bloc.dart';
import 'package:clime_zone/core/methods.dart';
import 'package:clime_zone/core/sizes.dart';
import 'package:clime_zone/presentation/home/widgets/credit_text.dart';
import 'package:clime_zone/presentation/home/widgets/day_forecast_widget.dart';
import 'package:clime_zone/presentation/home/widgets/day_hour_forecast_widget.dart';
import 'package:clime_zone/presentation/home/widgets/details_card.dart';
import 'package:clime_zone/presentation/home/widgets/konst_appbar.dart';
import 'package:clime_zone/presentation/home/widgets/main_weather_card.dart';
import 'package:clime_zone/presentation/widgets/error_widget.dart';
import 'package:clime_zone/presentation/widgets/loading_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ScreenHomeWidget extends StatelessWidget {
  const ScreenHomeWidget({
    super.key,
    required this.lat,
    required this.lon,
  });

  final double lat;
  final double lon;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.white.withOpacity(.1),
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(size.height * .1),
        child: BlocBuilder<HomeBloc, HomeState>(
          builder: (context, state) =>
              KonstAppBar(size: size, kState: state, lat: lat, lon: lon),
        ),
      ),
      body: RefreshIndicator(
        onRefresh: () async {
          context.read<HomeBloc>().add(HomeEvent.mainCard(lat: lat, lon: lon));
          context
              .read<DayHourForecastBloc>()
              .add(DayHourForecastEvent.init(lat: lat, lon: lon));
        },
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: BlocBuilder<HomeBloc, HomeState>(
            builder: (context, state) {
              if (state.isLoading) {
                return const KonstLoadingIndictor.white();
              } else if (state.isError) {
                return const KonstErrorWidget();
              } else {
                final data = state.data;
                return ListView(
                  children: [
                    MainWeatherCard(
                      kState: state,
                      temprature: '${kelvinToCelcius(data!.main!.temp)}',
                      weatherStatus: '${data.weather![0].main}',
                      minTemp: '${kelvinToCelcius(data.main!.tempMin)}',
                      maxTemp: '${kelvinToCelcius(data.main!.tempMax)}',
                      aqiLevel: '${state.aqiList[0].main!.aqi}',
                      lat: lat,
                      lon: lon,
                    ),
                    BlocBuilder<DayHourForecastBloc, DayHourForecastState>(
                      builder: (context, state) {
                        if (state.isLoading) {
                          return const KonstLoadingIndictor.white();
                        }
                        if (state.hasError) {
                          return const KonstErrorWidget();
                        }
                        if (state.perThreeHour.isEmpty) {
                          return const KonstErrorWidget.customize(
                            content: 'Dayforecast details unavailable',
                            title: 'Oh no!',
                          );
                        }
                        return Column(
                          children: [
                            DayForecastWidget(
                              threeHourForecsat: state.perThreeHour,
                              lat: lat,
                              lon: lon,
                            ),
                            height20,
                            DayHourWidget(
                              lat: lat,
                              lon: lon,
                              perThreeHours: state.perThreeHour,
                            )
                          ],
                        );
                      },
                    ),
                    DetailsCard(
                      humidity: state.data!.main!.humidity ?? 0,
                      feelsLike: kelvinToCelcius(state.data!.main!.feelsLike),
                      windSpeed: state.data!.wind!.speed ?? 0,
                      pressure: state.data!.main!.pressure ?? 0,
                    ),
                    CreditText(),
                  ],
                );
              }
            },
          ),
        ),
      ),
    );
  }
}
