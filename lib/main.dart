import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:weatherapp_started/screens/home_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const GetMaterialApp(
      title: 'WeatherApp',
      home: HomeScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}
