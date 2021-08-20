import 'package:flutter/material.dart';
import 'package:pokedex/views/pokemon_list/pokemon_list_view.dart';
import 'package:pokedex/views/shared/appbars.dart';

class HomeView extends StatelessWidget {
  const HomeView({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBars.defaultAppbar,
      body: PokemonListView(),
    );
  }
}
