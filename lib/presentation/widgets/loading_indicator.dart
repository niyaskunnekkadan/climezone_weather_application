import 'package:clime_zone/core/color.dart';
import 'package:flutter/material.dart';

class KonstLoadingIndictor extends StatelessWidget {
  const KonstLoadingIndictor.white({super.key, this.color = kWhite});
  const KonstLoadingIndictor.black({super.key, this.color = kBlack});

  final Color color;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: CircularProgressIndicator(
        strokeWidth: 2,
        color: color,
      ),
    );
  }
}
