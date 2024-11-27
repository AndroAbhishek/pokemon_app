import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:pokemon_app/feature/home_screen/data/model/model_pokemon/request_search_pokemon.dart';

import '../../../../core/constants/api_urls.dart';
import '../../../../core/network/dio_client.dart';
import '../../../../service_locator_dependencies.dart';
import '../model/model_pokemon/response_api_pokemon_model_data.dart';

abstract class SearchPokemonDetailsApiService {
  Future<Either> getSearchPokemonData(
      RequestSearchPokemon requestSearchPokemon);
}

class SearchPokemonDetailsApiServiceImpl
    extends SearchPokemonDetailsApiService {
  @override
  Future<Either> getSearchPokemonData(
      RequestSearchPokemon requestSearchPokemon) async {
    try {
      var response = await sl<DioClient>().get(
        ApiUrls.getPokemonData,
        queryParameters: {
          'q': 'set.name:${requestSearchPokemon.setName}',
        },
      );
      var getSearchPokemonDetailsResponse =
          ResponseApiPokemonModelData.fromJson(response.data);
      return Right(getSearchPokemonDetailsResponse);
    } on DioException catch (e) {
      return left(e.message);
    }
  }
}
