import 'package:clime_zone/core/color.dart';
import 'package:clime_zone/presentation/screenHome/widgets/konst_location_btn.dart';
import 'package:flutter/cupertino.dart';

class MainWeatherCard extends StatelessWidget {
  const MainWeatherCard({
    super.key,
    required this.size,
    required this.climate,
    required this.foggy_1,
    required this.foggy_2,
    required this.air,
  });

  final Size size;
  final int climate;
  final int foggy_1;
  final int foggy_2;
  final int air;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          '$climate°C',
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
          'Foggy $foggy_1° / $foggy_2°',
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
        KonstElevatedButton(
          size: size,
          label: 'AQI $air',
          icon: CupertinoIcons.wind_snow,
        )
      ],
    );
  }
}
