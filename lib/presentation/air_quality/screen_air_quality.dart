import 'package:clime_zone/core/color.dart';
import 'package:clime_zone/core/sizes.dart';
import 'package:clime_zone/core/url.dart';
import 'package:clime_zone/domain/home/models/aqi_model/aq_index_model/components.dart';
import 'package:clime_zone/presentation/home/widgets/credit_text.dart';
import 'package:flutter/material.dart';

class ScreenAirQuality extends StatelessWidget {
  const ScreenAirQuality({
    super.key,
    required this.aqiValue,
    required this.itemValues,
  });

  final int aqiValue;
  final Components itemValues;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
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

    if (aqiValue == 1) {
      statusText = 'Air quality is good.A perfect day for a walk!';
      status = 'Good';
      color = Colors.green;
    } else if (aqiValue == 2) {
      statusText = 'Air quality is fair.A perfect day for a walk!';
      status = 'Flair';
      color = const Color.fromARGB(255, 194, 170, 38);
    } else if (aqiValue == 3) {
      statusText =
          'Air is moderately pollutted.It can be harmful to sensitive groups.';
      status = 'Moderate';
      color = Colors.orange;
    } else if (aqiValue == 4) {
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
      body: Stack(
        children: [
          ListView(
            padding: const EdgeInsets.all(20),
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    aqiValue.toString(),
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
                statusText,
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
          ),
          Positioned(
            bottom: 14,
            left: 10,
            right: 10,
            child: CreditText(size: size, color: kWhite),
          )
        ],
      ),
    );
  }
}

class AirQualityItem extends StatelessWidget {
  const AirQualityItem({
    super.key,
    required this.label,
    required this.value,
  });

  final String label;
  final int value;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          value == 00 ? nullValue : value.toString(),
          style: const TextStyle(
            color: Colors.green,
            fontSize: 20,
          ),
        ),
        Text(
          label,
          style: const TextStyle(
            color: Colors.green,
            fontSize: 16,
          ),
        ),
      ],
    );
  }
}
