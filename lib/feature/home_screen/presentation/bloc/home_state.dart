part of 'home_bloc.dart';

@immutable
sealed class HomeState {}

final class HomeInitial extends HomeState {}

final class HomeLoader extends HomeState {}

final class HomeSuccess extends HomeState {
  final List<Datum> pokemonData;
  HomeSuccess({required this.pokemonData});
}

final class HomeFailure extends HomeState {
  final String errorMessage;
  HomeFailure(this.errorMessage);
}
