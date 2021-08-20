import 'package:get/instance_manager.dart';
import 'package:pokedex/controllers/pokemon_info_controller.dart';
import 'package:pokedex/services.dart';
import 'package:pokedex/controllers/pokemon_list_controller.dart';
import 'package:pokedex/repositories/pokemon_repository.dart';

void setupLocator() {

  // Repositories
  Get.put(PokemonRepository(Services.pokemonApi));

  //Stores
  Get.put(PokemonListController(Get.find<PokemonRepository>()));
  Get.put(PokemonInfoController((Get.find<PokemonRepository>())));
}
