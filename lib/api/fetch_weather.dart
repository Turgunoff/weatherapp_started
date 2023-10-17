//
// @Author: "Eldor Turgunov"
// @Date: 16.10.2023
//

import 'dart:convert';

import 'package:weatherapp_started/api/api_key.dart';
import 'package:weatherapp_started/model/weather_data_current.dart';

import '../model/weather_data.dart';
import 'package:http/http.dart' as http;

import '../model/weather_data_daily.dart';
import '../model/weather_data_hourly.dart';

class FetchWeatherAPI {
  WeatherData? weatherData;

  Future<WeatherData?> processData(lat, long) async {
    var response = await http.get(Uri.parse(apiUrl(lat, long)));
    var jsonString = jsonDecode(response.body);
    weatherData = WeatherData(
        WeatherDataCurrent.fromJson(jsonString),
        WeatherDataHourly.fromJson(jsonString),
        WeatherDataDaily.fromJson(jsonString));
    return weatherData;
  }
}

String apiUrl(lat, long) {
  String url =
      "https://api.openweathermap.org/data/3.0/onecall?lat=$lat&lon=$long&appid=$apiKey&units=metric&exclude=minutely";
  return url;
}
