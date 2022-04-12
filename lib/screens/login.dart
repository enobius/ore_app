// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:ore_app/data/login_provider.dart';
import 'package:ore_app/screens/home.dart';
import 'package:provider/provider.dart';

class LoginPage extends StatefulWidget {
  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  Color backgroundColor = Colors.white;
  Color main = const Color.fromARGB(255, 120, 162, 204);
  Color tFocusColor = const Color.fromARGB(255, 117, 20, 141);
  Color tFillColor = const Color.fromARGB(255, 230, 230, 224);
  Color gradientColor2 = const Color.fromARGB(255, 120, 162, 204);
  Color gradientColor1 = const Color.fromARGB(255, 191, 212, 219);
  String title = "ORE";
  String email = "Email";
  String username = "Username";
  String password = "Password";
  String button = "Sign Up";
  String userNameCont = "";
  TextEditingController emailCont = TextEditingController();
  TextEditingController passwordCont = TextEditingController();
  @override
  Widget build(BuildContext context) {
    LoginProvider loginProvider = Provider.of<LoginProvider>(context);

    return Builder(
      builder: (context) {
        return Scaffold(

          body: Container(
            color: backgroundColor,

            child: Center(
              child: Form(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
              
                  // ignore: prefer_const_literals_to_create_immutables
                  children: [
                    Container(
                      padding: EdgeInsets.only(),
              
                      child: Container(

              
                        child: Text(
                          title,
                          style: TextStyle(
                            color: main,
                            fontSize: 30,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
              
                    Container(
                      child: SizedBox(
                        height: 250,
                      ),
                    ),
              
              
                   Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        margin: EdgeInsets.only(left: 20.0),
                        child: Text(
                          email,
                          style: TextStyle(
                            color: Colors.black,
                          ),
                        ),
                      ),

                      Container(
                        padding: EdgeInsets.fromLTRB(15.0, 10.0, 15.0, 20.0),
                        child: TextField(
                          controller: emailCont,
                          style: TextStyle(
                            color: Colors.black,
                          ),
                          decoration: InputDecoration(
                            fillColor: tFillColor,
                            filled: true,
                            border: OutlineInputBorder(
                              borderSide: BorderSide.none,
                              borderRadius: BorderRadius.circular(15.0),
                            ),
                    
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: main),
                              borderRadius: BorderRadius.circular(15.0)
                            ),
                          ),
                        ),
                      ),
                    ]
                  ),
              
                    Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        margin: EdgeInsets.only(left: 20.0),
                        child: Text(
                          password,
                          style: TextStyle(
                            color: Colors.black,
                          ),
                        ),
                      ),

                      Container(
                        padding: EdgeInsets.fromLTRB(15.0, 10.0, 15.0, 20.0),
                        child: TextField(
                          controller: passwordCont,
                          obscureText: true,

                          style: TextStyle(
                            color: Colors.black,
                          ),

                          decoration: InputDecoration(
                            fillColor: tFillColor,
                            filled: true,
                            border: OutlineInputBorder(
                              borderSide: BorderSide.none,
                              borderRadius: BorderRadius.circular(15.0),
                            ),
                    
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: main),
                              borderRadius: BorderRadius.circular(15.0)
                            ),
                          ),
                        ),
                      ),
                    ]
                  ),
              
                    GestureDetector(
                    child: Container(
                      margin: EdgeInsets.fromLTRB(15.0, 80.0, 15.0, 0),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15.0),
                        gradient: LinearGradient(
                          begin: Alignment.centerLeft,
                          end: Alignment.centerRight,
                          colors: [gradientColor1, gradientColor2],
                        ),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        // ignore: prefer_const_literals_to_create_immutables
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(top: 17.0, bottom: 17.0),
                            child: Text(
                              button,
                              style: TextStyle(
                                fontSize: 16,
                                color: Colors.white
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),

                    onTap: () async {
                      await loginProvider.login(emailCont.text, passwordCont.text);
                      if (loginProvider.isLoggedIn) {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => Home()),
                        );
                      }
                    },
                  )
                  ],
                ),
              ),
            ),
          ),
        );
      }
    );
  }
}