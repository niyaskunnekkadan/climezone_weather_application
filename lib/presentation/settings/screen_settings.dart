import 'package:clime_zone/core/color.dart';
import 'package:flutter/material.dart';

class ScreenSettings extends StatelessWidget {
  const ScreenSettings({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: kWhite.withOpacity(.96),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Text(
          'Settings',
          style: TextStyle(
            color: kBlack.withOpacity(.8),
            fontWeight: FontWeight.w500,
            fontSize: size.width * .052,
          ),
        ),
        centerTitle: true,
      ),
      body: null,
    );
  }
}
