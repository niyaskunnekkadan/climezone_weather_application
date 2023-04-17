import 'package:clime_zone/application/day_hour_forecast/day_hour_forecast_bloc.dart';
import 'package:clime_zone/core/color.dart';
import 'package:clime_zone/core/url.dart';
import 'package:clime_zone/presentation/home/widgets/konst_location_btn.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class DayForecastWidget extends StatelessWidget {
  const DayForecastWidget({
    super.key,
    required this.size,
    required this.kState,
  });

  final Size size;
  final DayHourForecastState kState;

  @override
  Widget build(BuildContext context) {
    int i = 0;
    return Container(
      //height: size.height * .2,
      decoration: BoxDecoration(
        color: Colors.black.withOpacity(.2),
        borderRadius: BorderRadius.circular(20),
      ),
      padding: const EdgeInsets.all(14),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Day Forecast',
                style: TextStyle(
                  color: kWhite.withOpacity(.6),
                  fontSize: size.height * .02,
                  fontWeight: FontWeight.w500,
                ),
              ),
              const Icon(Icons.cloud),
            ],
          ),
          DayForecastDayItem(
              size: size,
              label: '${kState.perThreeHour[i].dtTxt}',
              value: '${kelvinToCelcius(kState.perThreeHour[1].main!.temp)}'),
          DayForecastDayItem(
              size: size,
              label: '${kState.perThreeHour[i + 8].dtTxt}',
              value: '${kelvinToCelcius(kState.perThreeHour[18].main!.temp)}'),
          DayForecastDayItem(
              size: size,
              label: '${kState.perThreeHour[i + 16].dtTxt}',
              value: '${kelvinToCelcius(kState.perThreeHour[34].main!.temp)}'),
          KonstElevatedButton(
            size: size,
            label: '5 Days Forecast',
            icon: CupertinoIcons.cloud,
            color: kBlack,
            onClick: () {},
          ),
        ],
      ),
    );
  }
}

class DayForecastDayItem extends StatelessWidget {
  const DayForecastDayItem({
    super.key,
    required this.size,
    required this.label,
    required this.value,
  });

  final Size size;
  final String label;
  final String value;

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

  @override
  Widget build(BuildContext context) {
    return ListTile(
      textColor: kWhite,
      iconColor: kWhite,
      title: Text(
        stringToDate(label),
        style: TextStyle(
          fontSize: size.height * .025,
        ),
      ),
      trailing: Text(
        '$value°',
        style: TextStyle(
          fontSize: size.height * .025,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }
}
