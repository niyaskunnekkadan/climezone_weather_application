import 'package:clime_zone/application/bloc/home_bloc.dart';
import 'package:clime_zone/core/color.dart';
import 'package:clime_zone/core/sizes.dart';
import 'package:clime_zone/core/url.dart';
import 'package:clime_zone/presentation/home/widgets/konst_location_btn.dart';
import 'package:clime_zone/presentation/widgets/tiny_widgets.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class KonstAppBar extends StatelessWidget {
  const KonstAppBar({
    super.key,
    required this.size,
    required this.kState,
  });

  final Size size;
  final HomeState kState;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.transparent,
      elevation: 0,
      toolbarHeight: size.height * .1,
      leading: Padding(
        padding: const EdgeInsets.only(left: 21),
        child: KonstAppBarButton(
          size: size,
          tooltip: "manageCities",
          icon: CupertinoIcons.add,
        ),
      ),
      title: kState.isLoading
          ? loadingIndictor
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
  });

  final Size size;
  final String tooltip;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () {},
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
