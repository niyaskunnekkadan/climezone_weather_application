import 'dart:developer';

import 'package:clime_zone/application/add_city_bloc/add_city_bloc.dart';
import 'package:clime_zone/application/bloc/home_bloc_bloc.dart';
import 'package:clime_zone/core/color.dart';
import 'package:clime_zone/core/url.dart';
import 'package:clime_zone/infrastructure/saved_place_db/i_db_service.dart';
import 'package:clime_zone/presentation/home/screen_home.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AddedCityItem extends StatelessWidget {
  const AddedCityItem({
    super.key,
    required this.name,
    required this.value,
    required this.isDel,
  });

  final String name;
  final bool isDel;
  final int value;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 5),
      child: Card(
        color: value != 0 ? Colors.blue.shade100 : Colors.blue.shade200,
        child: ListTile(
          onTap: () {
            Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(
              builder: (context) {
                return ScreenHome(value: value);
              },
            ), (route) => false);
          },
          onLongPress: () {
            context.read<AddCityBloc>().add(const Delete());
          },
          title: Text(name),
          trailing: isDel
              ? value != 0
                  ? IconButton(
                      onPressed: () async {
                        await IDBService().removePlace(value);
                        context.read<AddCityBloc>().add(const Initial());
                      },
                      icon: const Icon(
                        CupertinoIcons.delete,
                        color: Colors.red,
                      ))
                  : const Icon(
                      CupertinoIcons.cloud,
                      color: Colors.black,
                    )
              : const Icon(
                  CupertinoIcons.cloud,
                  color: Colors.black,
                ),
        ),
      ),
    );
  }
}
