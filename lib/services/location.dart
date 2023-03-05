import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';

// void getLocation() async {
//   try {
//     LocationPermission permission = await Geolocator.requestPermission();
//     permission;
//     Position position = await Geolocator.getCurrentPosition(
//         desiredAccuracy: LocationAccuracy.high);
//     print(position);
//   } catch (e) {
//     print(e);
//   }
// }

class Location {
  // Location();

  late double latitude;
  late double longitude;

  Future<void> getCurrentLocation() async {
    try {
      LocationPermission permission = await Geolocator.requestPermission();
      permission;
      Position position = await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.high);
      // print(position);
      latitude = position.latitude;
      // print(latitude);
      longitude = position.longitude;
      // latitude = 6.518312532584142;
      // print(latitude);
      // longitude = 3.39813257791997;
      //6.518199928451485, 3.3980431969211486
      // print(longitude);
    } catch (e) {
      print(e);
    }
  }
}

//6.518312532584142, 3.39813257791997
