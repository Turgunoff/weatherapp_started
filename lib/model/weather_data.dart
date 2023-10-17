//
// @Author: "Eldor Turgunov"
// @Date: 16.10.2023
//

import 'package:weatherapp_started/model/weather_data_current.dart';
import 'package:weatherapp_started/model/weather_data_daily.dart';
import 'package:weatherapp_started/model/weather_data_hourly.dart';

class WeatherData {
  final WeatherDataCurrent? current;
  final WeatherDataHourly? hourly;
  final WeatherDataDaily? daily;

  WeatherData([this.current, this.hourly, this.daily]);

  WeatherDataCurrent getCurrentWeather() => current!;

  WeatherDataHourly getHourlyWeather() => hourly!;

  WeatherDataDaily getDailyWeather() => daily!;
}
