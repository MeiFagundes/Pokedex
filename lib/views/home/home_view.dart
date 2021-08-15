import 'package:flutter/material.dart';
import 'package:pokedex/models/pokemon_model.dart';
import 'package:pokedex/repositories/pokemon_repository.dart';
import 'package:pokedex/views/home/pokemons/pokemon_cart.dart';

class HomeView extends StatelessWidget {
  const HomeView({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Pokedex'),
      ),
      body: FutureBuilder<List<PokemonModel>>(
          future: PokemonRepository.getPokemonList(0, 20),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.done &&
                snapshot.hasData) {
              return ListView(
                children: [
                  for (final pokemon in snapshot.data) PokemonCard(pokemon)
                ],
              );
            } else
              return Center(
                child: Container(
                  height: 50,
                  width: 50,
                  child: CircularProgressIndicator(),
                ),
              );
          }),
    );
  }
}
