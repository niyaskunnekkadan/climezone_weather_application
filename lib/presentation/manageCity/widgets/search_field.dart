import 'package:clime_zone/core/color.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SearchFieldManageCity extends StatelessWidget {
  const SearchFieldManageCity({
    super.key,
    required this.onTap,
  });
  final void Function() onTap;

  @override
  Widget build(BuildContext context) {
    return CupertinoSearchTextField(
      padding: const EdgeInsets.symmetric(vertical: 18, horizontal: 8),
      prefixIcon: Icon(
        CupertinoIcons.search,
        color: kWhite.withOpacity(.7),
      ),
      style: TextStyle(
        color: kWhite.withOpacity(.8),
      ),
      suffixIcon: Icon(
        CupertinoIcons.xmark_circle_fill,
        color: kWhite.withOpacity(.7),
      ),
      decoration: BoxDecoration(
        color: kWhite.withOpacity(.2),
        borderRadius: BorderRadius.circular(18),
      ),
      onTap: () => onTap,
    );
  }
}
