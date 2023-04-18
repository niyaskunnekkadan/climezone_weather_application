import 'dart:developer';
import 'package:clime_zone/application/day_hour_forecast/day_hour_forecast_bloc.dart';
import 'package:clime_zone/core/color.dart';
import 'package:clime_zone/core/sizes.dart';
import 'package:clime_zone/core/url.dart';
import 'package:clime_zone/domain/home/models/day_hour_forecast_model/list.dart';
import 'package:clime_zone/presentation/day_forecast/widgets/day_cast_item_widget.dart';
import 'package:clime_zone/presentation/widgets/tiny_widgets.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

String stringToDate(String dt) {
  DateTime date = DateTime.parse(dt);
  String formatedDate = DateFormat.yMMMMd('en_US').format(date);
  if (date.day == DateTime.now().day) {
    formatedDate = 'Today';
  } else if (date.day == DateTime.now().add(const Duration(hours: 24)).day) {
    formatedDate = 'Tommorrow';
  } else {
    String d = DateFormat.MMMEd('en_US').format(date);
    d = d.split(' ').first.substring(0, 3);
    formatedDate = d;
  }
  return formatedDate;
}

class ScreenDayForecast extends StatelessWidget {
  const ScreenDayForecast({
    super.key,
    required this.lat,
    required this.lon,
    required this.kState,
    this.visibleAddBtn = false,
    this.isdayPage = true,
  });

  final double lat;
  final double lon;
  final DayHourForecastState kState;
  final bool visibleAddBtn;
  final bool isdayPage;

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context
          .read<DayHourForecastBloc>()
          .add(DayHourForecastEvent.init(lat: lat, lon: lon));
    });
    int i = 0;
    List<MainList> _list = [];

    if (kState.perThreeHour.isNotEmpty) {
      _list.add(kState.perThreeHour[i]);
      _list.add(kState.perThreeHour[i + 8]);
      _list.add(kState.perThreeHour[i + 16]);
      _list.add(kState.perThreeHour[i + 24]);
      _list.add(kState.perThreeHour[i + 32]);
    }

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
      body: isdayPage
          ? ListView.separated(
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                final data = _list[index];
                if (kState.isLoading) {
                  return const Center(
                      child: CupertinoActivityIndicator(
                    color: Colors.white,
                  ));
                } else if (kState.perThreeHour.isNotEmpty) {
                  log('Load=>>   6.0');
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
                } else if (kState.hasError) {
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
                log('Load=>>   9.0');
                return const VerticalDivider(
                  thickness: .1,
                );
              },
              itemCount: _list.length,
            )
          : BlocBuilder<DayHourForecastBloc, DayHourForecastState>(
              builder: (context, state) {
                if (state.isLoading) {
                  return const Center(
                    child: CupertinoActivityIndicator(color: Colors.white),
                  );
                }
                if (state.hasError) {
                  return loadingIndictor;
                } else {
                  return ListView.separated(
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      final data = state.perThreeHour[index];
                      log(state.city!.name.toString());

                      return DayForeCastItem(
                        day:
                            '${DateTime.parse(data.dtTxt!).day}/${DateTime.parse(data.dtTxt!).month}',
                        date: data.dtTxt!.split(' ').last.substring(0, 5),
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
                  );
                }
              },
            ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: Visibility(
        visible: visibleAddBtn,
        child: FloatingActionButton.extended(
          onPressed: () {},
          label: const Text('Add To Home'),
        ),
      ),
    );
  }
}
