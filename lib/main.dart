import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:pmsn20232/assets/global_values.dart';
import 'package:pmsn20232/assets/styles_app.dart';
import 'package:pmsn20232/provider/test_provider.dart';
import 'package:pmsn20232/routes.dart';
import 'package:pmsn20232/screens/login_screen.dart';
import 'package:pmsn20232/screens/maps_screen.dart';
import 'package:pmsn20232/screens/popular_firebase_screen.dart';
import 'package:pmsn20232/screens/popular_screen.dart';
import 'package:provider/provider.dart';

Future<void> main() async { 

  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return  ValueListenableBuilder(
      valueListenable: GlobalValues.flagTheme,
      builder: (context, value, _) {
        return ChangeNotifierProvider(
          create: (context) => TestProvider(),
          child: MaterialApp(
            home: const PopularFirebasScreen(),
            routes: getRoutes(),
            theme: value ? StylesApp.darkTheme(context) : StylesApp.lightTheme(context)
            /*routes: {
              '/dash' : (BuildContext context) => LoginScreen()
            },*/
          ),
        );
      }
    );
  }
}