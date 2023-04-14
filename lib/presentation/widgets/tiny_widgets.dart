import 'package:clime_zone/core/sizes.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Widget clientFailureWidget = errorWidget(
  'https://i.gifer.com/origin/78/787899e9d4e4491f797aba5c61294dfc_w200.gif',
  'Check your network connection.',
);

Widget serverFailureWidget = errorWidget(
  'https://media4.giphy.com/media/8L0Pky6C83SzkzU55a/giphy.gif',
  "Server connection failed",
);

const loadingIndictor = CupertinoActivityIndicator();

Column errorWidget(String url, String errMsg) {
  return Column(
    children: [
      Image.network(
        url,
        width: 150,
        height: 150,
      ),
      height10,
      Text(
        errMsg,
        style: const TextStyle(color: Colors.red),
      )
    ],
  );
}
