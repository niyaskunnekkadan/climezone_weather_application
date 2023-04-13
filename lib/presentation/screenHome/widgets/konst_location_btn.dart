import 'package:clime_zone/core/color.dart';
import 'package:flutter/material.dart';

class KonstElevatedButton extends StatelessWidget {
  const KonstElevatedButton({
    super.key,
    required this.size,
    required this.label,
    required this.icon,
  });

  final Size size;
  final String label;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton.icon(
      onPressed: () {},
      style: ButtonStyle(
        padding: const MaterialStatePropertyAll(
          EdgeInsets.symmetric(
            vertical: 0,
            horizontal: 20,
          ),
        ),
        backgroundColor: MaterialStatePropertyAll(
          Colors.white.withOpacity(.2),
        ),
        elevation: const MaterialStatePropertyAll(0),
      ),
      label: Text(
        label,
        style: TextStyle(
          fontSize: size.width * .026,
          color: kWhite,
        ),
      ),
      icon: Icon(
        icon,
        size: size.width * .03,
        color: kWhite,
      ),
    );
  }
}
