import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pokemon_app/feature/home_screen/data/model/model_pokemon/request_pokemon_model.dart';
import 'package:pokemon_app/feature/home_screen/data/model/model_pokemon/request_search_pokemon.dart';
import 'package:pokemon_app/feature/home_screen/data/model/model_pokemon/response_api_pokemon_model_data.dart';
import '../../../../service_locator_dependencies.dart';
import '../../domain/usecases/fetch_pokemon_data.dart';
import '../../domain/usecases/search_pokemon_data.dart';
part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  bool isLoading = false;
  int currentPage = 0;
  final int pageSize = 10;
  bool searchMode = false;
  bool isLastPage = false;
  List<Datum> listPokemonData = [];

  final FetchPokemonData fetchPokemonData;
  final SearchPokemonData searchPokemonData;

  HomeBloc({
    required this.fetchPokemonData,
    required this.searchPokemonData,
  }) : super(HomeInitial()) {
    on<GetPokemonData>(_onGetPokemonDetails);
    on<SearchPokemonDataEvent>(_onSearchPokemonDetails);
  }

  void _onSearchPokemonDetails(
    SearchPokemonDataEvent event,
    Emitter<HomeState> emit,
  ) async {
    emit(HomeLoader());
    searchMode = true;
    listPokemonData.clear();
    currentPage = 0;
    isLastPage = false;
    final res = await sl<SearchPokemonData>().call(
      params: RequestSearchPokemon(
        setName: event.setName,
      ),
    );

    res.fold(
      (failure) {
        emit(HomeFailure(failure));
      },
      (success) {
        debugPrint('Search ${success.count} , ${success.totalCount}');
        isLastPage = success.count == success.totalCount;
        listPokemonData.addAll(success.data);
        emit(HomeSuccess(pokemonData: listPokemonData));
      },
    );
  }

  void _onGetPokemonDetails(
    GetPokemonData event,
    Emitter<HomeState> emit,
  ) async {
    if (isLoading || searchMode) return;
    isLoading = true;
    if (event.page == 1) {
      emit(HomeLoader());
    }

    final res = await sl<FetchPokemonData>().call(
      params: RequestPokemonModel(
        page: event.page,
        pageSize: event.pageSize,
      ),
    );

    res.fold(
      (failure) {
        emit(HomeFailure(failure));
      },
      (success) {
        isLoading = false;
        isLastPage = success.page * success.pageSize >= success.totalCount;
        listPokemonData.addAll(success.data);
        currentPage = event.page;
        emit(HomeSuccess(pokemonData: listPokemonData));
      },
    );
  }
}
