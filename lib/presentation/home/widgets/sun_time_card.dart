import 'package:clime_zone/application/home/home_bloc.dart';
import 'package:clime_zone/core/color.dart';
import 'package:clime_zone/core/sizes.dart';
import 'package:clime_zone/core/url.dart';
import 'package:flutter/material.dart';

class SunTimeCard extends StatelessWidget {
  const SunTimeCard({
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
            sunRiseSetText(
                size,
                'Sunrise',
                epocheToDateTime(
                    kState.data == null ? 0 : kState.data!.sys!.sunrise)),
            sunRiseSetText(
                size,
                'Sunset',
                epocheToDateTime(
                    kState.data == null ? 0 : kState.data!.sys!.sunset)),
          ],
        ),
      ),
    );
  }

  String epocheToDateTime(int? epoche) {
    if (epoche == 0) {
      return nullValue;
    }

    final date = DateTime.fromMillisecondsSinceEpoch(epoche!, isUtc: true)
        .add(const Duration(hours: 5, minutes: 30));

    return '${date.hour} : ${date.minute}';
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
