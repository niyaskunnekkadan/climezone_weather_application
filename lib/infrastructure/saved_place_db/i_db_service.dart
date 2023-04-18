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

  Future<void> addPlace(SavedPlaceModel model) async {
    final db = await Hive.openBox<SavedPlaceModel>(dBName);
    await db.add(model);
  }

  Future<List<SavedPlaceModel>> refreshUi() async {
    final db = await Hive.openBox<SavedPlaceModel>(dBName);
    List<SavedPlaceModel> model = [];
    model.addAll(db.values.toList());
    return model;
  }
}
