import 'package:database3/utils/database_helper.dart';
import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path_provider/path_provider.dart';

import 'models/user.dart';

List _users;
void main () async {
  var db = new DatabaseHelper();

 // await db.saveUser(new User("zaki", "monkey13"));

// one user
 User zaki = await db.getUser(3);
  print ("got user name : ${zaki.id}");
//delete user
  //int deleted = await db.deleteUser( 3);

  _users = await db.getAllUsers();
 for(int i =0 ; i<_users.length;i++){
   User user = User.map(_users[i]);
 print("user name : ${user.username}");
 }

  runApp(MaterialApp(
  title: "data base ",
  home: Home(),


));}
class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("data base"),
        backgroundColor: Colors.deepOrangeAccent,
      ),
      body: ListView.builder(
        itemCount: _users.length,
        itemBuilder: (BuildContext context ,int position){
          return Card(
            color: Colors.white ,
            elevation: 2.5,
            child: ListTile(
              title: Text("User :${User.fromMap(_users[position]).username}"),
              subtitle:Text("User :${User.fromMap(_users[position]).id}") ,


            ),

          );


        },

      ),
    );
  }
}
