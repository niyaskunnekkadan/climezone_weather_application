import 'package:clime_zone/infrastructure/splash/i_splash_service.dart';
import 'package:clime_zone/presentation/home/screen_home.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';

class ScreenSplash extends StatelessWidget {
  const ScreenSplash({super.key});

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      final position = await ISplashService.determinePosition(context);
      position.fold(
        (fail) {
          if (fail == LocationStatus.disable) {
            showAlertDialogue(
              context,
              'Enable Location Service',
              false,
            );
          } else if (fail == LocationStatus.permissionDinied) {
          } else {
            showAlertDialogue(
              context,
              'Location permissions are permanently denied, we cannot request permissions.open settings and allow location permission',
              true,
            );
          }
        },
        (success) {
          Navigator.of(context).pushReplacement(MaterialPageRoute(
            builder: (context) =>
                ScreenHome(lat: success.latitude, lon: success.longitude),
          ));
        },
      );
    });

    return Scaffold(
      body: Stack(
        children: [
          Container(
            width: double.infinity,
            height: double.infinity,
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/image/climezone_bg.png'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Positioned(
            bottom: MediaQuery.of(context).size.height * .2,
            left: 10,
            right: 10,
            child: const CupertinoActivityIndicator(
              color: Colors.white70,
            ),
          ),
        ],
      ),
    );
  }

  Future<dynamic> showAlertDialogue(
      BuildContext context, String content, bool isApp) {
    return showDialog(
      context: context,
      builder: (context) => KonstSimpleAlertBox(
        content: content,
        btn: 'settings',
        onClick: () async {
          GeolocatorPlatform geolocatorPlatform = GeolocatorPlatform.instance;
          isApp
              ? geolocatorPlatform.openAppSettings()
              : geolocatorPlatform.openLocationSettings();
          Navigator.pop(context);
        },
      ),
    );
  }
}

class KonstSimpleAlertBox extends StatelessWidget {
  const KonstSimpleAlertBox(
      {super.key,
      required this.content,
      required this.btn,
      required this.onClick});

  final String content;
  final String btn;
  final void Function() onClick;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('Alert'),
      content: Text(content),
      actions: [
        TextButton(
          onPressed: onClick,
          child: Text(btn),
        )
      ],
    );
  }
}
