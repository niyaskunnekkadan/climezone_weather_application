import 'dart:io';

import 'package:clime_zone/core/color.dart';
import 'package:clime_zone/core/url.dart';
import 'package:clime_zone/domain/saved_places/saved_place_model.dart';
import 'package:clime_zone/infrastructure/saved_place_db/i_db_service.dart';
import 'package:clime_zone/infrastructure/splash/i_splash_service.dart';
import 'package:clime_zone/presentation/home/screen_home.dart';
import 'package:clime_zone/presentation/splash/widgets/screen_widget.dart';
import 'package:clime_zone/presentation/widgets/error_widget.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ScreenSplash extends StatelessWidget {
  const ScreenSplash({super.key});

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      // call initial splash checkings
      await checkDefaultSavedLocation(context);
    });

    return const Scaffold(
      backgroundColor: kBlue,
      body: SplashScreenWidget(),
    );
  }

  Future<void> checkDefaultSavedLocation(BuildContext context) async {
    final _sharedPrefs = await SharedPreferences.getInstance();
    final isTrue = _sharedPrefs.getBool(isSavedLocationKey);
    if (isTrue == null || !isTrue) {
      // get user current location
      final _position = await ISplashService.determinePosition(context);

      _position.fold(
        // getting location failed cases
        (fail) async {
          // getting location failed => case 1
          if (fail == LocationStatus.disable) {
            showDialog(
                context: context,
                builder: (context) => const SimpleDialog(
                      children: [KonstErrorWidget()],
                    ));
            await Future.delayed(const Duration(milliseconds: 3000));
            exit(0);
          }
          // getting location failed => case 2,3
          else {
            exit(0);
          }
        },
        (success) async {
          // getting location success case
          // create location model
          final data = SavedPlaceModel(
            DateTime.now().millisecondsSinceEpoch,
            latitude: success.latitude,
            longitude: success.longitude,
          );
          // add location in db
          await IDBService().addPlace(data);
          // set sharedPrefs true value
          await _sharedPrefs.setBool(isSavedLocationKey, true);
          // goto home screen and kill previous route
          Navigator.of(context).pushAndRemoveUntil(
              MaterialPageRoute(
                builder: (context) => const ScreenHome(),
              ),
              (route) => false);
        },
      );
    } else {
      // goto home screen and kill previous route
      await Future.delayed(const Duration(milliseconds: 1400));
      Navigator.of(context).pushReplacement(MaterialPageRoute(
        builder: (context) => const ScreenHome(),
      ));
    }
  }
}
