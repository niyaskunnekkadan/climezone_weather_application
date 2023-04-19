import 'dart:developer';

import 'package:clime_zone/application/bloc/home_bloc_bloc.dart';
import 'package:clime_zone/core/url.dart';
import 'package:clime_zone/domain/saved_places/saved_place_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';

class IDBService {
  IDBService._internal();
  static IDBService _instance = IDBService._internal();
  factory IDBService() {
    return _instance;
  }
  static const String dBName = 'SAVED_PLACES';

  Future<bool> addPlace(SavedPlaceModel model) async {
    final db = await Hive.openBox<SavedPlaceModel>(dBName);
    bool iss = true;
    for (int i = 0; i < db.length; i++) {
      final list = db.values.toList();
      if (list[i].latitude == model.latitude &&
          list[i].longitude == model.longitude) {
        iss = false;
        break;
      } else {
        iss = true;
      }
    }
    if (iss) {
      await db.add(model);

      return iss;
    } else {
      return iss;
    }
  }

  Future<void> removePlace(int id) async {
    final db = await Hive.openBox<SavedPlaceModel>(dBName);

    await db.deleteAt(id);
  }

  Future<List<SavedPlaceModel>> refreshUi() async {
    final db = await Hive.openBox<SavedPlaceModel>(dBName);
    List<SavedPlaceModel> model = [];
    model.addAll(db.values.toList());
    return model;
  }
}
