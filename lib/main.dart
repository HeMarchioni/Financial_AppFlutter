import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


import 'home2.dart';





void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Previsão do tempo',
      theme: ThemeData(
        brightness: Brightness.dark,
        primarySwatch: Colors.deepOrange,
        primaryColor: Colors.black,
        canvasColor: const Color(0xff343131),
      ),
      home: const Home2(),
    );
  }
}
