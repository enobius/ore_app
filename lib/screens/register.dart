// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class RegisterPage extends StatefulWidget {
  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  @override
  Widget build(BuildContext context) {
    Color backgroundColor = Colors.white;
    Color main = const Color.fromARGB(255, 120, 162, 204);
    Color tFocusColor = const Color.fromARGB(255, 117, 20, 141);
    Color tFillColor = const Color.fromARGB(255, 230, 230, 224);
    Color gradientColor2 = const Color.fromARGB(255, 120, 162, 204);
    Color gradientColor1 = const Color.fromARGB(255, 191, 212, 219);
    const String title = "Sign Up";
    const String email = "Email";
    const String username = "Username";
    const String password = "Password";
    const String button = "Sign Up";
    String userNameCont = "";
    String emailCont = "";
    String passwordCont = "";

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
                    margin: EdgeInsets.only(left: 20),
          
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,          
                      children: [
                        IconButton(onPressed: (){}, icon: Icon(
                          Icons.arrow_back_ios_new,
                          color: main,
                          size: 20,
                        )),
                        Text(
                          title,
                          style: TextStyle(
                            color: main,
                            fontSize: 30,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
          
                Container(
                  margin: EdgeInsets.only(top: 20),
                  padding: EdgeInsets.all(0),
                  child: SizedBox(
                    height: 150,
                  ),
                ),
          
               Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    margin: EdgeInsets.only(left: 20.0),
                    child: Text(
                      username,
                      style: TextStyle(
                        color: Colors.black,
                      ),
                    ),
                  ),

                  Container(
                    padding: EdgeInsets.fromLTRB(15.0, 10.0, 15.0, 20.0),
                    child: TextField(
                      controller: null,
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
                      email,
                      style: TextStyle(
                        color: Colors.black,
                      ),
                    ),
                  ),

                  Container(
                    padding: EdgeInsets.fromLTRB(15.0, 10.0, 15.0, 20.0),
                    child: TextField(
                      controller: null,
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
                      controller: null,
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
                  
                },
              )
              ],
            ),
          ),
        ),
      ),
    );
  }
}