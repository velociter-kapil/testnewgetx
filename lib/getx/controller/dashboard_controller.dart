import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_exampleapp/getx/network/preference_helper.dart';
import 'package:http/http.dart' as http;

import '../model/user_model.dart';
import 'login_controller.dart';

class DashBoard_Controller extends GetxController {

  RxList<UserModel> user_model = <UserModel>[].obs;
  RxBool isLoading = false.obs;
  ScrollController scrollController = ScrollController();

  @override
  void onInit() {
    super.onInit();
    getuserlist();
  }

  Future getuserlist() async {
   try{
     isLoading.value = true;
     String message = "";
     bool status = false;
     final responsedata = await http.get(Uri.parse(PreferenceHelper.getalluser));
     if(responsedata.statusCode == 200){
       final decode_data = json.decode(responsedata.body);
       status = decode_data['status'];
       if(status){
         isLoading.value = false;
         message = decode_data['message'];
         user_model.value = List<UserModel>.from(decode_data['data'].map((e) => UserModel.fromjson(e)));
       }else{
         message = decode_data['message'];
       }
     }else{
       isLoading.value = false;
     }
   }catch(e){
     print(e);
   }
  }
}


//smithvV
//smithVv@123