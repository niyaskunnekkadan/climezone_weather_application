import 'dart:ui';

import 'package:clime_zone/core/color.dart';
import 'package:clime_zone/core/sizes.dart';
import 'package:clime_zone/core/url.dart';
import 'package:clime_zone/presentation/screenHome/widgets/card_head_title.dart';
import 'package:clime_zone/presentation/screenHome/widgets/day_forecast_card.dart';
import 'package:clime_zone/presentation/screenHome/widgets/day_forecast_item.dart';
import 'package:clime_zone/presentation/screenHome/widgets/konst_appbar.dart';
import 'package:clime_zone/presentation/screenHome/widgets/konst_location_btn.dart';
import 'package:clime_zone/presentation/screenHome/widgets/main_weather_card.dart';
import 'package:clime_zone/presentation/screenHome/widgets/sun_time_card.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ScreenHome extends StatelessWidget {
  const ScreenHome({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      height: double.infinity,
      width: double.infinity,
      decoration: BoxDecoration(
        image: DecorationImage(
          fit: BoxFit.cover,
          image: NetworkImage(
            imgList[0],
          ),
        ),
      ),
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 3, sigmaY: 3),
        child: Scaffold(
          backgroundColor: Colors.white.withOpacity(.3),
          appBar: PreferredSize(
            preferredSize: Size.fromHeight(size.height * .1),
            child: KonstAppBar(size: size),
          ),
          body: SunTimeCard(size: size),
        ),
      ),
    );
  }
}
