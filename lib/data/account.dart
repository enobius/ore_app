// ignore_for_file: file_names

import 'dart:convert';
import 'package:cloud_firestore/cloud_firestore.dart';

import 'key.dart';

class Account {
  
  String name;
  String email;
  
  List<dynamic>? primaryKeys = [];
  List<dynamic>? secondaryKeys = [];

  String? id;

  Account(this.name, {required this.email, this.id, primaryKeys, secondaryKeys});

  factory Account.fromSnapshot(DocumentSnapshot snapshot) {
    final newAccount = Account.fromJson(snapshot.data() as Map<String, dynamic>);
    newAccount.id = snapshot.reference.id; 
    return newAccount;
  }

  factory Account.fromJson(Map<String, dynamic> json) => _accountFromJson(json);

  Map<String, dynamic> toJson() => _accountToJson(this);
}

Account _accountFromJson(Map<String, dynamic> json) {
  return Account(
    json['name'] as String,
    email: json['email'] as String,
    id: json['id'] as String,
    primaryKeys: json['primaryKeys'] as List<dynamic>,
    secondaryKeys: json['secondaryKeys'] as List<dynamic>
    );
}


Map<String, dynamic> _accountToJson(Account instance) => <String, dynamic> {
  'name': instance.name,
  'email': instance.email,
  'id': instance.id,
  'primaryKeys': instance.primaryKeys,
  'secondaryKeys': instance.secondaryKeys,
};

List<String>? _keyList(List<String>? keys) {
  if (keys == null) {
    return null;
  }

  final keyMap = <String>[];
  keys.forEach((key) {
    keyMap.add(key);
  });

  return keyMap;
}