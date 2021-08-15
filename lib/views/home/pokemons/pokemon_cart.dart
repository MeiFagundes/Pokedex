import 'package:flutter/material.dart';
import 'package:pokedex/models/pokemon_model.dart';
import 'package:pokedex/views/shared/text_styles.dart';

class PokemonCard extends StatelessWidget {
  final PokemonModel pokemon;
  const PokemonCard(this.pokemon, {Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 3,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      child: Padding(
        padding:
            const EdgeInsets.only(top: 20, bottom: 10, left: 30, right: 30),
        child: Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(bottom: 10),
                child: Text.rich(
                  TextSpan(
                    text:
                        "${pokemon.name[0].toUpperCase()}${pokemon.name.substring(1)} ",
                    children: <TextSpan>[
                      TextSpan(
                        text: "#${pokemon.id}",
                        style: TextStyles.pokemonId,
                      ),
                    ],
                    style: TextStyles.pokemonName,
                  ),
                ),
              ),
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Column(
                    children: [
                      Image.network(
                        pokemon.sprites.frontDefault,
                        scale: 0.5,
                        filterQuality: FilterQuality.none,
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      Image.asset(
                        'assets/images/types/${pokemon.types.first.type.name}.png',
                        scale: 8,
                        filterQuality: FilterQuality.medium,
                      ),
                      if (pokemon.types.length > 1)
                        Padding(
                          padding: const EdgeInsets.only(top: 5),
                          child: Image.asset(
                            'assets/images/types/${pokemon.types[1].type.name}.png',
                            scale: 8,
                            filterQuality: FilterQuality.medium,
                          ),
                        ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
