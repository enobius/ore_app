import 'package:flutter/material.dart';
import 'package:ore_app/data/account.dart';
import 'package:ore_app/data/data_repository.dart';

class LoginProvider extends ChangeNotifier {

  final DataRepository rep = DataRepository();
  String _email = "No Email";
  bool isLoggedIn = false;
  String errorMesage = "No error";

  login(String email, String password) async {
    String response = await rep.login(email);
    if (response == "succesful") {
      _email = email;
      isLoggedIn = true;
    } else {
      errorMesage = "email not found";
    }
    notifyListeners();
  }

  String get email => _email;
}