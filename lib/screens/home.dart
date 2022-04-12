// ignore_for_file: prefer_const_constructors

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ore_app/data/data_repository.dart';
import 'package:ore_app/data/login_provider.dart';
import 'package:ore_app/screens/user_man.dart';
import 'package:provider/provider.dart';

class Home extends StatefulWidget {
  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Color main = const Color.fromARGB(255, 120, 162, 204);
  Color background = const Color.fromARGB(255, 250, 250, 250);
  String title = "ORE Lock";
  String userMan = "User Management";
  String keyMan = "Key Management";
  final DataRepository rep = DataRepository();
  int taps = 0;
  int users = 0;
  bool isEli = false;

  @override
  Widget build(BuildContext context) {
    LoginProvider loginProvider = Provider.of<LoginProvider>(context);
    void addTap() {
      if (taps == 2) {
        taps = 0;
      }
      setState(() {
        taps++;
      });
    }

    void isEligible(String email) async {
      print(email);
      String id = await rep.getUserId(email);
      List users = await rep.getLockUsers();
      if (users.contains(id)) {
        setState(() {
          isEli = true;
        });
      }
    }

    void lockFunc() {
      if (isEli) {
        if (taps == 1) {
          rep.lock();
        } else if (taps == 2) {
          rep.unlock();
        }
      }
    }

    void getNumUsers() async {
      int numUsers = await rep.getNumUsers();
      setState(() {
        users = numUsers;
      });
    }

    getNumUsers();

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
      body:  Column(
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
                      blurRadius: 1.5 * 15,
                    ),
                    // ignore: prefer_const_constructors
                    BoxShadow(
                      color: Colors.grey.shade400,
                      offset: Offset(15 / 2, 15 / 2),
                      blurRadius: 1.5 * 15,
                    )
                  ],
                ),
                child: InkWell(
                  onTap: () {
                    setState(() {
                      print(loginProvider.email);
                      isEligible(loginProvider.email);
                      addTap();
                      lockFunc();
                    });
                  },
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
            ),
            Expanded(child: SizedBox()),
            Container(
              margin: EdgeInsets.only(bottom: 30, left: 10, right: 10),
              child: InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => UserManagement()),
                  );
                },
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
                                "$users Users",
                                style: TextStyle(
                                    color: Colors.black54,
                                    fontStyle: FontStyle.italic),
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      );
  }
}
