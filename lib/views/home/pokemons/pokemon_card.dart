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
      child: LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
          if (constraints.maxWidth > 350)
            return _wideLayout;
          else
            return _narrowLayout;
        },
      ),
    );
  }

  Widget get _wideLayout => Padding(
        padding:
            const EdgeInsets.only(top: 16, bottom: 10, left: 20, right: 20),
        child: Container(
          width: 310,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(bottom: 10),
                child: _pokemonName,
              ),
              Row(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Column(
                    children: [_pokemonSprite],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Wrap(
                        direction: Axis.vertical,
                        spacing: 5,
                        children: [..._types],
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 10),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [..._aditionalInfo],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      );

  Widget get _narrowLayout => Padding(
        padding:
            const EdgeInsets.only(top: 16, bottom: 20, left: 20, right: 20),
        child: Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(bottom: 10),
                child: _pokemonName,
              ),
              Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _pokemonSprite,
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Wrap(
                        direction: Axis.horizontal,
                        spacing: 5,
                        children: [..._types],
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 10),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [..._aditionalInfo],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      );

  Text get _pokemonName => Text.rich(
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

  Widget get _pokemonSprite => Image.network(
        pokemon.sprites.frontDefault,
        scale: 0.5,
        filterQuality: FilterQuality.none,
      );

  List<Widget> get _types {
    final types = <Widget>[];
    for (final type in pokemon.types)
      types.add(Image.asset(
        'assets/images/types/${type.type.name}.png',
        scale: 8,
        filterQuality: FilterQuality.medium,
      ));
    return types;
  }

  List<Widget> get _aditionalInfo {
    final aditionalInfo = <Widget>[];
    aditionalInfo.add(Text.rich(
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
    ));
    aditionalInfo.add(Text.rich(
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
    ));
    return aditionalInfo;
  }
}
