import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:pokemon_app/feature/home_screen/data/model/model_pokemon/request_pokemon_model.dart';

import '../../../../core/constants/api_urls.dart';
import '../../../../core/constants/constants.dart';
import '../../../../core/network/dio_client.dart';
import '../../../../service_locator_dependencies.dart';
import '../model/model_pokemon/response_api_pokemon_model_data.dart';

abstract class GetPokemonDetailsApiService {
  Future<Either> getPokemonData(RequestPokemonModel requestPokemon);
}

class GetPokemonDetailsApiServiceImpl extends GetPokemonDetailsApiService {
  @override
  Future<Either> getPokemonData(RequestPokemonModel requestPokemon) async {
    try {
      var response = await sl<DioClient>().get(
        ApiUrls.getPokemonData,
        queryParameters: {
          Constants.page: requestPokemon.page,
          Constants.pageSize: requestPokemon.pageSize
        },
      );
      var getComplaintDetailsResponse =
          ResponseApiPokemonModelData.fromJson(response.data);
      return Right(getComplaintDetailsResponse);
    } on DioException catch (e) {
      return left(e.message);
    }
  }
}
