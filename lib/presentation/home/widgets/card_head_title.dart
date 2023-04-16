import 'package:clime_zone/core/color.dart';
import 'package:clime_zone/core/sizes.dart';
import 'package:flutter/material.dart';

class CradHeadTitle extends StatelessWidget {
  const CradHeadTitle({
    super.key,
    required this.size,
    required this.titleLabel,
    required this.icon,
    required this.trailingLabel,
    required this.trailingVisible,
  });

  final Size size;
  final String titleLabel;
  final IconData icon;
  final String trailingLabel;
  final bool trailingVisible;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            Icon(
              icon,
              size: 23,
              color: kWhite.withOpacity(.6),
            ),
            width20,
            Text(
              titleLabel,
              style: TextStyle(
                color: kWhite.withOpacity(.6),
                fontWeight: FontWeight.w500,
                fontSize: size.width * .048,
              ),
            ),
          ],
        ),
        Visibility(
          visible: trailingVisible,
          child: TextButton(
            onPressed: () {},
            child: Text(
              trailingLabel,
              style: TextStyle(
                color: kWhite.withOpacity(.6),
                fontWeight: FontWeight.w400,
                fontSize: size.width * .045,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
