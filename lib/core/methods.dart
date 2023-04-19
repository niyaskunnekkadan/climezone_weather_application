import 'package:intl/intl.dart';

int kelvinToCelcius(double? kelvin) {
  return (kelvin! - 273.15).round();
}

String stringToDate(String dt) {
  DateTime date = DateTime.parse(dt);
  String formatedDate = DateFormat.yMMMMd('en_US').format(date);
  if (date.day == DateTime.now().day) {
    formatedDate = 'Today';
  } else if (date.day == DateTime.now().add(const Duration(hours: 24)).day) {
    formatedDate = 'Tommorrow';
  } else {
    String d = DateFormat.MMMEd('en_US').format(date);
    d = d.split(' ').first.substring(0, 3);
    formatedDate = d;
  }
  return formatedDate;
}
