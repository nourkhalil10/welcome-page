import 'package:clean_login/home_page.dart';
import 'package:clean_login/providers/users.dart';
import 'package:provider/provider.dart';

import './login_page.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider.value(
          value: UsersProvider(),
        )
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.lightBlue,
          fontFamily: 'Nunito',
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        home: LoginPage(),
        routes: {
          LoginPage.routeName: (ctx) => LoginPage(),
          HomePage.routeName: (ctx) => HomePage(),
        },
      ),
    );
  }
}
