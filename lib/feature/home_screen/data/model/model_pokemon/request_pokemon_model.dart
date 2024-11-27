import 'dart:convert';
import 'package:pokemon_app/feature/home_screen/domain/entities/entity_pokemon/entity_request_pokemon.dart';

class RequestPokemonModel extends EntityRequestPokemon {
  RequestPokemonModel({
    required super.page,
    required super.pageSize,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'page': page,
      'pageSize': pageSize,
    };
  }

  String toJson() => json.encode(toMap());
}
