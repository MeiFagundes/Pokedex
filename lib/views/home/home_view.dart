import 'package:flutter/material.dart';
import 'package:pokedex/models/pokemon_model.dart';
import 'package:pokedex/repositories/pokemon_repository.dart';
import 'package:pokedex/utils/url_util.dart';
import 'package:pokedex/views/home/pokemons/pokemon_cart.dart';
import 'package:pokedex/views/shared/custom_icons_icons.dart';
import 'package:pokedex/views/shared/text_styles.dart';

class HomeView extends StatelessWidget {
  const HomeView({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            Padding(
              padding: const EdgeInsets.only(right: 5),
              child: Icon(CustomIcons.pokeball),
            ),
            Text(
              'Pokedex',
              style: TextStyles.title,
            ),
          ],
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.home),
            tooltip: 'meifagundes.com',
            onPressed: () {
              UrlUtil.openURI(UrlUtil.urlHome);
              ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('This is a snackbar')));
            },
          ),
        ],
      ),
      body: FutureBuilder<List<PokemonModel>>(
          future: PokemonRepository.getPokemonList(0, 20),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.done &&
                snapshot.hasData) {
              return SingleChildScrollView(
                child: Center(
                  child: Padding(
                    padding: const EdgeInsets.all(30),
                    child: Wrap(
                      spacing: 20,
                      runSpacing: 20,
                      direction: Axis.horizontal,
                      children: [
                        for (final pokemon in snapshot.data)
                          PokemonCard(pokemon)
                      ],
                    ),
                  ),
                ),
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
