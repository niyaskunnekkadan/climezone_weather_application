import 'package:clime_zone/core/url.dart';
import 'package:clime_zone/presentation/screenHome/widgets/konst_appbar.dart';
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
      child: Scaffold(
        backgroundColor: Colors.white.withOpacity(.3),
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(size.height * .1),
          child: KonstAppBar(size: size),
        ),
        body: null,
      ),
    );
  }
}
