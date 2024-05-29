import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_exampleapp/getx/model/user_model.dart';
import 'package:getx_exampleapp/getx/network/preference_helper.dart';
import 'package:getx_exampleapp/getx/view/login_page.dart';
import 'package:intl/intl.dart';

import '../controller/dashboard_controller.dart';

class Dashbaord extends StatelessWidget {
  Dashbaord({super.key});

  DashBoard_Controller dashBoard_Controller = Get.put(DashBoard_Controller());

  @override
  Widget build(BuildContext context) {
    return Obx(() => Scaffold(
      appBar: AppBar(
        title: Text("Dashboard"),
      ),
      body: dashBoard_Controller.isLoading.value ? Center(
        child: CircularProgressIndicator(),
      )
          : dashBoard_Controller.user_model.value.isEmpty ? Center(
        child: Text("No Data Found"),
      ) : Column(
        children: [
          Text("Working list"),
          Padding(padding: EdgeInsets.all(10)),
          Expanded(
              child: ListView.builder(
                  //controller: dashBoard_Controller.scrollController,
                  itemCount: dashBoard_Controller.user_model.length,
                  itemBuilder: (BuildContext context, int index){
                    return ShowUser(dashBoard_Controller.user_model.value[index]);
                  }
              )
          )
        ],
      ),
    ));
  }

  Widget ShowUser(UserModel value) {

    DateFormat dateFormat = DateFormat("dd/MM/yyyy hh:mm a");
    DateTime c_date = DateTime.parse(value.createdAt!);
    String create_date = dateFormat.format(c_date);

    DateTime u_date = DateTime.parse(value.updatedAt!);
    String update_date = dateFormat.format(u_date);

    return InkWell(
      onTap: () async {
         await PreferenceHelper.removeLogin();
         Get.to(() => LoginPage());
      },
      child: Card(
        elevation: 5,
        child: Padding(
          padding: EdgeInsets.all(10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                child: Text("ID:- "+value.id.toString()),
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                child: Text("Name:- "+value.username.toString()),
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                child: Text("Email:- "+value.email.toString()),
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                child: Text("Mobile No.:- "+value.mobile_no.toString()),
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                child: Text("Address:- "+value.address.toString()),
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                child: Text("School_name:- "+value.School_name.toString()),
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                child: Text("Collage Name:- "+value.college_name.toString()),
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                child: Text("Created Date:- "+create_date.toString()),
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                child: Text("Update Date:- "+update_date.toString()),
              )
            ],
          ),
        ),
      ),
    );
  }
}
