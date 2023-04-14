import 'package:clime_zone/core/color.dart';
import 'package:flutter/material.dart';

class CityCard extends StatelessWidget {
  const CityCard({
    super.key,
    required this.size,
    required this.title,
  });

  final Size size;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.orange.withOpacity(.8),
      child: ListTile(
        contentPadding: const EdgeInsets.all(17),
        title: Text(
          title,
          style: TextStyle(
            color: kWhite,
            fontSize: size.width * .047,
            fontWeight: FontWeight.w500,
          ),
        ),
        subtitle: Text(
          '36° / 25°',
          style: TextStyle(
            color: kWhite.withOpacity(.8),
            fontSize: size.width * .04,
            fontWeight: FontWeight.w500,
          ),
        ),
        trailing: Text(
          '26°',
          style: TextStyle(
            color: kWhite,
            fontSize: size.width * .067,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    );
  }
}
