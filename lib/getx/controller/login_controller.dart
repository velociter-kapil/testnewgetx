import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:getx_exampleapp/getx/network/preference_helper.dart';
import 'package:getx_exampleapp/getx/view/dashboard.dart';
import 'package:http/http.dart' as http;
import '../network/httphelper.dart';



class LoginController extends GetxController{

  TextEditingController username = TextEditingController();
  TextEditingController password = TextEditingController();
  RxBool pass_visable = false.obs;

  void VisiblePass(value){
    pass_visable.value = value;
  }

  Future login() async {
    String msg = "";
    bool status = false;
    Map jsondata = {
      "username": username.text,
      "password": password.text
    };
    try {
      final responsedata = await HttpHelper.postRequest(PreferenceHelper.login_user, jsondata);
      status = responsedata['status'];
      if(status){
        msg = responsedata['message'];
        Fluttertoast.showToast(msg: msg);
        dynamic data_list = responsedata['data'];
        int user_id = data_list[0]['id'];
        PreferenceHelper.saveLogin(user_id.toString());
        Get.to(() => Dashbaord());
      }else{
        msg = responsedata['message'];
        Fluttertoast.showToast(msg: msg);
      }
    } catch (e) {
      print('Error: $e');
    }

    // if(responsedata.statusCode == 200){
    //   final data = json.decode(responsedata.body);
    //   status = data['status'];
    //   if(status){
    //     msg = data['message'];
    //     Fluttertoast.showToast(msg: msg);
    //     Get.to(() => Dashbaord());
    //   }else{
    //     msg = data['message'];
    //     Fluttertoast.showToast(msg: msg);
    //   }
    // }
  }
}

