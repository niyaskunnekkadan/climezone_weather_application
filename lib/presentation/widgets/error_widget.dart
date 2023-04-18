import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class KonstErrorWidget extends StatelessWidget {
  const KonstErrorWidget({
    super.key,
    this.title = 'Oh no!',
    this.content = 'Something went wrong.',
  });

  const KonstErrorWidget.customize({
    super.key,
    required this.title,
    required this.content,
  });

  final String title;
  final String content;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Center(
        child: Container(
      width: size.width / 2,
      height: size.height / 4,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
      ),
      padding: const EdgeInsets.all(10),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const CircleAvatar(
            radius: 40,
            backgroundColor: Colors.red,
            child: Icon(
              CupertinoIcons.xmark,
              color: Colors.white,
            ),
          ),
          Text(
            title,
            style: const TextStyle(
              color: Colors.red,
              fontWeight: FontWeight.w700,
              fontSize: 29,
            ),
          ),
          Text(
            content,
            style: const TextStyle(
              color: Colors.black45,
              fontWeight: FontWeight.w300,
              fontSize: 14,
            ),
          ),
        ],
      ),
    ));
  }
}
