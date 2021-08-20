import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pokedex/controllers/pokemon_info_controller.dart';
import 'package:pokedex/models/pokemon_model.dart';
import 'package:pokedex/views/shared/appbars.dart';
import 'package:pokedex/views/shared/custom_circular_progress_indicator.dart';

class PokemonInfoView extends StatelessWidget {
  PokemonInfoView({Key key}) : super(key: key);

  final _controller = Get.find<PokemonInfoController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBars.defaultAppbar,
      body: FutureBuilder<PokemonModel>(
        future: _controller.loadPokemonFromParameters(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            return Center(child: Text(snapshot.data.name));
          } else
            return CustomCircularProgressIndicator();
        },
      ),
    );
  }
}
