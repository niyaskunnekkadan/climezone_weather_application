import 'package:clime_zone/core/url.dart';

class ApiEndPoints {
  static const String currentWeatherApi =
      '$baseUrl/weather?lat={lat}&lon={lon}&appid=$apiKey';

  static const String airQualityIndexApi =
      '$baseUrl/air_pollution?lat={lat}&lon={lon}&appid=$apiKey';

  static const String searchPlaceApi =
      'https://api.openweathermap.org/geo/1.0/direct?q={val}&limit=5&appid=$apiKey';

  static const String dateHourForecast =
      '$baseUrl/forecast?lat={lat}&lon={lon}&appid=$apiKey';
}
