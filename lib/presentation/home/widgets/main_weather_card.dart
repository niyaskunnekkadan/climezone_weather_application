import 'package:clime_zone/application/home/home_bloc.dart';
import 'package:clime_zone/core/color.dart';
import 'package:clime_zone/core/sizes.dart';
import 'package:clime_zone/core/url.dart';
import 'package:clime_zone/domain/home/models/aqi_model/aq_index_model/components.dart';
import 'package:clime_zone/presentation/air_quality/screen_air_quality.dart';
import 'package:clime_zone/presentation/home/widgets/konst_location_btn.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MainWeatherCard extends StatelessWidget {
  const MainWeatherCard({
    super.key,
    required this.size,
    required this.kState,
  });

  final Size size;
  final HomeState kState;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: size.height * .184),
      child: Column(
        children: [
          Text(
            kState.data == null
                ? nullValue
                : '${kelvinToCelcius(kState.data!.main!.temp)}°C',
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
            kState.data == null
                ? nullValue
                : '${kState.data!.weather![0].main} ${kelvinToCelcius(kState.data!.main!.tempMin)}°C / ${kelvinToCelcius(kState.data!.main!.tempMax)}°C',
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
            label: kState.data == null
                ? nullValue
                : 'AQI ${kState.aqiList[0].main!.aqi}',
            icon: CupertinoIcons.wind,
            color: Colors.black,
            onClick: () {
              Navigator.of(context).push(MaterialPageRoute(
                builder: (context) {
                  return ScreenAirQuality(
                    aqiValue: kState.aqiList[0].main!.aqi ?? 00,
                    itemValues: kState.aqiList[0].components ?? Components(),
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
