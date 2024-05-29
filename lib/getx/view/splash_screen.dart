import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_exampleapp/getx/controller/splash_controller.dart';

class SplashScreen extends StatelessWidget{

  SplashController controller = Get.put(SplashController()); ///register karte

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Splash Screen"),
      ),
      body: Center(
        child: Text("Your Splash Screen is running here"),
      ),
    );
  }
}