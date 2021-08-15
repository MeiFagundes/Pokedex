import 'package:flutter/material.dart';
import 'package:pokedex/models/pokemon_model.dart';
import 'package:pokedex/views/shared/text_styles.dart';

class PokemonCard extends StatelessWidget {
  final PokemonModel pokemon;
  const PokemonCard(this.pokemon, {Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        child: Row(
          children: [
            Column(
              children: [
                Text(pokemon.name[0].toUpperCase() + pokemon.name.substring(1),
                    style: TextStyles.pokemonName),
                Image.network(pokemon.sprites.frontDefault),
              ],
            )
          ],
        ),
      ),
    );
  }
}
