part of 'home_bloc.dart';

@immutable
sealed class HomeEvent {}

final class GetPokemonData extends HomeEvent {
  final int page;
  final int pageSize;

  GetPokemonData({
    required this.page,
    required this.pageSize,
  });
}

final class SearchPokemonDataEvent extends HomeEvent {
  final String setName;
  SearchPokemonDataEvent({
    required this.setName,
  });
}
