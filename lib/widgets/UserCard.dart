import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:prueba_antpack/models/User.dart';
import 'package:prueba_antpack/screens/UserDetails.dart';

class UserCard extends StatelessWidget {
  final User user;
  UserCard(this.user);
  @override
  Widget build(BuildContext context) {
    String city = user.address.city;
    String company = user.company.name;

    return InkWell(
        onTap: () {
          Navigator.of(context).push(MaterialPageRoute(
              builder: (BuildContext context) => UserDetails(user)));
        },
        child: Card(
            margin: EdgeInsets.symmetric(horizontal: 12.0, vertical: 12.0),
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 10.0),
              child: Row(
                children: [
                  Container(
                      constraints:
                          BoxConstraints(minWidth: 180.0, maxWidth: 180.0),
                      child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              user.name,
                              style: TextStyle(
                                  fontSize: 18.0, fontWeight: FontWeight.bold),
                            ),
                            Text(
                              user.email,
                              style: TextStyle(color: Colors.grey.shade600),
                            )
                          ])),
                  Container(
                      constraints:
                          BoxConstraints(maxWidth: 135.0, minWidth: 135.0),
                      child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'City:',
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold),
                                  ),
                                  Text(city, style: TextStyle(fontSize: 14))
                                ]),
                            Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Company:',
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold),
                                  ),
                                  Text(
                                    company,
                                    style: TextStyle(fontSize: 14),
                                  )
                                ])
                          ]))
                ],
              ),
            )));
  }
}
