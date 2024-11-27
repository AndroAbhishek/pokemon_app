import 'dart:convert';
import 'package:pokemon_app/feature/home_screen/domain/entities/entity_pokemon/entity_search_pokemon.dart';

class RequestSearchPokemon extends EntitySearchPokemon {
  RequestSearchPokemon({required super.setName});

  factory RequestSearchPokemon.fromMap(Map<String, dynamic> map) {
    return RequestSearchPokemon(
      setName: map['setName'] as String,
    );
  }

  factory RequestSearchPokemon.fromJson(String source) =>
      RequestSearchPokemon.fromMap(json.decode(source) as Map<String, dynamic>);
}
