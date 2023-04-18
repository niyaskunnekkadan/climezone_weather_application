import 'package:flutter/material.dart';

class AddedCityItem extends StatelessWidget {
  const AddedCityItem({
    super.key,
    required this.name,
    required this.lat,
    required this.lon,
  });

  final String name;
  final double lat;
  final double lon;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 5),
      child: Card(
        child: ListTile(
          title: Text('$name'),
          subtitle: Text('$lat'),
          trailing: Text('42'),
        ),
      ),
    );
  }
}
