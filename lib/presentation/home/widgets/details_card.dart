import 'package:clime_zone/application/bloc/home_bloc_bloc.dart';
import 'package:clime_zone/core/color.dart';
import 'package:clime_zone/core/sizes.dart';
import 'package:clime_zone/core/url.dart';
import 'package:flutter/material.dart';

class DetailsCard extends StatelessWidget {
  const DetailsCard({
    super.key,
    required this.humidity,
    required this.feelsLike,
    required this.windSpeed,
    required this.pressure,
  });

  final int humidity;
  final int feelsLike;
  final double windSpeed;
  final int pressure;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.black.withOpacity(.2),
          borderRadius: BorderRadius.circular(20),
        ),
        padding: const EdgeInsets.all(14),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            detailCardText(
                size, 'Humidity', humidity == 0 ? nullValue : '$humidity%'),
            detailCardText(
                size, 'Feels like', feelsLike == 0 ? nullValue : '$feelsLike°'),
            detailCardText(size, 'Wind Speed',
                windSpeed == 0 ? nullValue : '$windSpeed m/s'),
            detailCardText(
                size, 'Pressure', pressure == 0 ? nullValue : '$pressure mbar'),
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
