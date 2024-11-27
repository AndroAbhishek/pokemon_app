import 'package:dartz/dartz.dart';
import 'package:pokemon_app/feature/home_screen/data/model/model_pokemon/request_search_pokemon.dart';

abstract class SearchPokemonRepository {
  Future<Either> searchPokemonDetails(
      RequestSearchPokemon requestSearchPokemon);
}
