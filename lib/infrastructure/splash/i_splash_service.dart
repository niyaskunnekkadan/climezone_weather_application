import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';

enum LocationStatus {
  disable,
  permissionDinied,
  permissionPermenentDinied,
}

class ISplashService {
  /*
   
    get User current location

   */
  static Future<Either<LocationStatus, Position>> determinePosition(
      BuildContext context) async {
    bool serviceEnabled;
    LocationPermission permission;

    /*
   
    check loctionService status

   */
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      return const Left(LocationStatus.disable);
    }

    /*
   
    get location Permission in user

   */
    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return const Left(LocationStatus.permissionDinied);
      }
    }
    //
    if (permission == LocationPermission.deniedForever) {
      return const Left(LocationStatus.permissionPermenentDinied);
    }

    /*
   
    return location data

   */
    return Right(await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high));
  }
}
