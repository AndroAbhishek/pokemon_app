import 'package:dartz/dartz.dart';
import 'package:pokemon_app/feature/home_screen/data/model/model_pokemon/request_pokemon_model.dart';
import '../../../../core/usecase/use_case.dart';
import '../../../../service_locator_dependencies.dart';
import '../repository/fetch_pokemon_repository.dart';

class FetchPokemonData implements UseCase<Either, RequestPokemonModel> {
  @override
  Future<Either> call({RequestPokemonModel? params}) {
    return sl<FetchPokemonRepository>().getPokemonDetails(params!);
  }
}
