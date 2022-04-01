import 'dart:ui';

import 'package:ore_app/data/Account.dart';

class Lock {

  String doorId;
  bool isOpen;
  String? primaryOwner;
  List<String>? people;

  Lock(this.doorId, {required this.isOpen, this.primaryOwner,  this.people}); 

  factory Lock.fromJson(Map<String, dynamic> json) => _keyFromJson(json);

  Map<String, dynamic> toJson() => _keyToJson(this);

  @override 
  String toString() => 'Key<$doorId>';
}

Lock _keyFromJson(Map<String, dynamic> json) {
  return Lock(
    json['doorId'] as String,
    isOpen: json['isOpen'] as bool,
    primaryOwner: json['primaryOwner'] as String,
    people: json['people'] as List<String>,
  );
}



Map<String, dynamic> _keyToJson(Lock instance) => <String, dynamic>{
  'doorId': instance.doorId,
  'isOpen': instance.isOpen,
  'primaryOwner': instance.primaryOwner,
  'people': _accountList(instance.people),
};

List<String>? _accountList(List<String>? people) {
  if (people == null) {
    return null;
  }
  
  final accMap = <String>[];
  people.forEach((person) {
    accMap.add(person);
  });

  return accMap;
}