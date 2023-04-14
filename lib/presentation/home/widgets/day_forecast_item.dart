import 'package:clime_zone/core/color.dart';
import 'package:clime_zone/core/sizes.dart';
import 'package:flutter/material.dart';

class DayForecastItem extends StatelessWidget {
  const DayForecastItem({
    super.key,
    required this.size,
  });

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            CircleAvatar(
              radius: size.width * .035,
              backgroundColor: Colors.yellow,
            ),
            width20,
            Text(
              'Today Foggy',
              style: TextStyle(
                color: kWhite,
                fontWeight: FontWeight.w600,
                fontSize: size.width * .054,
              ),
            ),
          ],
        ),
        Text(
          '25° / 36°',
          style: TextStyle(
            color: kWhite,
            fontWeight: FontWeight.w600,
            fontSize: size.width * .058,
          ),
        ),
      ],
    );
  }
}
