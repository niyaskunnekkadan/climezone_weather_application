import 'package:clime_zone/application/add_city_bloc/add_city_bloc.dart';
import 'package:clime_zone/application/home/home_bloc.dart';
import 'package:clime_zone/domain/core/di/injectoble_configue.dart';
import 'package:clime_zone/presentation/air_quality/screen_air_quality.dart';
import 'package:clime_zone/presentation/settings/screen_settings.dart';
import 'package:clime_zone/presentation/splash/screen_splash.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  injectobleConfigue();
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
