import 'package:clime_zone/core/url.dart';
import 'package:flutter/material.dart';

class AirQualityItem extends StatelessWidget {
  const AirQualityItem({
    super.key,
    required this.label,
    required this.value,
  });

  final String label;
  final int value;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          value == 00 ? nullValue : value.toString(),
          style: const TextStyle(
            color: Colors.green,
            fontSize: 20,
          ),
        ),
        Text(
          label,
          style: const TextStyle(
            color: Colors.green,
            fontSize: 16,
          ),
        ),
      ],
    );
  }
}
