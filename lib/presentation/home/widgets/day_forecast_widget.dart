import 'package:clime_zone/application/day_hour_forecast/day_hour_forecast_bloc.dart';
import 'package:clime_zone/core/color.dart';
import 'package:clime_zone/core/url.dart';
import 'package:clime_zone/presentation/day_forecast/screen_day_forecast.dart';
import 'package:clime_zone/presentation/home/widgets/konst_location_btn.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class DayForecastWidget extends StatelessWidget {
  const DayForecastWidget({
    super.key,
    required this.size,
    required this.kState,
    required this.lat,
    required this.lon,
  });

  final Size size;
  final DayHourForecastState kState;
  final double lat;
  final double lon;

  @override
  Widget build(BuildContext context) {
    int i = 0;
    return Container(
      decoration: BoxDecoration(
        color: Colors.black.withOpacity(.2),
        borderRadius: BorderRadius.circular(20),
      ),
      padding: const EdgeInsets.all(20),
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
            value: '${kelvinToCelcius(kState.perThreeHour[1].main!.temp)}',
            iconId: '${kState.perThreeHour[i].weather![0].icon}',
          ),
          DayForecastDayItem(
            size: size,
            label: '${kState.perThreeHour[i + 8].dtTxt}',
            value: '${kelvinToCelcius(kState.perThreeHour[18].main!.temp)}',
            iconId: '${kState.perThreeHour[i + 8].weather![0].icon}',
          ),
          DayForecastDayItem(
            size: size,
            label: '${kState.perThreeHour[i + 16].dtTxt}',
            value: '${kelvinToCelcius(kState.perThreeHour[34].main!.temp)}',
            iconId: '${kState.perThreeHour[i + 16].weather![0].icon}',
          ),
          KonstElevatedButton(
            size: size,
            label: '5 Days Forecast',
            icon: CupertinoIcons.cloud,
            color: kBlack,
            onClick: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ScreenDayForecast(
                        key: Key('direct_navigation_daypage'),
                        lat: lat,
                        lon: lon,
                        kState: kState),
                  ));
            },
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
    required this.iconId,
  });

  final Size size;
  final String label;
  final String value;
  final String iconId;

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
      leading: Image.network(
        iconUrl.replaceFirst('{icon}', iconId),
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
