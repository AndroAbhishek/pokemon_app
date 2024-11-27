import 'package:dartz/dartz.dart';
import 'package:pokemon_app/feature/home_screen/data/model/model_pokemon/request_pokemon_model.dart';
import 'package:pokemon_app/feature/home_screen/domain/repository/fetch_pokemon_repository.dart';

import '../../../../service_locator_dependencies.dart';
import '../data_source/get_pokemon_details_api_service.dart';

class FetchPokemonRepositoryImpl extends FetchPokemonRepository {
  @override
  Future<Either> getPokemonDetails(RequestPokemonModel requestPokemonModel) {
    return sl<GetPokemonDetailsApiService>()
        .getPokemonData(requestPokemonModel);
  }
}
