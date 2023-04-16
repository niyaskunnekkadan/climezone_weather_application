import 'package:clime_zone/core/sizes.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Widget clientFailureWidget =
    errorWidget('assets/image/chrome.gif', 'Check your network connection.');

Widget serverFailureWidget =
    errorWidget('assets/image/drible.gif', "Server connection failed");

const loadingIndictor = Center(child: CupertinoActivityIndicator());

SizedBox errorWidget(String url, String errMsg) {
  return SizedBox(
    width: double.infinity,
    height: double.infinity,
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Image.asset(
          url,
          width: 150,
          height: 150,
        ),
        height10,
        Text(
          errMsg,
          style: const TextStyle(color: Colors.red),
        ),
      ],
    ),
  );
}
