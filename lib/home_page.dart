import 'package:clean_login/providers/users.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  static const routeName = '/home-page';
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<UsersProvider>(context).user;
    final alucard = Hero(
      tag: 'hero',
      child: Padding(
        padding: EdgeInsets.all(16.0),
        child: user.isEmpty
            ? Container(
                width: 100,
                height: 100,
                color: Colors.white,
              )
            : Image.network("https://${user[0].profileImageLink}"),
      ),
    );

    final welcome = Padding(
      padding: EdgeInsets.all(8.0),
      child: Text(
        'Welcome !',
        style: TextStyle(fontSize: 28.0, color: Colors.white),
      ),
    );

    final details = Padding(
      padding: EdgeInsets.all(8.0),
      child: user.isEmpty
          ? Text('nonoooo',
              style: TextStyle(fontSize: 20.0, color: Colors.black))
          : Text(
              'Name: ${user[0].name}\nEmail: ${user[0].email}\nAge: ${user[0].age}',
              style: TextStyle(fontSize: 20.0, color: Colors.white),
              softWrap: true,
              textAlign: TextAlign.left,
            ),
    );

    final body = Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      padding: EdgeInsets.all(28.0),
      decoration: BoxDecoration(
        gradient: LinearGradient(colors: [
          Colors.orange[900],
          Colors.orange[800],
          Colors.orange[400],
        ]),
      ),
      child: Column(
        children: [alucard, SizedBox(height: 30), Expanded(child: Column(children: [welcome, details],))],
      ),
    );
    return Scaffold(
      body: user.isEmpty
          ? Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              padding: EdgeInsets.all(28.0),
              decoration: BoxDecoration(
                gradient: LinearGradient(colors: [
                  Colors.orange[900],
                  Colors.orange[800],
                  Colors.orange[600],
                ]),
              ),
            )
          : SingleChildScrollView(child: body),
    );
  }
}
