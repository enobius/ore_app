// ignore_for_file: prefer_const_constructors

import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:ore_app/data/account.dart';

class UserListItem extends StatelessWidget {
  final Account account;
  //final VoidCallback onClicked;

  const UserListItem({
    required this.account,
    //required this.onClicked,
  });

  @override
  Widget build(BuildContext context) {
    Color main = const Color.fromARGB(255, 120, 162, 204);
    
    return Container(
      margin: EdgeInsets.only( left: 10, right: 10),
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
                  // ignore: prefer_const_literals_to_create_immutables
                  children: [
                    Text(
                      account.name,
                      style: TextStyle(
                        color: Colors.black54,
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      "Has Access",
                      style: TextStyle(
                          color: Colors.black54, fontStyle: FontStyle.italic),
                    ),
                  ],
                ),
              ),
              Expanded(child: SizedBox()),
              Padding(
                padding: const EdgeInsets.only(right: 10.0),
                child: InkWell(
                  onTap: () => null, //onClicked,
                  child: Icon(
                    Icons.delete_forever,
                    color: main,
                    size: 30,
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
