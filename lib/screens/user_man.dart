// ignore_for_file: prefer_const_constructors
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:ore_app/data/account.dart';
import 'package:ore_app/data/data_repository.dart';
import 'package:ore_app/widgets/add_lock_user.dart';
import 'package:ore_app/widgets/user_list_item.dart';

class UserManagement extends StatefulWidget {
  const UserManagement({ Key? key }) : super(key: key);

  @override
  State<UserManagement> createState() => _UserManagementState();
}

class _UserManagementState extends State<UserManagement> {
  final key = GlobalKey<AnimatedListState>();
  Color main = const Color.fromARGB(255, 120, 162, 204);
  Color background = const Color.fromARGB(255, 250, 250, 250);
  String title = "Users";
  final DataRepository rep = DataRepository();
  final CollectionReference collection = FirebaseFirestore.instance.collection('accounts');
  List<String> theUsers = [];
  
  @override
  void initState() {
    getUsers();
  }
  void getUsers() async {
    var  users = await rep.getLockUsers();
      
    for (var item in users) {
      setState(() {
        theUsers.add(item);
      });
    }
  }
  @override
  Widget build(BuildContext context) {


    return Scaffold(
       appBar: AppBar(
        backgroundColor: background,
        centerTitle: true,
        elevation: 0,

        leading: IconButton(
          onPressed: () {
            Navigator.pop( context);
          }, 
          icon: Icon(
            Icons.arrow_back_outlined,
            color: main,
          )
        ),

        title: Text(
          title,
          style: TextStyle(
            color: main,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),

      floatingActionButton: FloatingActionButton(
        backgroundColor: main,
        onPressed: () {
          showSearch(context: context, delegate: AddUser());
        },

        child: Icon(
          Icons.add,
          color: Colors.white,
          size: 30.0,
        ),
      ),

      body: ListView(
        children: [
           Container(
            margin: EdgeInsets.only(top: 50, left: 10, right: 10),
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
                            "John Doe",

                            style: TextStyle(
                              color: Colors.black54,
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),

                          Text(
                            "Owner",

                            style: TextStyle(
                              color: Colors.black54,
                              fontStyle: FontStyle.italic
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),

          Column(
            children: [
              for (var id in theUsers) StreamBuilder<QuerySnapshot>(
                stream: FirebaseFirestore.instance.collection('accounts').where("id", isEqualTo: id).snapshots(),
                builder: (context,  snapshot) {
                  if(!snapshot.hasData) {
                    return Center(
                      child: CircularProgressIndicator(),
                    );
                  }

                  return _buildList(snapshot.data?.docs);
                },
              )
            ],
          )
        ],
      ),
    );
  }
  Widget _buildList(List<DocumentSnapshot>? snapshot) {
    return SizedBox(
      height: 110,
      child: ListView(
        padding: const EdgeInsets.only(top: 20.0),
        // 2
        children: snapshot!.map((data) {
          
          return _buildListItem(data);
        }).toList(),
      ),
    );
  }

  Widget _buildListItem(DocumentSnapshot snapshot) {
  // 4
    final account = Account.fromSnapshot(snapshot);

    return UserListItem(account: account);
  }
}