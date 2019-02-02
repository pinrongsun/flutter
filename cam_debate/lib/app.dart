import 'package:flutter/material.dart';
import 'pages/login_page.dart';
import 'blocs/provider.dart';
import 'pages/sign_up_page.dart';
class App extends StatelessWidget {
  @override
  Widget build(context) {
    return Provider(
      child: MaterialApp(
        title: 'Log Me In',
        home: Scaffold(
          body: LoginPage(),
        ),
      ),
    );
  }
}
