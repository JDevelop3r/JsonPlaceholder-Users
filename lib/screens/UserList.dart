import 'package:flutter/material.dart';
import 'package:prueba_antpack/models/User.dart';
import 'package:prueba_antpack/services/UserService.dart';
import 'package:prueba_antpack/widgets/UserCard.dart';

class UserList extends StatefulWidget {
  UserList({Key key, this.title}) : super(key: key);
  final String title;
  @override
  _UserListState createState() => _UserListState();
}

class _UserListState extends State<UserList> {
  UserService _userService = UserService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text(widget.title),
          centerTitle: true,
          bottom: PreferredSize(
              preferredSize: Size.fromHeight(16.0),
              child: Container(
                color: Colors.white,
                child: Center(
                  child: Text('Click on an user card for details'),
                ),
              ))),
      body: StreamBuilder<List<User>>(
        stream: _userService.fetchData(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: Container(
                width: 250.0,
                height: 250.0,
                child: CircularProgressIndicator(),
              ),
            );
          }
          if (snapshot.connectionState == ConnectionState.done &&
              snapshot.hasData) {
            return ListView(
              children: <Widget>[
                for (User user in snapshot.data) UserCard(user)
              ],
            );
          }
          return Center(child: Text('No users'));
        },
      ),
    );
  }
}
