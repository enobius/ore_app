import 'package:flutter/material.dart';
import 'package:ore_app/screens/fake_home.dart';
import 'package:ore_app/screens/home.dart';
import 'package:ore_app/screens/register.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:ore_app/screens/user_man.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  //WidgetsApp //MaterialApp //CupertinoApp
  runApp(MaterialApp(
    home: Home(),
    debugShowCheckedModeBanner: false,

  ));
}
