import 'dart:async';
import 'dart:developer';
import 'package:clime_zone/application/add_city_bloc/add_city_bloc.dart';
import 'package:clime_zone/application/bloc/home_bloc_bloc.dart';
import 'package:clime_zone/core/color.dart';
import 'package:clime_zone/core/sizes.dart';
import 'package:clime_zone/core/url.dart';
import 'package:clime_zone/presentation/add_city/widgets/added_cities_widget.dart';
import 'package:clime_zone/presentation/add_city/widgets/search_res_widget.dart';
import 'package:clime_zone/presentation/widgets/tiny_widgets.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ScreenAddCity extends StatelessWidget {
  ScreenAddCity({super.key});
  double lat = 0;
  double lon = 0;
  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<AddCityBloc>().add(const Initial());

      context.read<HomeBloc>().add(
            HomeEvent.mainCard(
              lat: lat,
              lon: lon,
            ),
          );
    });

    final _debouner = Debouncer(milliseconds: 850);
    return Scaffold(
      backgroundColor: kBlack,
      appBar: AppBar(
        iconTheme: const IconThemeData(
          color: Colors.white70,
        ),
        backgroundColor: Colors.transparent,
        centerTitle: true,
        title: const Text(
          'Manage Cities',
          style: TextStyle(
            color: kWhite,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(15),
        child: Column(
          children: [
            CupertinoSearchTextField(
              onChanged: (value) {
                _debouner.run(() {
                  if (value.isEmpty) {
                    context
                        .read<AddCityBloc>()
                        .add(AddCityEvent.searching(place: value));
                  }
                  return context
                      .read<AddCityBloc>()
                      .add(AddCityEvent.searching(place: value));
                });
              },
              backgroundColor: Colors.grey.shade800,
              prefixIcon:
                  const Icon(CupertinoIcons.search, color: Colors.white60),
              suffixIcon: const Icon(CupertinoIcons.xmark_circle_fill,
                  color: Colors.white60),
              style: const TextStyle(color: Colors.white),
              padding: const EdgeInsets.all(10),
            ),
            height20,
            BlocBuilder<AddCityBloc, AddCityState>(
              builder: (context, state) {
                if (state.isLoading) {
                  return loadingIndictor;
                } else if (state.isError) {
                  return const Center(
                      child: Text(
                    'No result!',
                    style: TextStyle(color: Colors.white),
                  ));
                } else if (state.addedCities.isEmpty) {
                  return const Center(
                      child: Text(
                    'No Data',
                    style: TextStyle(color: Colors.white),
                  ));
                }
                return state.searchingCities.isNotEmpty
                    ? Expanded(
                        child: ListView(
                          children: List.generate(
                            state.searchingCities.length,
                            (index) => SearchCityResWidget(
                              cityName: state.searchingCities[index].name ??
                                  nullValue,
                              stateName: state.searchingCities[index].state ??
                                  nullValue,
                              countryName:
                                  state.searchingCities[index].country ??
                                      nullValue,
                              lat: state.searchingCities[index].lat ?? 0,
                              lon: state.searchingCities[index].lon ?? 0,
                            ),
                          ),
                        ),
                      )
                    : BlocBuilder<AddCityBloc, AddCityState>(
                        builder: (context, state) {
                          return Expanded(
                            child: ListView(
                              children: List.generate(
                                state.addedCities.length,
                                (index) {
                                  final _item = state.addedCities[index];

                                  lat = _item.latitude;
                                  lon = _item.longitude;

                                  String name;
                                  if (index == 0) {
                                    name = 'Your location';
                                  } else {
                                    name = _item.name;
                                  }
                                  final Kstate = state;
                                  return BlocBuilder<HomeBloc, HomeState>(
                                    builder: (context, state) {
                                      return AddedCityItem(
                                        name: name,
                                        value: index,
                                        aqiValue:
                                            state.aqiList[0].main!.aqi ?? 0,
                                        temp: kelvinToCelcius(
                                            state.data!.main!.temp),
                                        minTemp: kelvinToCelcius(
                                            state.data!.main!.tempMin),
                                        maxTemp: kelvinToCelcius(
                                            state.data!.main!.tempMax),
                                        isDel: Kstate.isDelete,
                                      );
                                    },
                                  );
                                },
                              ),
                            ),
                          );
                        },
                      );
              },
            ),
          ],
        ),
      ),
    );
  }
}

class Debouncer {
  final int milliseconds;
  Timer? _timer;

  Debouncer({required this.milliseconds});

  run(VoidCallback action) {
    _timer?.cancel();
    _timer = Timer(Duration(milliseconds: milliseconds), action);
  }
}
