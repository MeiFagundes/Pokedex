import 'package:flutter/material.dart';
import 'package:pokedex/models/pokemon_model.dart';
import 'package:pokedex/views/shared/text_styles.dart';

class PokemonName extends StatelessWidget {
  final PokemonModel pokemon;

  const PokemonName(this.pokemon, {Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text.rich(
      TextSpan(
        text: "${pokemon.name[0].toUpperCase()}${pokemon.name.substring(1)} ",
        children: <TextSpan>[
          TextSpan(
            text: "#${pokemon.id}",
            style: TextStyles.pokemonId,
          ),
        ],
        style: TextStyles.pokemonName,
      ),
    );
  }
}
