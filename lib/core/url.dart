/*
  apikey1 = 8aac737112154c8d30c70a89d2166e25
  apikey2 = 09aa55c25fcc559030b9a949e7d67238 
 */

const String apiKey = '8aac737112154c8d30c70a89d2166e25';
const String baseUrl = 'https://api.openweathermap.org/data/2.5';
const String creditUrl = 'https://openweathermap.org/';

const String nullValue = 'N/A';

int kelvinToCelcius(double? kelvin) {
  return (kelvin! - 273.15).round();
}
