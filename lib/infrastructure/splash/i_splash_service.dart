import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';

enum LocationStatus {
  disable,
  permissionDinied,
  permissionPermenentDinied,
}

class ISplashService {
  static Future<Either<LocationStatus, Position>> determinePosition(
      BuildContext context) async {
    bool serviceEnabled;
    LocationPermission permission;

    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      return const Left(LocationStatus.disable);
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return const Left(LocationStatus.permissionDinied);
      }
    }

    if (permission == LocationPermission.deniedForever) {
      return const Left(LocationStatus.permissionPermenentDinied);
    }

    return Right(await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high));
  }
}
