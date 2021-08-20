import 'package:flutter/material.dart';
import 'package:pokedex/service_locator.dart';
import 'package:pokedex/views/pokemon_list/pokemon_list_view.dart';

void main() {
  setupLocator();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
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
      home: PokemonListView(),
    );
  }
}
