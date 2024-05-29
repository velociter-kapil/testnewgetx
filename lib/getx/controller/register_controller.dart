import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:getx_exampleapp/getx/network/preference_helper.dart';
import 'package:http/http.dart' as http;

import '../view/login_page.dart';

class Register_Controller extends GetxController{

  TextEditingController mobile_text = TextEditingController();
  TextEditingController email_text = TextEditingController();
  TextEditingController username_text = TextEditingController();
  TextEditingController password_text = TextEditingController();
  TextEditingController address_text = TextEditingController();
  TextEditingController schoolname_text = TextEditingController();
  TextEditingController collage_text = TextEditingController();

  RxBool visible_pass = false.obs;


  @override
  void onInit() {
    super.onInit();
  }

  setVisable(bool value){
    visible_pass.value = value;
  }

  Future Submit() async {
    String msg = "";
    bool status = false;
    Map jsonobject = {
      "mobile_no": mobile_text.text,
      "email": email_text.text,
      "username": username_text.text,
      "password": password_text.text,
      "address": address_text.text,
      "School_name": schoolname_text.text,
      "college_name": collage_text.text
    };
    final responsedata = await http.post(Uri.parse(PreferenceHelper.Register_user), body: jsonobject);
    if(responsedata.statusCode == 200){
      final data = json.decode(responsedata.body);
      status = data['status'];
      if(status){
        msg = data['message'];
        Fluttertoast.showToast(msg: msg);
        Get.to(() => LoginPage());
      }else{
        msg = data['message'];
        Fluttertoast.showToast(msg: msg);
      }
    }else{
      Fluttertoast.showToast(msg: "Not Register");

    }
  }
}

// ketalr
// Ketanr@123