import 'package:clime_zone/application/home/home_bloc.dart';
import 'package:clime_zone/core/color.dart';
import 'package:clime_zone/core/sizes.dart';
import 'package:clime_zone/core/url.dart';
import 'package:flutter/material.dart';

class DetailsCard extends StatelessWidget {
  const DetailsCard({
    super.key,
    required this.size,
    required this.kState,
  });

  final Size size;
  final HomeState kState;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Container(
        width: size.width * .45,
        height: size.height * .176,
        decoration: BoxDecoration(
          color: Colors.black.withOpacity(.2),
          borderRadius: BorderRadius.circular(20),
        ),
        padding: const EdgeInsets.all(14),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            detailCardText(
                size,
                'Humidity',
                kState.data == null
                    ? nullValue
                    : '${kState.data!.main!.humidity}%'),
            detailCardText(
                size,
                'Feels like',
                kState.data == null
                    ? nullValue
                    : '${kelvinToCelcius(kState.data!.main!.feelsLike)}°'),
            detailCardText(
                size,
                'Wind Speed',
                kState.data == null
                    ? nullValue
                    : '${kState.data!.wind!.speed}m/s'),
            detailCardText(
                size,
                'Pressure',
                kState.data == null
                    ? nullValue
                    : '${kState.data!.main!.pressure}mbar'),
          ],
        ),
      ),
    );
  }

  Row detailCardText(Size size, String label, String val) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          label,
          style: TextStyle(
            color: kWhite.withOpacity(.8),
            fontSize: size.width * .05,
            fontWeight: FontWeight.w500,
          ),
        ),
        width20,
        Text(
          val,
          style: TextStyle(
            color: kWhite,
            fontSize: size.width * .05,
            fontWeight: FontWeight.w600,
          ),
        ),
      ],
    );
  }
}
