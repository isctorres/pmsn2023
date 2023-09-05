import 'package:flutter/material.dart';
import 'package:pmsn20232/assets/styles_app.dart';
import 'package:pmsn20232/routes.dart';
import 'package:pmsn20232/screens/login_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      home: const LoginScreen(),
      routes: getRoutes(),
      theme: StylesApp.darkTheme(context)
      /*routes: {
        '/dash' : (BuildContext context) => LoginScreen()
      },*/
    );
  }
}