import 'package:flutter/material.dart';
import 'package:time_app/pages/home.dart';
import 'package:time_app/pages/loading.dart';
import 'package:time_app/pages/choose_location.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        '/': (context)=> Loading(),
        '/home': (context)=>Home(),
        '/location':(context)=>Choose_Location()
      },
    );
  }
}
