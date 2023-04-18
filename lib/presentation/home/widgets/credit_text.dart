import 'package:clime_zone/core/color.dart';
import 'package:clime_zone/core/url.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class CreditText extends StatelessWidget {
  const CreditText({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'Data provided in part by ',
            style: TextStyle(
              color: kWhite.withOpacity(.6),
              fontWeight: FontWeight.w400,
              fontSize: size.width * .032,
            ),
          ),
          GestureDetector(
            onTap: () async {
              if (!await launchUrl(Uri.parse(creditUrl))) {
                SnackBar snackBar = const SnackBar(
                  content: Text("coudn't follows this url"),
                  margin: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                );
                ScaffoldMessenger.of(context).showSnackBar(snackBar);
              }
            },
            child: Text(
              ' OpenWeather',
              style: TextStyle(
                color: Colors.orange,
                fontWeight: FontWeight.w600,
                fontSize: size.width * .052,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
