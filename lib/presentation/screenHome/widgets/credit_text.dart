import 'package:clime_zone/core/color.dart';
import 'package:flutter/material.dart';

class CreditText extends StatelessWidget {
  const CreditText({
    super.key,
    required this.size,
  });

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          'Data provided in part by ',
          style: TextStyle(
            color: kWhite.withOpacity(.4),
            fontWeight: FontWeight.w400,
            fontSize: size.width * .032,
          ),
        ),
        GestureDetector(
          onTap: () {},
          child: Text(
            ' OpenWeather',
            style: TextStyle(
              color: Colors.orange,
              fontWeight: FontWeight.w600,
              fontSize: size.width * .052,
            ),
          ),
        )
      ],
    );
  }
}
