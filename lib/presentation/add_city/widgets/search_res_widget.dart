import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SearchCityResWidget extends StatelessWidget {
  const SearchCityResWidget({
    super.key,
    required this.cityName,
    required this.stateName,
    required this.countryName,
  });
  final String cityName;
  final String stateName;
  final String countryName;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () {},
      title: Text(
        cityName,
        style: const TextStyle(color: Colors.white),
      ),
      subtitle: Text(
        '$stateName, $countryName',
        style: const TextStyle(color: Colors.white70),
      ),
      trailing: IconButton(
        onPressed: () {},
        color: Colors.grey.shade200,
        splashRadius: 30,
        icon: const Icon(
          CupertinoIcons.add,
          color: Colors.white,
        ),
      ),
    );
  }
}
