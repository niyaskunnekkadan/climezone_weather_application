import 'package:clime_zone/application/add_city_bloc/add_city_bloc.dart';
import 'package:clime_zone/domain/saved_places/saved_place_model.dart';
import 'package:clime_zone/infrastructure/saved_place_db/i_db_service.dart';
import 'package:clime_zone/presentation/add_city/screen_add_city.dart';
import 'package:clime_zone/presentation/day_forecast/screen_day_forecast.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SearchCityResWidget extends StatelessWidget {
  const SearchCityResWidget({
    super.key,
    required this.cityName,
    required this.stateName,
    required this.countryName,
    required this.lat,
    required this.lon,
  });
  final String cityName;
  final String stateName;
  final String countryName;
  final double lat;
  final double lon;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () {
        if (lat != 0 && lon != 0) {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => ScreenDayForecast(
                key: const Key('search_redirect'),
                lat: lat,
                lon: lon,
                isdayPage: false,
              ),
            ),
          );
          context.read<AddCityBloc>().add(const Initial());
        } else {}
        searchController.clear();
      },
      title: Text(
        cityName,
        style: const TextStyle(color: Colors.white),
      ),
      subtitle: Text(
        '$stateName, $countryName',
        style: const TextStyle(color: Colors.white70),
      ),
      trailing: IconButton(
        onPressed: () async {
          final mod = SavedPlaceModel(
            id: DateTime.now().millisecondsSinceEpoch,
            latitude: lat,
            longitude: lon,
            name: cityName,
          );
          final isAdded = await IDBService().addPlace(mod);
          if (isAdded) {
            Navigator.of(context).pushAndRemoveUntil(
                MaterialPageRoute(
                  builder: (context) => const ScreenAddCity(),
                ),
                (route) => false);
          } else {
            final _snackbar = SnackBar(
              content: Text('$cityName already have'),
              behavior: SnackBarBehavior.floating,
              padding: const EdgeInsets.symmetric(vertical: 3, horizontal: 20),
              margin: const EdgeInsets.all(10),
              showCloseIcon: true,
              elevation: 10,
            );
            ScaffoldMessenger.of(context).showSnackBar(_snackbar);
          }
        },
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
