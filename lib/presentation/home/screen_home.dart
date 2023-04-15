import 'dart:developer';
import 'dart:ui';

import 'package:clime_zone/application/bloc/home_bloc.dart';
import 'package:clime_zone/core/sizes.dart';
import 'package:clime_zone/core/url.dart';
import 'package:clime_zone/presentation/home/widgets/credit_text.dart';
import 'package:clime_zone/presentation/home/widgets/day_forecast_card.dart';
import 'package:clime_zone/presentation/home/widgets/details_card.dart';
import 'package:clime_zone/presentation/home/widgets/konst_appbar.dart';
import 'package:clime_zone/presentation/home/widgets/main_weather_card.dart';
import 'package:clime_zone/presentation/home/widgets/sun_time_card.dart';
import 'package:clime_zone/presentation/widgets/tiny_widgets.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ScreenHome extends StatelessWidget {
  const ScreenHome({super.key, required this.lat, required this.lon});

  final double lat;
  final double lon;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<HomeBloc>().add(HomeEvent.mainCard(lat: lat, lon: lon));
    });

    return Container(
      height: double.infinity,
      width: double.infinity,
      decoration: BoxDecoration(
        image: DecorationImage(
          fit: BoxFit.cover,
          image: NetworkImage(
            imgList[0],
          ),
        ),
      ),
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 3, sigmaY: 3),
        child: Scaffold(
          backgroundColor: Colors.white.withOpacity(.3),
          appBar: PreferredSize(
            preferredSize: Size.fromHeight(size.height * .1),
            child: BlocBuilder<HomeBloc, HomeState>(
              builder: (context, state) {
                return KonstAppBar(size: size, kState: state);
              },
            ),
          ),
          body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: BlocBuilder<HomeBloc, HomeState>(
              builder: (context, state) {
                if (state.isLoading) {
                  return const Center(child: loadingIndictor);
                } else if (state.isClientError) {
                  return Center(child: clientFailureWidget);
                } else if (state.isServerError) {
                  return Center(child: serverFailureWidget);
                } else {
                  return ListView(
                    children: [
                      MainWeatherCard(size: size, kState: state),
                      DayForeCastCard(size: size),
                      DetailsCard(size: size, kState: state),
                      SunTimeCard(size: size, Kstate: state),
                      CreditText(size: size),
                    ],
                  );
                }
              },
            ),
          ),
        ),
      ),
    );
  }
}
