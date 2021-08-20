import 'package:flutter/material.dart';
import 'package:pokedex/models/pokemon_model.dart';

class PokemonTypes extends StatelessWidget {
  final PokemonModel pokemon;
  final Axis direction;

  const PokemonTypes(this.pokemon, {Key key, @required this.direction})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Flex(
      direction: direction,
      mainAxisSize: MainAxisSize.min,
      children: [
        Image.asset(
          'assets/images/types/${pokemon.types.first.type.name}.png',
          scale: 8,
          filterQuality: FilterQuality.medium,
        ),
        if (pokemon.types.length > 1)
          Padding(
            padding: direction == Axis.horizontal
                ? EdgeInsets.only(left: 5)
                : EdgeInsets.only(top: 5),
            child: Image.asset(
              'assets/images/types/${pokemon.types[1].type.name}.png',
              scale: 8,
              filterQuality: FilterQuality.medium,
            ),
          ),
      ],
    );
  }
}
