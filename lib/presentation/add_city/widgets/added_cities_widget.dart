import 'package:flutter/material.dart';

class AddedCityItem extends StatelessWidget {
  const AddedCityItem({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(vertical: 5),
      child: Card(
        child: ListTile(
          title: Text('Kochi'),
          subtitle: Text('AQI 36 36/25'),
          trailing: Text('42'),
        ),
      ),
    );
  }
}
