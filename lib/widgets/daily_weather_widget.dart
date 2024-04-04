//
// @Author: "Eldor Turgunov"
// @Date: 16.10.2023
//
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:weatherapp_started/model/weather_data_daily.dart';
import 'package:weatherapp_started/utils/custom_colors.dart';

class DailyWeatherWidget extends StatelessWidget {
  final WeatherDataDaily dailyWeatherData;

  const DailyWeatherWidget({super.key, required this.dailyWeatherData});

  String getDay(final day) {
    DateTime date = DateTime.fromMillisecondsSinceEpoch(day * 1000);
    final x = DateFormat('EEEE').format(date);
    return x;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(20),
      padding: const EdgeInsets.all(15),
      decoration: BoxDecoration(
        color: CustomColors.dividerLine.withAlpha(150),
        borderRadius: const BorderRadius.all(
          Radius.circular(20),
        ),
      ),
      child: Column(
        children: [
          Container(
            alignment: Alignment.topLeft,
            margin: const EdgeInsets.only(bottom: 10),
            child: const Text(
              'Next days',
              style: TextStyle(
                fontSize: 17,
                color: CustomColors.textColorBlack,
              ),
            ),
          ),
          dailyList(),
        ],
      ),
    );
  }

  Widget dailyList() {
    return SizedBox(
      height: 350,
      child: ListView.builder(
        physics: const NeverScrollableScrollPhysics(),
        scrollDirection: Axis.vertical,
        itemCount: dailyWeatherData.daily.length > 7
            ? 7
            : dailyWeatherData.daily.length,
        itemBuilder: (context, index) {
          return Column(
            children: [
              Container(
                height: 50,
                padding: const EdgeInsets.only(left: 10, right: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    SizedBox(
                      width: 80,
                      child: Text(
                        getDay(dailyWeatherData.daily[index].dt),
                        style: const TextStyle(
                          color: CustomColors.textColorBlack,
                          fontSize: 14,
                        ),
                      ),
                    ),
                    SizedBox(
                      child: Image.asset(
                        'assets/weather/${dailyWeatherData.daily[index].weather![0].icon}.png',
                        height: 30,
                        width: 30,
                      ),
                    ),
                    Text(
                        '${dailyWeatherData.daily[index].temp!.max}°/${dailyWeatherData.daily[index].temp!.min}°'),
                  ],
                ),
              ),
              Container(
                height: 1,
                color: CustomColors.dividerLine,
              )
            ],
          );
        },
      ),
    );
  }
}
