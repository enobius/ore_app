import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:ore_app/data/Account.dart';
import 'package:ore_app/data/data_repository.dart';
import 'package:ore_app/data/key.dart';


class FakeHome extends StatelessWidget {



  @override
  Widget build(BuildContext context) {
    Account person = Account("Emmanuel Hudson", email: "ehudson@email.com", primaryKeys: []);
    Account person2 = Account("Ben Dover", email: "bdover@email.com", primaryKeys: []);
    Account person3 = Account("Jane Doe", email: "jdoe@email.com");
    final Lock key = Lock("1", isOpen: false);
    final DataRepository rep = DataRepository();
    final CollectionReference ref = FirebaseFirestore.instance.collection("accounts");

    Future<void> addAcc() async {
      rep.addAccount(person3);
      rep.getUserId(person3.email).then((value) {
        rep.addId(value);
      });
    }

    void delete() async {
      rep.deleteUserKey("jdoe@email.com");
    }

    Future<void> addKey() {
      return rep.addLock(key, "1");
    }

    Future<String> getId() async {
      var id = await rep.getUserId("ehudson@email.com");
      return id;
    }

    void getNum() async {
      int num = await rep.getNumUsers();
      print(num);
    }

    Future<void> updatePUser() async {
      var id = await rep.getUserId("ehudson@email.com");
      rep.updatePUser("1", id);
      List<String> lockIds = ["1"];
      rep.makePUser(id, lockIds);
    }

    Future<void> updatePeople() async {
      var id = await rep.getUserId("bdover@email.com");
      List<String> accountId = [id];
      rep.addPeople("1", accountId);
    }

    getUsers() {
      return rep.getLockUsers();
    }


    return Center(
      child: FlatButton(
        onPressed: delete,
        child: Text(
          "Add Account",
        ),
      ),
    );
  }
}