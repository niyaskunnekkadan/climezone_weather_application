/*
  apikey1 = 8aac737112154c8d30c70a89d2166e25
 */

import 'package:clime_zone/domain/saved_places/saved_place_model.dart';
import 'package:flutter/cupertino.dart';

const String apiKey = '8aac737112154c8d30c70a89d2166e25';
const String baseUrl = 'https://api.openweathermap.org/data/2.5';
const String creditUrl = 'https://openweathermap.org/';
const String iconUrl = 'https://openweathermap.org/img/wn/{icon}@2x.png';

const String isSavedLocationKey = 'DEFAULT_LOCATION';

const String nullValue = 'N/A';

int kelvinToCelcius(double? kelvin) {
  return (kelvin! - 273.15).round();
}
