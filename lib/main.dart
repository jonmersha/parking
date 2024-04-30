import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:parking/controller/location_controller.dart';
import 'package:parking/helper/theme.dart';
import 'package:parking/repository/api_client.dart';
import 'package:parking/repository/repo_service.dart';
import 'package:parking/view/driver/driver_home.dart';
import 'package:parking/view/home/home2.dart';
import 'package:parking/view/reservation/reservation.dart';
import 'package:parking/view/users/profile.dart';

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
        "/home": (context) =>  const HomeScreen(),
        "/driver": (context) => const DriverHome(),
        "/parking": (context) =>  const HomeScreen(),
        "/profile": (context) =>   const ProfileScreen(),
        "/reservation": (context) =>    ReservationScreen(),
      },
      home:  const Scaffold(
        body: HomeScreen(),
      ),
    );
  }
}
