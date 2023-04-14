import 'package:clime_zone/core/color.dart';
import 'package:clime_zone/core/sizes.dart';
import 'package:clime_zone/presentation/manageCity/widgets/city_card.dart';
import 'package:clime_zone/presentation/manageCity/widgets/search_field.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';

class ScreenManageCity extends StatelessWidget {
  const ScreenManageCity({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    bool isActive = false;
    return Scaffold(
      backgroundColor: Colors.black54,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Text(
          'Manage Cities',
          style: TextStyle(
            color: kWhite,
            fontWeight: FontWeight.w500,
            fontSize: size.width * .052,
          ),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(15),
        child: Column(
          children: [
            SearchFieldManageCity(
              onTap: () {
                isActive = true;
                print(isActive);
              },
            ),
            height20,
            isActive
                ? Expanded(
                    child: Container(
                      color: Colors.yellow,
                      width: double.infinity,
                    ),
                  )
                : Expanded(
                    child: ListView.separated(
                      itemBuilder: (context, index) {
                        return CityCard(size: size, title: 'Kochi');
                      },
                      separatorBuilder: (context, index) {
                        return height10;
                      },
                      itemCount: 10,
                    ),
                  ),
          ],
        ),
      ),
    );
  }
}
