import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_exampleapp/getx/controller/register_controller.dart';
import 'package:getx_exampleapp/getx/view/dashboard.dart';
import 'package:getx_exampleapp/getx/view/login_page.dart';

class Register_page extends StatelessWidget {

  Register_Controller _register_controller = Get.put(Register_Controller());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Register Form"),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.only(left: 10, right: 10, top: 5, bottom: 5),
          child: Column(
            children: [
              SizedBox(
                height: 10,
              ),
              TextFormField(
                controller: _register_controller.mobile_text,
                keyboardType: TextInputType.phone,
                maxLength: 10,
                decoration: InputDecoration(
                  counterText: "",
                  hintText: "Enter Mobile No.",
                  hintStyle: TextStyle(color: Colors.black26),
                  suffixIcon: Icon(Icons.phone_android),
                  suffixIconColor: Colors.blue,
                  label: Text("Mobile No."),
                  labelStyle: TextStyle(color: Colors.black),
                  border: OutlineInputBorder(
                   borderRadius: BorderRadius.all(Radius.circular(10)),
                   borderSide: BorderSide(
                     color: Colors.black
                   )
                  )
                ),
              ),
              SizedBox(
                height: 10,
              ),
              TextFormField(
                controller: _register_controller.email_text,
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(
                  hintText: "Enter Email-ID",
                  hintStyle: TextStyle(color: Colors.grey),
                  suffixIcon: Icon(Icons.email),
                  suffixIconColor: Colors.blue,
                  label: Text("Email-ID"),
                  labelStyle: TextStyle(color: Colors.black),
                  border: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.black),
                    borderRadius: BorderRadius.all(Radius.circular(10))
                  )
                ),
              ),
              SizedBox(
                height: 10,
              ),
              TextFormField(
                controller: _register_controller.username_text,
                keyboardType: TextInputType.text,
                decoration: InputDecoration(
                  hintText: "Enter Username",
                  hintStyle: TextStyle(color: Colors.black26),
                  label: Text("Username"),
                  labelStyle: TextStyle(color: Colors.black),
                  suffixIcon: Icon(Icons.people),
                  suffixIconColor: Colors.blue,
                  border:  OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide(color: Colors.black)
                  )
                ),
              ),
              SizedBox(
                height: 10,
              ),
              TextFormField(
                controller: _register_controller.password_text,
                keyboardType: TextInputType.visiblePassword,
                obscureText: _register_controller.visible_pass.value,
                decoration: InputDecoration(
                  hintStyle: TextStyle(color: Colors.black26),
                  hintText: "Enter Password",
                  label: Text("Password"),
                  labelStyle: TextStyle(color: Colors.black),
                  suffixIcon: IconButton(
                    icon: _register_controller.visible_pass.value ? Icon(Icons.visibility) : Icon(Icons.visibility_off),
                    onPressed: () {
                      if(_register_controller.visible_pass.value){
                        _register_controller.setVisable(false);
                      }else{
                        _register_controller.setVisable(true);
                      }
                    },
                  ),
                  suffixIconColor: Colors.blue,
                  border: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.black),
                    borderRadius: BorderRadius.circular(10)
                  )
                ),

              ),
              SizedBox(
                height: 10,
              ),
              TextFormField(
                controller: _register_controller.address_text,
                keyboardType: TextInputType.text,
                decoration: InputDecoration(
                  hintText: "Enter Address",
                  hintStyle: TextStyle(color: Colors.black26),
                  label: Text("Address"),
                  labelStyle: TextStyle(color: Colors.black),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide(
                      color: Colors.black
                    )
                  )
                ),
              ),
              SizedBox(
                height: 10,
              ),
              TextFormField(
                controller: _register_controller.schoolname_text,
                keyboardType: TextInputType.text,
                decoration: InputDecoration(
                  hintStyle: TextStyle(color: Colors.black26),
                  hintText: "Enter School Name",
                  labelStyle: TextStyle(color: Colors.black),
                  label: Text("School Name"),
                  border: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.black,
                    ),
                    borderRadius: BorderRadius.circular(10)
                  )
                ),
              ),
              SizedBox(
                height: 10,
              ),
              TextFormField(
                controller: _register_controller.collage_text,
                keyboardType: TextInputType.text,
                decoration: InputDecoration(
                  hintText: "Enter Collage Name",
                  hintStyle: TextStyle(color: Colors.black26),
                  label: Text("Collage Name"),
                  labelStyle: TextStyle(color: Colors.black),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide(
                      color: Colors.black
                    )
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                children: [
                  ElevatedButton(onPressed: (){
                    _register_controller.Submit();
                  }, child: Text("Submit")
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  ElevatedButton(onPressed: (){
                     Get.to(() => LoginPage());
                  }, child: Text("Login")
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}