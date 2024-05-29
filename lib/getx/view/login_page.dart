import 'package:flutter/material.dart';
import 'package:getx_exampleapp/getx/controller/login_controller.dart';

class LoginPage extends StatelessWidget {

  LoginController _loginController = LoginController();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
     appBar: AppBar(
       title: Text("Login Page"),
     ),
     body: Center(
       child: SingleChildScrollView(
         child: Padding(
           padding: EdgeInsets.all(15),
           child: Column(
             children: [
               SizedBox(
                 height: 10,
               ),
               Text("Login", style: TextStyle(color: Colors.blue, fontSize: 20),),
               SizedBox(
                 height: 30,
               ),
               TextFormField(
                 controller: _loginController.username,
                 keyboardType: TextInputType.text,
                 decoration: InputDecoration(
                     hintText: "Enter Username",
                     hintStyle: TextStyle(color: Colors.black26),
                     label: Text("Username"),
                     labelStyle: TextStyle(color: Colors.black),
                     suffixIcon: Icon(Icons.person),
                     suffixIconColor: Colors.blue,
                     border: OutlineInputBorder(
                         borderSide: BorderSide(
                           color: Colors.black,
                         ),
                         borderRadius: BorderRadius.circular(10)

                     )
                 ),
               ),
               SizedBox(
                 height: 30,
               ),
               TextFormField(
                 controller: _loginController.password,
                 keyboardType: TextInputType.visiblePassword,
                 obscureText: _loginController.pass_visable.value,
                 decoration: InputDecoration(
                     hintText: "Enter Password",
                     hintStyle: TextStyle(color: Colors.black26),
                     label: Text("Password"),
                     labelStyle: TextStyle(color: Colors.black),
                     suffixIconColor: Colors.blue,
                     suffixIcon: IconButton(
                       onPressed: (){
                         if(_loginController.pass_visable.value){
                           _loginController.VisiblePass(false);
                         }else{
                           _loginController.VisiblePass(true);
                         }
                       },
                       icon: _loginController.pass_visable.value ?
                       Icon(Icons.visibility) :
                       Icon(Icons.visibility_off),
                     ),
                     border: OutlineInputBorder(
                         borderRadius: BorderRadius.circular(10),
                         borderSide: BorderSide(color: Colors.black)
                     )

                 ),
               ),
               SizedBox(
                 height: 30,
               ),
               ElevatedButton(onPressed: (){
                 _loginController.login();
               }, child: Text("Login")
               )
             ],
           ),
         ),
       ),
     ),
    );
  }
}