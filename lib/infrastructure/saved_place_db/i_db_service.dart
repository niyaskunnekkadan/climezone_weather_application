import 'package:clime_zone/domain/saved_places/saved_place_model.dart';
import 'package:hive_flutter/hive_flutter.dart';

class IDBService {
  /*
   
    singleTon format code

   */
  IDBService._internal();
  static IDBService _instance = IDBService._internal();
  factory IDBService() => _instance;

  // LocalPlaceDB constantName
  static const String dBName = 'SAVED_PLACES';

  /*
   
    DB add place Data

   */
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

  /*
   
    DB delete place Data

   */
  Future<void> removePlace(int id) async {
    final db = await Hive.openBox<SavedPlaceModel>(dBName);

    await db.deleteAt(id);
  }

  /*
   
    DB refresh (current fullDb values return) place Data

   */
  Future<List<SavedPlaceModel>> refreshUi() async {
    final db = await Hive.openBox<SavedPlaceModel>(dBName);
    List<SavedPlaceModel> model = [];
    model.addAll(db.values.toList());
    return model;
  }
}
