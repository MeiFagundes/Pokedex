import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:pokedex/models/pokemon_model.dart';
import 'package:pokedex/views/shared/pokemon/pokemon_shared.dart';
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
      child: InkWell(
        borderRadius: BorderRadius.circular(15),
        onTap: () {
          Get.toNamed("/pokemon?pokemon=${pokemon.name}");
        },
        child: LayoutBuilder(
          builder: (BuildContext context, BoxConstraints constraints) {
            if (constraints.maxWidth > 350)
              return _wideLayout;
            else
              return _narrowLayout;
          },
        ),
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
                child: PokemonName(pokemon),
              ),
              Row(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  PokemonSprite(pokemon),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      PokemonTypes(pokemon, direction: Axis.vertical),
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
                child: PokemonName(pokemon),
              ),
              Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  PokemonSprite(pokemon),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      PokemonTypes(pokemon, direction: Axis.horizontal),
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
