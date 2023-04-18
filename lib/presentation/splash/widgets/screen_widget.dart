import 'package:clime_zone/core/color.dart';
import 'package:clime_zone/presentation/widgets/loading_indicator.dart';
import 'package:flutter/material.dart';

class SplashScreenWidget extends StatelessWidget {
  const SplashScreenWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        Align(
          alignment: Alignment.center,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              Text(
                ' ClimeZone ',
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 32,
                  letterSpacing: 3,
                  color: kWhite,
                ),
              ),
              Text(
                'If you want to see the sunshine, you have to weather the storm ',
                style: TextStyle(
                  fontWeight: FontWeight.w400,
                  fontSize: 12,
                  color: kWhite,
                ),
              ),
            ],
          ),
        ),
        Positioned(
          bottom: MediaQuery.of(context).size.height * .3,
          child: const KonstLoadingIndictor.white(),
        ),
      ],
    );
  }
}
