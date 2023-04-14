import 'package:clime_zone/presentation/screenHome/screen_home.dart';
import 'package:clime_zone/presentation/screenManageCity/screen_manage_city.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'ClimeZone',
      theme: ThemeData(
        primarySwatch: Colors.orange,
        useMaterial3: true,
      ),
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
        '/': (context) => const ScreenHome(),
        '/manage_city': (context) => const ScreenManageCity(),
      },
    );
  }
}
