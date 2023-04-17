import 'dart:developer';

import 'package:clime_zone/application/day_hour_forecast/day_hour_forecast_bloc.dart';
import 'package:clime_zone/core/color.dart';
import 'package:clime_zone/core/sizes.dart';
import 'package:clime_zone/core/url.dart';
import 'package:clime_zone/domain/home/models/day_hour_forecast_model/list.dart';
import 'package:clime_zone/presentation/widgets/tiny_widgets.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

class ScreenDayForecast extends StatelessWidget {
  const ScreenDayForecast({
    super.key,
    required this.lat,
    required this.lon,
    required this.kState,
    this.visibleAddBtn = false,
  });

  final double lat;
  final double lon;
  final DayHourForecastState kState;
  final bool visibleAddBtn;

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context
          .read<DayHourForecastBloc>()
          .add(DayHourForecastEvent.init(lat: lat, lon: lon));
    });

    int i = 0;
    List<MainList> _list = [];

    _list.add(kState.perThreeHour[i]);
    _list.add(kState.perThreeHour[i + 8]);
    _list.add(kState.perThreeHour[i + 16]);
    _list.add(kState.perThreeHour[i + 24]);
    _list.add(kState.perThreeHour[i + 32]);

    return Scaffold(
      backgroundColor: kBlack,
      appBar: AppBar(
        iconTheme: const IconThemeData(
          color: Colors.white70,
        ),
        backgroundColor: Colors.transparent,
        centerTitle: true,
        title: const Text(
          '5 Day Forecast',
          style: TextStyle(
            color: kWhite,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      body: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          final data = _list[index];

          String stringToDate(String dt) {
            DateTime date = DateTime.parse(dt);
            String formatedDate = DateFormat.yMMMMd('en_US').format(date);
            if (date.day == DateTime.now().day) {
              formatedDate = 'Today';
            } else if (date.day ==
                DateTime.now().add(const Duration(hours: 24)).day) {
              formatedDate = 'Tommorrow';
            } else {
              String d = DateFormat.MMMEd('en_US').format(date);
              d = d.split(' ').first.substring(0, 3);
              formatedDate = d;
            }
            return formatedDate;
          }

          return DayForeCastItem(
            day: stringToDate(data.dtTxt!),
            date:
                '${DateTime.parse(data.dtTxt!).day}/${DateTime.parse(data.dtTxt!).month}',
            minTemp: kelvinToCelcius(data.main!.tempMin),
            maxTemp: kelvinToCelcius(data.main!.tempMax),
            windSpeed: data.wind!.speed ?? 0,
            iconId: data.weather![0].icon ?? '01d',
          );
        },
        separatorBuilder: (context, index) {
          return const VerticalDivider(
            thickness: .1,
          );
        },
        itemCount: 5,
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

class DayForeCastItem extends StatelessWidget {
  const DayForeCastItem({
    super.key,
    required this.day,
    required this.date,
    required this.minTemp,
    required this.maxTemp,
    required this.windSpeed,
    required this.iconId,
  });

  final String day;
  final String date;
  final int minTemp;
  final int maxTemp;
  final double windSpeed;
  final String iconId;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Column(
        children: [
          SizedBox(
            height: 40,
            width: 100,
            child: Align(
              alignment: Alignment.bottomCenter,
              child: Text(
                day,
                style: const TextStyle(
                  color: kWhite,
                ),
              ),
            ),
          ),
          Text(
            date,
            style: TextStyle(
              color: kWhite.withOpacity(.8),
            ),
          ),
          Image.network(
            'https://openweathermap.org/img/wn/${iconId}@2x.png',
            width: 40,
            height: 40,
            loadingBuilder: (_, child, loadingProgress) {
              return child;
            },
            errorBuilder: (_, error, stackTrace) {
              return const Icon(
                CupertinoIcons.cloud,
                color: kWhite,
              );
            },
          ),
          height10,
          SizedBox(
            height: 100,
            width: 100,
            child: Stack(
              alignment: Alignment.center,
              children: [
                Positioned(
                  top: minTemp - 15,
                  child: Text(
                    '$minTemp°',
                    style: const TextStyle(
                      color: Colors.green,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
                Positioned(
                  top: maxTemp + 15,
                  child: Text(
                    '$maxTemp°',
                    style: const TextStyle(
                      color: Colors.red,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ],
            ),
          ),
          height10,
          Column(
            children: [
              Icon(
                CupertinoIcons.wind,
                color: kWhite.withOpacity(.6),
              ),
              Text(
                windSpeed == 0 ? nullValue : '$windSpeed m/s',
                style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
