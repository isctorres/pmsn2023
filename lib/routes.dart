import 'package:flutter/widgets.dart';
import 'package:pmsn20232/screens/dashboard_screen.dart';

Map<String,WidgetBuilder> getRoutes(){
  return {
    '/dash' : (BuildContext context) => DashboardScreen()
  };
}