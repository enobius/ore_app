// ignore_for_file: prefer_const_constructors

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:firebase_database/firebase_database.dart';

class Home extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    Color main = const Color.fromARGB(255, 120, 162, 204);
    Color background = const Color.fromARGB(255, 250, 250, 250);
    String title = "ORE Lock";
    String userMan = "User Management";
    String keyMan = "Key Management";
    FirebaseDatabase database = FirebaseDatabase.instance;
    DatabaseReference ref = FirebaseDatabase.instance.ref("Account_id");
    void func() async {
      Query query = ref.orderByChild("Primary_Keys");
      DataSnapshot event = await query.get();
      print(event.value);
    }

    func();

    return Scaffold(
      appBar: AppBar(
        backgroundColor: background,
        centerTitle: true,
        elevation: 0,
        title: Text(
          title,
          style: TextStyle(
            color: main,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Center(
            child: Container(
              margin: EdgeInsets.only(top: 150),
              width: 200,
              height: 200,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.grey[200],
                // ignore: prefer_const_literals_to_create_immutables
                boxShadow: [
                  // ignore: prefer_const_constructors
                  BoxShadow(
                    color: Colors.white,
                    offset: Offset(-15 / 2, -15 / 2),
                    blurRadius:  1.5 * 15,
                  ),
                  // ignore: prefer_const_constructors
                  BoxShadow(
                    color: Colors.grey.shade400,
                    offset: Offset(15 / 2, 15 / 2),
                    blurRadius: 1.5 * 15,
                  )
                ],
              ),

              child: Center(
                child: SvgPicture.asset(
                  "images/lockedLock.svg",
                  color: main,
                  width: 53,
                  height: 89,
                ),
              ),
            ),
          ),

          Container(
            margin: EdgeInsets.only(top: 240, left: 10, right: 10),
            child: Card(
              child: Container(
                padding: EdgeInsets.all(15.0),
                child: Row(

                  children: [
                    Icon(
                      Icons.account_circle_sharp,
                      color: main,
                      size: 50,
                    ),

                    Container(
                      margin: EdgeInsets.only(left: 10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            userMan,

                            style: TextStyle(
                              color: Colors.black54,
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),

                          Text(
                            "4 Users",

                            style: TextStyle(
                              color: Colors.black54,
                              fontStyle: FontStyle.italic
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),

          Container(
            margin: EdgeInsets.only(top: 10, left: 10, right: 10),
            child: Card(
              child: Container(
                  padding: EdgeInsets.all(15.0),
                  child: Row(
                    children: [
                      Container(
                        width: 50,
                        height: 50,
                        child: CircleAvatar(
                          backgroundColor: main,
                          radius: 44,
                          child: SvgPicture.asset(
                            "images/key.svg",
                            color: Colors.white,
                            width: 34,

                          ),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(left: 10),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              keyMan,

                              // ignore: prefer_const_constructors
                              style: TextStyle(
                                color: Colors.black54,
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            ),

                            Text(
                              "2 Keys",

                              style: TextStyle(
                                color: Colors.black54,
                                fontStyle: FontStyle.italic
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
            ),
          )
        ],
      ),
    );
  }
}