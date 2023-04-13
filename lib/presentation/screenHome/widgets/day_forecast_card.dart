import 'package:clime_zone/core/color.dart';
import 'package:clime_zone/presentation/screenHome/widgets/card_head_title.dart';
import 'package:clime_zone/presentation/screenHome/widgets/day_forecast_item.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DayForeCastCard extends StatelessWidget {
  const DayForeCastCard({
    super.key,
    required this.size,
  });

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: size.height * .29,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Colors.black.withOpacity(.25),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          CradHeadTitle(
            size: size,
            titleLabel: '5 Day Forecast',
            icon: CupertinoIcons.calendar,
            trailingLabel: 'More Details',
            trailingVisible: true,
          ),
          DayForecastItem(size: size),
          DayForecastItem(size: size),
          DayForecastItem(size: size),
          ElevatedButton(
            onPressed: () {},
            style: ButtonStyle(
              padding: MaterialStatePropertyAll(
                EdgeInsets.symmetric(
                  vertical: 5,
                  horizontal: size.width * .3,
                ),
              ),
              backgroundColor: MaterialStatePropertyAll(
                Colors.white.withOpacity(.2),
              ),
              elevation: const MaterialStatePropertyAll(0),
            ),
            child: Text(
              '5 Day Forecast',
              style: TextStyle(
                fontSize: size.width * .046,
                color: kWhite.withOpacity(.9),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
