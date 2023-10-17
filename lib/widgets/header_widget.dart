//
// @Author: "Eldor Turgunov"
// @Date: 16.10.2023
//
import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../controller/global_controller.dart';

class HeaderWidget extends StatefulWidget {
  const HeaderWidget({super.key});

  @override
  State<HeaderWidget> createState() => _HeaderWidgetState();
}

class _HeaderWidgetState extends State<HeaderWidget> {
  String city = '';
  String date = DateFormat('yMMMMd').format(DateTime.now());

  final GlobalController _globalController =
      Get.put(Get.put(GlobalController(), permanent: true));

  @override
  void initState() {
    getAddress(_globalController.getLattitude().value,
        _globalController.getLongitude().value);
    super.initState();
  }

  getAddress(lat, long) async {
    List<Placemark> placemarks = await placemarkFromCoordinates(lat, long);
    Placemark place = placemarks[0];
    setState(() {
      city = place.locality!;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          margin: const EdgeInsets.only(right: 20, left: 20),
          alignment: Alignment.topLeft,
          child: Text(city, style: const TextStyle(fontSize: 30, height: 2.0)),
        ),
        Container(
          margin: const EdgeInsets.only(right: 20, left: 20, bottom: 20),
          alignment: Alignment.topLeft,
          child: Text(date,
              style: TextStyle(
                  fontSize: 14, color: Colors.grey.shade700, height: 1.5)),
        )
      ],
    );
  }
}
