import 'dart:async';

import 'package:get/get.dart';
import 'package:getx_exampleapp/getx/network/preference_helper.dart';
import 'package:getx_exampleapp/getx/view/dashboard.dart';
import 'package:getx_exampleapp/getx/view/login_page.dart';

class SplashController extends GetxController {

  String data_id = "";

  @override
  void onInit() {
    super.onInit();
    Future.delayed(Duration(seconds: 4), (){
      gotothenext();
    });
  }

  void gotothenext() async{
    String? data_id = await PreferenceHelper.getLogin();
    if(data_id != null){
      Get.to(() => Dashbaord());
    }else{
      Get.to(() => LoginPage());
    }
  }
}