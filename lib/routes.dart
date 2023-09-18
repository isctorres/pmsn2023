import 'package:flutter/widgets.dart';
import 'package:pmsn20232/screens/add_task.dart';
import 'package:pmsn20232/screens/dashboard_screen.dart';
import 'package:pmsn20232/screens/task_screen.dart';

Map<String,WidgetBuilder> getRoutes(){
  return {
    '/dash' : (BuildContext context) => DashboardScreen(),
    '/task' : (BuildContext context) => TaskScreen(),
    '/add' : (BuildContext context) => AddTask()
  };
}