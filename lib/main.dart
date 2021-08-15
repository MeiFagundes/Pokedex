import 'package:flutter/material.dart';
import 'package:pokedex/views/home/home_view.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Pokedex',
      theme: ThemeData(
        fontFamily: 'OpenSans',
        primarySwatch: Colors.red,
        visualDensity: VisualDensity.adaptivePlatformDensity,
        buttonColor: Colors.pinkAccent,
        iconTheme: IconThemeData(color: Colors.red, size: 25),
      ),
      home: HomeView(),
    );
  }
}
