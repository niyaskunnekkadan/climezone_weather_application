import 'package:clime_zone/application/day_hour_forecast/day_hour_forecast_bloc.dart';
import 'package:clime_zone/core/color.dart';
import 'package:clime_zone/core/methods.dart';
import 'package:clime_zone/domain/home/models/day_hour_forecast_model/list.dart';
import 'package:clime_zone/presentation/day_forecast/widgets/day_cast_item_widget.dart';
import 'package:clime_zone/presentation/widgets/error_widget.dart';
import 'package:clime_zone/presentation/widgets/loading_indicator.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ScreenDayForecast extends StatelessWidget {
  const ScreenDayForecast({
    super.key,
    required this.lat,
    required this.lon,
    this.isdayPage = true,
  });

  final double lat;
  final double lon;
  final bool isdayPage;

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context
          .read<DayHourForecastBloc>()
          .add(DayHourForecastEvent.init(lat: lat, lon: lon));
    });

    return Scaffold(
      backgroundColor: kBlack,
      appBar: AppBar(
        iconTheme: const IconThemeData(
          color: Colors.white70,
        ),
        backgroundColor: Colors.transparent,
        centerTitle: true,
        title: Text(
          isdayPage ? '5 Day Forecast' : '120 Hours Forecast',
          style: const TextStyle(
            color: kWhite,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      body: BlocBuilder<DayHourForecastBloc, DayHourForecastState>(
        builder: (context, state) {
          if (state.isLoading) {
            return const KonstLoadingIndictor.white();
          }
          if (state.hasError) {
            return const KonstErrorWidget();
          } else {
            int i = 0;
            List<MainList> _list = [];

            if (state.perThreeHour.isNotEmpty) {
              _list.add(state.perThreeHour[i]);
              _list.add(state.perThreeHour[i + 8]);
              _list.add(state.perThreeHour[i + 16]);
              _list.add(state.perThreeHour[i + 24]);
              _list.add(state.perThreeHour[i + 32]);
            }

            return isdayPage
                ? Column(
                    children: [
                      Text(
                        'In ${state.city!.name}',
                        style: TextStyle(color: kWhite.withOpacity(.7)),
                      ),
                      Expanded(
                        child: ListView.separated(
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (context, index) {
                            final data = _list[index];
                            if (state.isLoading) {
                              return const Center(
                                  child: CupertinoActivityIndicator(
                                color: Colors.white,
                              ));
                            } else if (state.perThreeHour.isNotEmpty) {
                              return DayForeCastItem(
                                day: stringToDate(data.dtTxt!),
                                date:
                                    '${DateTime.parse(data.dtTxt!).day}/${DateTime.parse(data.dtTxt!).month}',
                                minTemp: kelvinToCelcius(data.main!.tempMin),
                                maxTemp: kelvinToCelcius(data.main!.tempMax),
                                windSpeed: data.wind!.speed ?? 0,
                                iconId: data.weather![0].icon ?? '01d',
                                kPadding: 10,
                              );
                            } else if (state.hasError) {
                              return const Center(
                                child: Text(
                                  'data',
                                  style: TextStyle(color: Colors.white),
                                ),
                              );
                            } else {
                              return const CupertinoActivityIndicator(
                                color: Colors.white,
                              );
                            }
                          },
                          separatorBuilder: (context, index) {
                            return const VerticalDivider(
                              thickness: .1,
                            );
                          },
                          itemCount: _list.length,
                        ),
                      ),
                    ],
                  )
                : Column(
                    children: [
                      Text(
                        'In ${state.city!.name}',
                        style: TextStyle(color: kWhite.withOpacity(.7)),
                      ),
                      Expanded(
                        child: ListView.separated(
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (context, index) {
                            final data = state.perThreeHour[index];
                            final time = DateTime.parse(data.dtTxt!)
                                .add(const Duration(hours: 5, minutes: 30));

                            final dt =
                                DateTime.parse(data.dtTxt!).timeZoneOffset;

                            return DayForeCastItem(
                              day:
                                  '${DateTime.parse(data.dtTxt!).day}/${DateTime.parse(data.dtTxt!).month}',
                              date:
                                  " ${time.hour.toString()} : ${time.minute.toString()}",
                              minTemp: kelvinToCelcius(data.main!.tempMin),
                              maxTemp: kelvinToCelcius(data.main!.tempMax),
                              windSpeed: data.wind!.speed ?? 0,
                              iconId: data.weather![0].icon ?? '01d',
                              kPadding: 10,
                            );
                          },
                          separatorBuilder: (context, index) {
                            return const VerticalDivider(
                              thickness: .1,
                            );
                          },
                          itemCount: state.perThreeHour.length,
                        ),
                      ),
                    ],
                  );
          }
        },
      ),
    );
  }
}
