import 'package:dartz/dartz.dart';
import 'package:pokemon_app/feature/home_screen/data/model/model_pokemon/request_search_pokemon.dart';
import '../../../../core/usecase/use_case.dart';
import '../../../../service_locator_dependencies.dart';
import '../repository/search_pokemon_repsitory.dart';

class SearchPokemonData implements UseCase<Either, RequestSearchPokemon> {
  @override
  Future<Either> call({RequestSearchPokemon? params}) {
    return sl<SearchPokemonRepository>().searchPokemonDetails(params!);
  }
}
