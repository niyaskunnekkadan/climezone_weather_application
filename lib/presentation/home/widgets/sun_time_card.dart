import 'package:clime_zone/core/color.dart';
import 'package:clime_zone/core/sizes.dart';
import 'package:flutter/material.dart';

class SunTimeCard extends StatelessWidget {
  const SunTimeCard({
    super.key,
    required this.size,
  });

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: size.height * .1,
      width: size.width * .45,
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Colors.black.withOpacity(.2),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          sunRiseSetText(size, 'Sunrise', '06:17'),
          sunRiseSetText(size, 'Sunset', '19:33'),
        ],
      ),
    );
  }

  Row sunRiseSetText(Size size, String label, String time) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          time,
          style: TextStyle(
            color: kWhite,
            fontSize: size.width * .055,
            fontWeight: FontWeight.w600,
          ),
        ),
        width20,
        Text(
          label,
          style: TextStyle(
            color: kWhite.withOpacity(.8),
            fontSize: size.width * .05,
            fontWeight: FontWeight.w500,
          ),
        ),
      ],
    );
  }
}
