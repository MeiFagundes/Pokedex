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
            const EdgeInsets.only(top: 18, bottom: 10, left: 20, right: 20),
        child: Container(
          width: 310,
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
                crossAxisAlignment: CrossAxisAlignment.start,
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
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Wrap(
                        direction: Axis.vertical,
                        spacing: 5,
                        children: [
                          for (final type in pokemon.types)
                            Image.asset(
                              'assets/images/types/${type.type.name}.png',
                              scale: 8,
                              filterQuality: FilterQuality.medium,
                            ),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 10),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text.rich(
                              TextSpan(
                                text: "Height: ",
                                children: <TextSpan>[
                                  TextSpan(
                                    text: "${pokemon.height / 10} m",
                                    style: TextStyles.pokemonInfoValue,
                                  ),
                                ],
                                style: TextStyles.pokemonInfoTitle,
                              ),
                            ),
                            Text.rich(
                              TextSpan(
                                text: "Weight: ",
                                children: <TextSpan>[
                                  TextSpan(
                                    text: "${pokemon.weight / 10} kg",
                                    style: TextStyles.pokemonInfoValue,
                                  ),
                                ],
                                style: TextStyles.pokemonInfoTitle,
                              ),
                            ),
                          ],
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
