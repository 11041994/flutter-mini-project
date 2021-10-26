
import 'package:flutter/material.dart';
import 'package:flutter_app1/constants/app-constant.dart';
import 'package:flutter_app1/widgets/leftbar.dart';
import 'package:flutter_app1/widgets/rightbar.dart';
import 'package:flutter_app1/screens/homescreen.dart';

void main(){
  runApp(MyApp());
}

class MyApp extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return _MyAppState();
  }
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "BMI Calculator",
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.yellow,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: HomeScreen(),
    );
  }

}