import 'dart:ui';
import 'package:clime_zone/application/home/home_bloc.dart';
import 'package:clime_zone/core/color.dart';
import 'package:clime_zone/presentation/home/widgets/credit_text.dart';
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
      decoration: const BoxDecoration(
        image: DecorationImage(
          fit: BoxFit.cover,
          image: AssetImage(
            'assets/image/desktop-wallpaper-best-ultra-nature-data-src-full-261978-nature-mobile.jpg',
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
              builder: (context, state) =>
                  KonstAppBar(size: size, kState: state, lat: lat, lon: lon),
            ),
          ),
          body: RefreshIndicator(
            onRefresh: () async {
              context
                  .read<HomeBloc>()
                  .add(HomeEvent.mainCard(lat: lat, lon: lon));
            },
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: BlocBuilder<HomeBloc, HomeState>(
                builder: (context, state) {
                  if (state.isLoading) {
                    return loadingIndictor;
                  } else if (state.isClientError) {
                    return clientFailureWidget;
                  } else if (state.isServerError) {
                    return serverFailureWidget;
                  } else {
                    return ListView(
                      children: [
                        MainWeatherCard(size: size, kState: state),
                        DetailsCard(size: size, kState: state),
                        SunTimeCard(size: size, kState: state),
                        CreditText(size: size, color: kWhite),
                      ],
                    );
                  }
                },
              ),
            ),
          ),
        ),
      ),
    );
  }
}
