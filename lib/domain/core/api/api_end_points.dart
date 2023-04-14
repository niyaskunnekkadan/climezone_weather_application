import 'package:clime_zone/core/url.dart';

class ApiEndPoints {
  static const String currentWeatherApi =
      '$baseUrl/weather?lat={lat}&lon={lon}&appid=$apiKey';
}
