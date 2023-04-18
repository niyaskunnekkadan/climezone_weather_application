import 'package:clime_zone/core/color.dart';
import 'package:clime_zone/core/sizes.dart';
import 'package:clime_zone/core/url.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DayForeCastItem extends StatelessWidget {
  const DayForeCastItem({
    super.key,
    required this.day,
    required this.date,
    required this.minTemp,
    required this.maxTemp,
    required this.windSpeed,
    required this.iconId,
    required this.kPadding,
    this.greenClr = Colors.green,
    this.redClr = Colors.red,
  });

  final String day;
  final String date;
  final int minTemp;
  final int maxTemp;
  final double windSpeed;
  final String iconId;
  final double kPadding;
  final Color greenClr;
  final Color redClr;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(kPadding),
      child: Column(
        children: [
          SizedBox(
            height: 40,
            width: 100,
            child: Align(
              alignment: Alignment.bottomCenter,
              child: Text(
                day,
                style: const TextStyle(
                  color: kWhite,
                ),
              ),
            ),
          ),
          Text(
            date == '00:00' ? '24:00' : date,
            style: TextStyle(
              color: kWhite.withOpacity(.8),
            ),
          ),
          Image.network(
            iconUrl.replaceFirst('{icon}', iconId),
            width: 40,
            height: 40,
            loadingBuilder: (_, child, loadingProgress) {
              return child;
            },
            errorBuilder: (_, error, stackTrace) {
              return const Icon(
                CupertinoIcons.cloud,
                color: kWhite,
              );
            },
          ),
          height10,
          SizedBox(
            height: 100,
            width: 100,
            child: Stack(
              alignment: Alignment.center,
              children: [
                Positioned(
                  top: 15,
                  child: Text(
                    '$minTemp°',
                    style: TextStyle(
                      color: greenClr,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
                Positioned(
                  bottom: 15,
                  child: Text(
                    '$maxTemp°',
                    style: TextStyle(
                      color: redClr,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ],
            ),
          ),
          height10,
          Column(
            children: [
              Icon(
                CupertinoIcons.wind,
                color: kWhite.withOpacity(.6),
              ),
              Text(
                windSpeed == 0 ? nullValue : '$windSpeed m/s',
                style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
