import 'package:clime_zone/application/day_hour_forecast/day_hour_forecast_bloc.dart';
import 'package:clime_zone/core/color.dart';
import 'package:clime_zone/core/sizes.dart';
import 'package:clime_zone/core/url.dart';
import 'package:clime_zone/domain/home/models/day_hour_forecast_model/list.dart';
import 'package:clime_zone/presentation/day_forecast/screen_day_forecast.dart';
import 'package:clime_zone/presentation/day_forecast/widgets/day_cast_item_widget.dart';
import 'package:clime_zone/presentation/home/widgets/konst_location_btn.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DayHourWidget extends StatelessWidget {
  const DayHourWidget({
    super.key,
    required this.lat,
    required this.lon,
    required this.perThreeHours,
  });

  final double lat;
  final double lon;
  final List<MainList> perThreeHours;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
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
                '48 Hours Forecast(3-hours gap)',
                style: TextStyle(
                  color: kWhite.withOpacity(.6),
                  fontSize: size.height * .02,
                  fontWeight: FontWeight.w500,
                ),
              ),
              Image.network(
                iconUrl.replaceFirst(
                    '{icon}', perThreeHours[0].weather![0].icon ?? '01d'),
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
            ],
          ),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: List.generate(
                16,
                (index) {
                  MainList data = perThreeHours[index];

                  return DayForeCastItem(
                    day:
                        '${DateTime.parse(data.dtTxt!).day}/${DateTime.parse(data.dtTxt!).month}',
                    date: '${data.dtTxt!.split(' ').last.substring(0, 5)}',
                    minTemp: kelvinToCelcius(data.main!.tempMin),
                    maxTemp: kelvinToCelcius(data.main!.tempMax),
                    windSpeed: data.wind!.speed ?? 0,
                    iconId: data.weather![0].icon ?? '01d',
                    kPadding: 2,
                    greenClr: Colors.greenAccent,
                    redClr: Colors.deepOrange,
                  );
                },
              ),
            ),
          ),
          height20,
          KonstElevatedButton(
            size: size,
            label: '120 Hours Forecast',
            icon: CupertinoIcons.clock,
            color: kBlack,
            onClick: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ScreenDayForecast(
                      key: const Key('direct_navigation_hourspage'),
                      lat: lat,
                      lon: lon,
                      isdayPage: false,
                    ),
                  ));
            },
          ),
        ],
      ),
    );
  }
}
