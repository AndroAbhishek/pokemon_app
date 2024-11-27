import 'package:dartz/dartz.dart';
import 'package:pokemon_app/feature/home_screen/data/model/model_pokemon/request_search_pokemon.dart';
import 'package:pokemon_app/feature/home_screen/domain/repository/search_pokemon_repsitory.dart';

import '../../../../service_locator_dependencies.dart';
import '../data_source/search_pokemon_details_api_service.dart';

class SearchPokemonRepositoryImpl extends SearchPokemonRepository {
  @override
  Future<Either> searchPokemonDetails(
      RequestSearchPokemon requestSearchPokemon) {
    return sl<SearchPokemonDetailsApiService>()
        .getSearchPokemonData(requestSearchPokemon);
  }
}
