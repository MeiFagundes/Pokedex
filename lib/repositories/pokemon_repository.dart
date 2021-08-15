import 'dart:convert';

import 'package:http/http.dart';
import 'package:pokedex/models/pokemon_list_model.dart';
import 'package:pokedex/models/pokemon_model.dart';

class PokemonRepository {
  // final _httpClient = Client();

  final String _apiPokemon;

  PokemonRepository(this._apiPokemon);

  Future<List<PokemonModel>> getPokemonList(int offset,
      [int limit = 20]) async {
    final httpClient = Client();

    try {
      final url =
          '$_apiPokemon?limit=$limit&offset=$offset';
      final resposta = await httpClient.get(Uri.parse(url));

      final respostaJson =
          resposta.body.isNotEmpty ? jsonDecode(resposta.body) : null;

      final pokemonList = PokemonListModel.fromJson(respostaJson);
      final pokemons = <PokemonModel>[];

      for (var pokemon in pokemonList.results)
        pokemons.add(await getPokemonDetailed(pokemon.name));

      return pokemons;
    } catch (e) {
      print("error");
      return null;
    } finally {
      httpClient.close();
    }
  }

   Future<PokemonModel> getPokemonDetailed(String pokemonId) async {
    final httpClient = Client();

    try {
      final url = '$_apiPokemon/$pokemonId';
      final resposta = await httpClient.get(Uri.parse(url));

      final respostaJson =
          resposta.body.isNotEmpty ? jsonDecode(resposta.body) : null;

      return PokemonModel.fromJson(respostaJson);
    } catch (e) {
      print("error");
      return null;
    } finally {
      httpClient.close();
    }
  }
}
