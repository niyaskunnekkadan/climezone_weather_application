import 'package:clime_zone/application/bloc/home_bloc_bloc.dart';
import 'package:clime_zone/core/color.dart';
import 'package:clime_zone/core/sizes.dart';
import 'package:clime_zone/domain/home/models/aqi_model/aq_index_model/components.dart';
import 'package:clime_zone/presentation/air_quality/widgets/air_quality_item_widget.dart';
import 'package:clime_zone/presentation/widgets/error_widget.dart';
import 'package:clime_zone/presentation/widgets/loading_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ScreenAirQuality extends StatelessWidget {
  const ScreenAirQuality({
    super.key,
    required this.lat,
    required this.lon,
  });

  final double lat;
  final double lon;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      context.read<HomeBloc>().add(HomeEvent.mainCard(lat: lat, lon: lon));
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
          'Air Quality Index',
          style: TextStyle(
            color: kWhite,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      body: BlocBuilder<HomeBloc, HomeState>(
        builder: (context, state) {
          if (state.isLoading) {
            return const KonstLoadingIndictor.white();
          } else if (state.isError) {
            return const KonstErrorWidget();
          } else if (state.aqiList.isEmpty) {
            return const KonstErrorWidget.customize(
              title: 'Oh no!',
              content: 'Aqi values unavailbale',
            );
          } else {
            final itemValues = state.aqiList[0].components ?? Components();

            final listOfValue = [
              itemValues.co,
              itemValues.nh3,
              itemValues.no,
              itemValues.no2,
              itemValues.o3,
              itemValues.pm10,
              itemValues.so2,
              itemValues.pm25,
            ];

            final listOfLabel = [
              'co',
              'nh3',
              'no',
              'no2',
              'o3',
              'pm10',
              'so2',
              'pm2.5'
            ];
            String statusText = '';
            String status = '';
            Color color = Colors.white;

            if (state.aqiList[0].main!.aqi == 1) {
              statusText = 'Air quality is good.A perfect day for a walk!';
              status = 'Good';
              color = Colors.green;
            } else if (state.aqiList[0].main!.aqi == 2) {
              statusText = 'Air quality is fair.A perfect day for a walk!';
              status = 'Flair';
              color = const Color.fromARGB(255, 194, 170, 38);
            } else if (state.aqiList[0].main!.aqi == 3) {
              statusText =
                  'Air is moderately pollutted.It can be harmful to sensitive groups.';
              status = 'Moderate';
              color = Colors.orange;
            } else if (state.aqiList[0].main!.aqi == 4) {
              statusText =
                  'The concentration of PM2.5 in the air outside is high.Wear a mask when you gout.';
              status = 'Poor';
              color = const Color.fromARGB(255, 223, 89, 28);
            } else {
              statusText =
                  'Air quality is extremly poor.Try to stay indoors.Close your doors and windows.';
              status = 'Very Poor';
              color = Colors.red;
            }
            return ListView(
              padding: const EdgeInsets.all(20),
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                      '${state.aqiList[0].main!.aqi}',
                      style: const TextStyle(
                        color: Colors.orange,
                        fontWeight: FontWeight.w500,
                        fontSize: 50,
                      ),
                    ),
                    width10,
                    Text(
                      status,
                      style: TextStyle(
                        color: color,
                        fontWeight: FontWeight.w400,
                        fontSize: 30,
                      ),
                    ),
                  ],
                ),
                Text(
                  "In ${state.data!.name!}. $statusText",
                  style: TextStyle(
                    color: kWhite.withOpacity(.7),
                    fontSize: 18,
                  ),
                ),
                height20,
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: List.generate(
                    listOfLabel.length,
                    (index) {
                      late int val;
                      if (listOfValue.length <= index) {
                        val = 0;
                      } else {
                        val = listOfValue[index]!.round();
                      }

                      return AirQualityItem(
                        label: listOfLabel[index],
                        value: val,
                      );
                    },
                  ),
                ),
              ],
            );
          }
        },
      ),
    );
  }
}
