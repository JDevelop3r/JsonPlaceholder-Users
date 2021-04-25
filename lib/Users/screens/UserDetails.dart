import 'package:flutter/material.dart';
import 'package:prueba_antpack/Users/models/User.dart';

class UserDetails extends StatefulWidget {
  final User user;
  UserDetails(this.user);
  @override
  _UserDetailsState createState() => _UserDetailsState();
}

class _UserDetailsState extends State<UserDetails> {
  final urlPhoto = 'https://randomuser.me/api/portraits/';

  @override
  Widget build(BuildContext context) {
    final photoGender = widget.user.id % 2 == 0 ? 'men' : 'women';
    final int id = widget.user.id;
    final userName = widget.user.userName;
    final email = widget.user.email;
    final phone = widget.user.phone;
    final company = widget.user.company.name;
    final catchPhrase = widget.user.company.catchPhrase;

    final userPhoto = Container(
      margin: EdgeInsets.only(right: 12.0),
      child: CircleAvatar(
        minRadius: 56.0,
        foregroundImage: NetworkImage('$urlPhoto/$photoGender/$id.jpg'),
      ),
    );

    final userInfo = Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          widget.user.name,
          style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
        ),
        Text(
          'Username: $userName',
          style: TextStyle(color: Colors.grey.shade600),
        ),
        Text(
          widget.user.website,
          style: TextStyle(color: Colors.blue),
        ),
      ],
    );

    final userInfoRow = Row(
      children: [userPhoto, userInfo],
    );

    final contactUserInfo = Container(
        margin: EdgeInsets.symmetric(vertical: 12.0, horizontal: 8.0),
        height: 60.0,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Contact',
              style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
            ),
            Text(
              'Email: $email',
              style: TextStyle(color: Colors.grey.shade600),
            ),
            Text(
              'Phone: $phone',
              style: TextStyle(color: Colors.grey.shade600),
            )
          ],
        ));

    final companyUserInfo = Container(
        margin: EdgeInsets.only(left: 8.0, right: 8.0, bottom: 12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Company',
              style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
            ),
            Text(
              'Name: $company',
              style: TextStyle(color: Colors.grey.shade600),
            ),
            Text(
              'Phrase: $catchPhrase',
              style: TextStyle(color: Colors.grey.shade600),
            ),
            Text(
              'Bs: ' + widget.user.company.bs,
              style: TextStyle(color: Colors.grey.shade600),
            )
          ],
        ));

    final addressUserInfo = Container(
        margin: EdgeInsets.only(left: 8.0, right: 8.0, bottom: 12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Address',
              style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Suite: ' + widget.user.address.suite,
                      style: TextStyle(color: Colors.grey.shade600),
                    ),
                    Text(
                      'City: ' + widget.user.address.city,
                      style: TextStyle(color: Colors.grey.shade600),
                    ),
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Street: ' + widget.user.address.street,
                      style: TextStyle(color: Colors.grey.shade600),
                    ),
                    Text(
                      'Zipcode: ' + widget.user.address.zipcode,
                      style: TextStyle(color: Colors.grey.shade600),
                    ),
                  ],
                )
              ],
            )
          ],
        ));

    return Scaffold(
      appBar: AppBar(
        title: Text(userName),
        centerTitle: true,
      ),
      body: Container(
        padding: EdgeInsets.symmetric(vertical: 15.0, horizontal: 20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            userInfoRow,
            contactUserInfo,
            companyUserInfo,
            addressUserInfo,
          ],
        ),
      ),
    );
  }
}
