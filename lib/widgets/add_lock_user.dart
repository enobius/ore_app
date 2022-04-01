
import 'package:flutter/material.dart';
import 'package:ore_app/data/account.dart';
import 'package:ore_app/data/data_repository.dart';

class AddUser extends SearchDelegate<Account> {
  final DataRepository rep = DataRepository();
  
  @override
  String get searchFieldLabel => 'Email';

  Future<void> updatePeople(String email) async {
      var id = await rep.getUserId(email);
      List<String> accountId = [id];
      rep.addPeople("1", accountId);
  }

  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
        onPressed: () {
          updatePeople(query);
        }, 
        icon: Icon(Icons.add)
      ),
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
      onPressed: () {
        Navigator.pop(context);
      },
      icon: Icon(Icons.arrow_back),
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    return Container();
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return Container();
  }

}