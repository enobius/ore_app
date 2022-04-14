import 'package:flutter/material.dart';
import 'package:ore_app/data/login_provider.dart';
import 'package:ore_app/screens/fake_home.dart';
import 'package:ore_app/screens/home.dart';
import 'package:ore_app/screens/login.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:ore_app/screens/user_man.dart';
import 'package:provider/provider.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  //WidgetsApp //MaterialApp //CupertinoApp
  runApp(MaterialApp(
    home: MyApp(),
    debugShowCheckedModeBanner: false,
  ));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        /// Makes data available to everything below it in the Widget tree
        /// Basically the entire app.
        ChangeNotifierProvider<LoginProvider>.value(value: LoginProvider()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: LoginPage(),
      ),
    );
  }
}
