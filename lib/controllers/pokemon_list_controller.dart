import 'package:get/state_manager.dart';
import 'package:pokedex/models/pokemon_model.dart';
import 'package:pokedex/repositories/pokemon_repository.dart';

class PokemonListController extends GetxController {
  static const kLimit = 20;

  final PokemonRepository _repository;

  PokemonListController(this._repository);

  var _pokemonList = <PokemonModel>[].obs;

  var loading = false.obs;

  Future<List<PokemonModel>> get pokemonList async =>
      _pokemonList.isNotEmpty ? _pokemonList : loadPokemonList();

  Future<List<PokemonModel>> loadPokemonList() async {
    loading.value = true;
    final loadedPokemon = await _repository.getPokemonList(
        _pokemonList.isNotEmpty ? _pokemonList.length : 0, kLimit)
        .whenComplete(() => loading.value = false);

    _pokemonList.addAll(loadedPokemon);
    return _pokemonList;
  }
}
