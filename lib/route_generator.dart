import 'package:get/route_manager.dart';
import 'package:pokedex/views/home_view.dart';
import 'package:pokedex/views/pokemon_info/pokemon_info_view.dart';

class RouteGenerator {
  static List<GetPage> get routes {
    return <GetPage>[
      GetPage(name: '/', page: () => HomeView()),
      GetPage(name: '/pokemon', page: () => PokemonInfoView()),
    ];
  }
}
