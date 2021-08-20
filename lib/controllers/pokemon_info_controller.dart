import 'package:get/get.dart';
import 'package:pokedex/models/pokemon_model.dart';
import 'package:pokedex/repositories/pokemon_repository.dart';

class PokemonInfoController extends GetxController {
  final PokemonRepository repository;

  PokemonInfoController(this.repository);

  Future<PokemonModel> loadPokemonFromParameters() async {
    final pokemonNameOrId = Get.parameters['pokemon'];

    final loadedPokemon = await repository.getPokemonDetailed(pokemonNameOrId);
    return loadedPokemon;
  }
}
