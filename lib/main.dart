import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:parking/controller/location_controller.dart';
import 'package:parking/helper/theme.dart';
import 'package:parking/repository/api_client.dart';
import 'package:parking/repository/repo_service.dart';
import 'package:parking/view/driver/driver_home.dart';
import 'package:parking/view/home/home.dart';
import 'package:parking/view/parkinglocation/parking_home.dart';

import 'helper/constant_path.dart';

void main() {
  Get.lazyPut(() => ApIClient(appBaseUrl: BASE_URL));
  Get.lazyPut(() => Services(apIClient: Get.find()));

  Get.lazyPut(() => LocationController(serviceRepo: Get.find()));
  Get.find<LocationController>().getList(PARKING);



  runApp(const ParkingApp());
}

class ParkingApp extends StatelessWidget {
  const ParkingApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: "/",
      theme: theme,
      routes: {
        "/home": (context) => const HomePage(),
        "/driver": (context) => const DriverHome(),
        "/parking": (context) => const ParkingHome(),
      },
      home: const Scaffold(
        body: HomePage(),
      ),
    );
  }
}
