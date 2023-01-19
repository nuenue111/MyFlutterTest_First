import 'package:flutter/material.dart';
import 'package:mycupid_love/provider/been_together_provider.dart';
import 'package:mycupid_love/splash_screen.dart';
import 'package:provider/provider.dart';

void main(){
  runApp(MyHome());
}

class MyHome extends StatefulWidget {
  MyHome({Key? key}) : super(key: key);

  @override
  State<MyHome> createState() => _MyHomeState();
}

class _MyHomeState extends State<MyHome> {

 

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: MySplashScreen(),
    );
  }
}