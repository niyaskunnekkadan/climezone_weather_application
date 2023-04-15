import 'package:clime_zone/application/bloc/home_bloc.dart';
import 'package:clime_zone/domain/core/di/injectoble_configue.dart';
import 'package:clime_zone/presentation/home/screen_home.dart';
import 'package:clime_zone/presentation/manageCity/screen_manage_city.dart';
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
        BlocProvider(
          create: (context) => getIt<HomeBloc>(),
        )
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
          //'/home': (context) =>   ScreenHome(lat: lat, lon: lon),
          '/manage_city': (context) => const ScreenManageCity(),
          '/settings': (context) => const ScreenSettings(),
        },
      ),
    );
  }
}
