import 'package:clime_zone/application/add_city_bloc/add_city_bloc.dart';
import 'package:clime_zone/application/bloc/home_bloc_bloc.dart';
import 'package:clime_zone/application/day_hour_forecast/day_hour_forecast_bloc.dart';
import 'package:clime_zone/domain/core/di/injectoble_configue.dart';
import 'package:clime_zone/domain/saved_places/saved_place_model.dart';
import 'package:clime_zone/presentation/air_quality/screen_air_quality.dart';
import 'package:clime_zone/presentation/settings/screen_settings.dart';
import 'package:clime_zone/presentation/splash/screen_splash.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  injectobleConfigue();
  Hive.initFlutter();
  if (!Hive.isAdapterRegistered(SavedPlaceModelAdapter().typeId)) {
    Hive.registerAdapter(SavedPlaceModelAdapter());
  }
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => getIt<HomeBloc>()),
        BlocProvider(create: (context) => getIt<AddCityBloc>()),
        BlocProvider(create: (context) => getIt<DayHourForecastBloc>()),
      ],
      child: MaterialApp(
        title: 'ClimeZone',
        theme: ThemeData(
          primarySwatch: Colors.orange,
          useMaterial3: true,
        ),
        debugShowCheckedModeBanner: false,
        initialRoute: '/',
        routes: {
          '/': (context) => const ScreenSplash(),
          '/settings': (context) => const ScreenSettings(),
        },
      ),
    );
  }
}
