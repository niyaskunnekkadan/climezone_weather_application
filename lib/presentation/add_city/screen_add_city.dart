import 'package:clime_zone/application/add_city_bloc/add_city_bloc.dart';

import 'package:clime_zone/core/color.dart';
import 'package:clime_zone/core/sizes.dart';
import 'package:clime_zone/presentation/widgets/tiny_widgets.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ScreenAddCity extends StatelessWidget {
  const ScreenAddCity({super.key});

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<AddCityBloc>().add(const Initial());
    });
    return Scaffold(
      backgroundColor: kBlack,
      appBar: AppBar(
        iconTheme: const IconThemeData(
          color: Colors.white70,
        ),
        backgroundColor: Colors.transparent,
        centerTitle: true,
        title: const Text(
          'Manage Cities',
          style: TextStyle(
            color: kWhite,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(15),
        child: Column(
          children: [
            CupertinoSearchTextField(
              onChanged: (value) {
                context
                    .read<AddCityBloc>()
                    .add(AddCityEvent.searching(place: value));
              },
              backgroundColor: Colors.grey.shade800,
              prefixIcon:
                  const Icon(CupertinoIcons.search, color: Colors.white60),
              suffixIcon: const Icon(CupertinoIcons.xmark_circle_fill,
                  color: Colors.white60),
              style: const TextStyle(color: Colors.white),
              padding: const EdgeInsets.all(10),
            ),
            height20,
            BlocBuilder<AddCityBloc, AddCityState>(
              builder: (context, state) {
                if (state.isLoading) {
                  return loadingIndictor;
                } else if (state.isError) {
                  return const Center(
                      child: Text(
                    'Error',
                    style: TextStyle(color: Colors.white),
                  ));
                } else if (state.addedCities.isEmpty) {
                  return const Center(
                      child: Text(
                    'List is empty',
                    style: TextStyle(color: Colors.white),
                  ));
                }
                return state.searchingCities != null
                    ? Expanded(
                        child: ListView(
                          children: List.generate(
                              10, (index) => const SearchCityResWidget()),
                        ),
                      )
                    : Expanded(
                        child: ListView(
                          children: state.addedCities.map((e) => e).toList(),
                        ),
                      );
              },
            ),
          ],
        ),
      ),
    );
  }
}

class SearchCityResWidget extends StatelessWidget {
  const SearchCityResWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: const Text(
        'Kochi',
        style: TextStyle(color: Colors.white),
      ),
      subtitle: const Text(
        'Kerala, India',
        style: TextStyle(color: Colors.white70),
      ),
      trailing: IconButton(
        onPressed: () {},
        color: Colors.grey.shade200,
        splashRadius: 30,
        icon: const Icon(
          CupertinoIcons.add,
          color: Colors.white,
        ),
      ),
    );
  }
}

class AddedCityItem extends StatelessWidget {
  const AddedCityItem({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(vertical: 5),
      child: Card(
        child: ListTile(
          title: Text('Kochi'),
          subtitle: Text('AQI 36 36/25'),
          trailing: Text('42'),
        ),
      ),
    );
  }
}
