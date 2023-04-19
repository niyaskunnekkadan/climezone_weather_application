import 'package:clime_zone/application/bloc/home_bloc_bloc.dart';
import 'package:clime_zone/core/color.dart';
import 'package:clime_zone/core/url.dart';
import 'package:clime_zone/presentation/add_city/screen_add_city.dart';
import 'package:clime_zone/presentation/settings/screen_settings.dart';
import 'package:clime_zone/presentation/widgets/loading_indicator.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class KonstAppBar extends StatelessWidget {
  const KonstAppBar({
    super.key,
    required this.size,
    required this.kState,
    required this.lat,
    required this.lon,
  });

  final Size size;
  final HomeState kState;
  final double lat;
  final double lon;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.transparent,
      elevation: 0,
      toolbarHeight: size.height * .1,
      leading: Padding(
        padding: const EdgeInsets.only(left: 21),
        child: KonstAppBarButton(
          onClick: () {
            Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => const ScreenAddCity(),
            ));
          },
          size: size,
          tooltip: "manageCities",
          icon: CupertinoIcons.add,
        ),
      ),
      title: kState.isLoading
          ? const KonstLoadingIndictor.white()
          : Text(
              kState.data == null ? nullValue : '${kState.data!.name}',
              style: TextStyle(
                color: kWhite,
                fontSize: size.width * .067,
              ),
            ),
      centerTitle: true,
      actions: [
        Padding(
          padding: const EdgeInsets.only(right: 21),
          child: KonstAppBarButton(
            onClick: () => Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const ScreenSettings(),
                )),
            size: size,
            tooltip: "settings",
            icon: CupertinoIcons.settings,
          ),
        ),
      ],
    );
  }
}

class KonstAppBarButton extends StatelessWidget {
  const KonstAppBarButton({
    super.key,
    required this.size,
    required this.tooltip,
    required this.icon,
    required this.onClick,
  });

  final Size size;
  final String tooltip;
  final IconData icon;
  final void Function() onClick;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: onClick,
      splashRadius: 20,
      tooltip: tooltip,
      icon: Icon(
        icon,
        color: kWhite,
        size: size.width * .074,
      ),
    );
  }
}
