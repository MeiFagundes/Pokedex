import 'package:flutter/material.dart';
import 'package:pokedex/models/pokemon_model.dart';

class PokemonSprite extends StatelessWidget {
  final PokemonModel pokemon;

  const PokemonSprite(this.pokemon, {Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Image.network(
      pokemon.sprites.frontDefault,
      scale: 0.5,
      filterQuality: FilterQuality.none,
    );
  }
}
