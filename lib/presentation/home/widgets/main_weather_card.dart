import 'package:clime_zone/application/bloc/home_bloc_bloc.dart';
import 'package:clime_zone/core/color.dart';
import 'package:clime_zone/core/sizes.dart';
import 'package:clime_zone/presentation/air_quality/screen_air_quality.dart';
import 'package:clime_zone/presentation/home/widgets/konst_location_btn.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MainWeatherCard extends StatelessWidget {
  const MainWeatherCard({
    super.key,
    required this.kState,
    required this.temprature,
    required this.weatherStatus,
    required this.minTemp,
    required this.maxTemp,
    required this.aqiLevel,
    required this.lat,
    required this.lon,
  });

  final double lat;
  final double lon;
  final HomeState kState;
  final String temprature;
  final String weatherStatus;
  final String minTemp;
  final String maxTemp;
  final String aqiLevel;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Padding(
      padding: EdgeInsets.symmetric(vertical: size.height * .184),
      child: Column(
        children: [
          Text(
            '$temprature°C',
            style: TextStyle(
                color: kWhite,
                fontSize: size.width * .22,
                fontWeight: FontWeight.w600,
                shadows: const [
                  Shadow(
                    offset: Offset(0, 10),
                    blurRadius: 180,
                  ),
                ]),
          ),
          Text(
            '$weatherStatus $minTemp° / $maxTemp° C',
            style: TextStyle(
                color: kWhite.withOpacity(.9),
                fontSize: size.width * .05,
                fontWeight: FontWeight.w500,
                shadows: const [
                  Shadow(
                    offset: Offset(0, 5),
                    blurRadius: 80,
                  ),
                ]),
          ),
          height10,
          KonstElevatedButton(
            size: size,
            label: 'AQI $aqiLevel',
            icon: CupertinoIcons.wind,
            color: Colors.black,
            onClick: () {
              Navigator.of(context).push(MaterialPageRoute(
                builder: (context) {
                  return ScreenAirQuality(
                    key: Key('ScreenAirQuality $lat$lon'),
                    lat: lat,
                    lon: lon,
                  );
                },
              ));
            },
          ),
        ],
      ),
    );
  }
}
