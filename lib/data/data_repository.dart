import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/rendering.dart';
import 'package:ore_app/data/key.dart';

import 'Account.dart';

class DataRepository {
  final CollectionReference collection = FirebaseFirestore.instance.collection('accounts');
  final CollectionReference lCollection = FirebaseFirestore.instance.collection('locks');
  
  Stream<QuerySnapshot> getStream() {
    return collection.snapshots();
  }

  Future<DocumentReference> addAccount(Account account) {
    return collection.add(account.toJson());
  }

  Future<void> addId(String id) {
    return collection.doc(id)
    .update({'id': id});
  }

  Future<String> login(String email) async {
    String response = "";
    await collection
    .where("email", isEqualTo: email)
    .get()
    .then((value) {
      for (var element in value.docs) {
        response = "succesful";
      }
    })
    .catchError((error) {
      response = "Wrong Credentials";
    });
    return response;
  }

  Future<void> addLock(Lock key, String id) {
    return lCollection.doc(id).set(key.toJson());
  }

  lock() async {
    await lCollection.doc('1')
    .update({'lockRequest': 1});
  }

  Future<void> unlock() async {
    return lCollection.doc('1')
    .update({'lockRequest': 2});
  }



  Future<void> getAccount(String id) async {
    await lCollection.doc(id)
    .get()
    .then((value) {
      Account account = Account(value['name'], email: value['email']);
      return account;
    });
  }

  Future<String> getUserId(String email) async {
    String id = "none";
    await collection
    .where("email", isEqualTo: email)
    .get()
    .then((value) {
      for (var element in value.docs) {
        id = element.id;
      }
    })
    .catchError((error) {
      id = "Failed to get id";
    });
    return id;
  }

  Future<int> getNumUsers() async {
    int count = 0;

    await collection.get()
    .then((value) {
      for (var element in value.docs) {
        count++;
      }
    });
    
    return count;
  }

  Future<List> getLockUsers() async {
    List users = [];
    await lCollection.doc("1")
    .get()
    .then((value) {
      //print(value['people']);
      for(var element in value['people']) {
        users.add(element);
      }
    });
    return users;
  }

  Future<void> deleteUserKey(String email) async {
    String id = await getUserId(email);
    print(id);
    lCollection.doc("1")
    .update({"people": FieldValue.arrayRemove([id])});
  }
  
  Future<int> lockUsers() async {
    List users = await getLockUsers();
    int numUsers = users.length;
    return numUsers;
  }


  Future<void> makePUser(String id, List<String> lockId) async {
    return collection
    .doc(id)
    .update({'primaryKeys': FieldValue.arrayUnion(lockId)});
  }

  Future<void> addPeople(String id, List<String> accountId) async {
    return lCollection
    .doc(id)
    .update({'people': FieldValue.arrayUnion(accountId)});
  }

  Future<void> updatePUser(String id, String pId) {
    return lCollection
    .doc(id)
    .update({'primaryOwner': pId})
    .then((value) => print("Updated!"))
    .catchError((error) => print("Failed to update: $error"));
  }

  void deleteAcc(Account account) async {
    await collection.doc(account.id).delete();
  }
}