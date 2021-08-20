import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:pokedex/route_generator.dart';
import 'package:pokedex/service_locator.dart';
import 'package:pokedex/views/home_view.dart';

void main() {
  setupLocator();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Pokedex',
      initialRoute: '/',
      getPages: RouteGenerator.routes,
      defaultTransition: Transition.native,
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
