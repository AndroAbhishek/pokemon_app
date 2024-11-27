import 'package:dartz/dartz.dart';
import 'package:pokemon_app/feature/home_screen/data/model/model_pokemon/request_pokemon_model.dart';

abstract class FetchPokemonRepository {
  Future<Either> getPokemonDetails(RequestPokemonModel requestPokemonModel);
}
