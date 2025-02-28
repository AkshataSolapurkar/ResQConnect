// Location Permission
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:res_q_connect/functions/sms_functions.dart';

Future<void> getCurrentLocation() async {
  final hasPermission = await Permission.location.isGranted;
  if (hasPermission) {
    await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.best)
        .then((Position position) {
      debugPrint('location generated @ $position');
      smsFunction(position);
    }).catchError((e) {
      debugPrint(e);
    });
  }
}
