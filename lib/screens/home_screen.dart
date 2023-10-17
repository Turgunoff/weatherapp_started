//
// @Author: "Eldor Turgunov"
// @Date: 16.10.2023
//

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:weatherapp_started/utils/custom_colors.dart';
import 'package:weatherapp_started/widgets/comfort_level.dart';
import 'package:weatherapp_started/widgets/current_weather_widget.dart';
import 'package:weatherapp_started/widgets/header_widget.dart';
import 'package:weatherapp_started/widgets/hourly_weather_widget.dart';

import '../controller/global_controller.dart';
import '../widgets/daily_weather_widget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final GlobalController _globalController =
      Get.put(Get.put(GlobalController(), permanent: true));

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Obx(
        () => _globalController.checkLoading().isTrue
            ? Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      'assets/icons/clouds.png',
                      height: 200,
                      width: 200,
                    ),
                    const CircularProgressIndicator()
                  ],
                ),
              )
            : Center(
                child: ListView(
                  physics: const BouncingScrollPhysics(),
                  scrollDirection: Axis.vertical,
                  children: [
                    const SizedBox(height: 10),
                    const HeaderWidget(),
                    CurrentWeatherWidget(
                        weatherDataCurrent:
                            _globalController.getData().getCurrentWeather()),
                    const SizedBox(height: 20),
                    HourlyWeatherWidget(
                        weatherDataHourly:
                            _globalController.getData().getHourlyWeather()),
                    DailyWeatherWidget(
                        dailyWeatherData:
                            _globalController.getData().getDailyWeather()),
                    Container(height: 1, color: CustomColors.dividerLine),
                    const SizedBox(height: 10),
                    ComfortLevel(
                        weatherDataCurrent:
                            _globalController.getData().getCurrentWeather()),
                  ],
                ),
              ),
      ),
    );
  }
}
