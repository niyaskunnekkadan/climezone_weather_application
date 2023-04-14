import 'package:clime_zone/core/color.dart';
import 'package:clime_zone/core/sizes.dart';
import 'package:flutter/material.dart';

class DetailsCard extends StatelessWidget {
  const DetailsCard({
    super.key,
    required this.size,
  });

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Container(
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
          detailCardText(size, 'Humidity', '94%'),
          detailCardText(size, 'Real Feel', '25°'),
          detailCardText(size, 'UV', '0'),
          detailCardText(size, 'Pressure', '1010 mbar'),
          detailCardText(size, 'Chance of Rain', '25%'),
        ],
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
            fontSize: size.width * .041,
            fontWeight: FontWeight.w500,
          ),
        ),
        width20,
        Text(
          val,
          style: TextStyle(
            color: kWhite,
            fontSize: size.width * .044,
            fontWeight: FontWeight.w600,
          ),
        ),
      ],
    );
  }
}
