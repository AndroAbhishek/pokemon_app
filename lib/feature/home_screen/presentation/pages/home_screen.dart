import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pokemon_app/core/common/utils/gif_loader.dart';
import '../../../../core/common/utils/loader.dart';
import '../bloc/home_bloc.dart';
import '../widgets/custom_app_bar.dart';
import '../widgets/no_data_widget.dart';
import '../widgets/pokemon_grid_view.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final ScrollController _scrollController = ScrollController();
  TextEditingController searchEditingController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _loadNextPage();

    _scrollController.addListener(() {
      if (_scrollController.position.pixels >=
          _scrollController.position.maxScrollExtent) {
        _loadNextPage();
      }
    });
  }

  void _loadNextPage() {
    final homeBloc = context.read<HomeBloc>();
    if (!homeBloc.isLastPage && !homeBloc.isLoading && !homeBloc.searchMode) {
      homeBloc.add(GetPokemonData(
        page: homeBloc.currentPage + 1,
        pageSize: homeBloc.pageSize,
      ));
    }
  }

  void clearSearchAndCallMainApi(BuildContext context) {
    searchEditingController.clear();
    context.read<HomeBloc>().searchMode = false;
    context.read<HomeBloc>().listPokemonData.clear();
    context.read<HomeBloc>().add(GetPokemonData(
          page: 1,
          pageSize: context.read<HomeBloc>().pageSize,
        ));
  }

  String sendSearchText(String searchText) {
    if (searchText.contains(' ')) {
      return searchText.split(' ')[0];
    }
    return searchText;
  }

  @override
  void dispose() {
    _scrollController.dispose();
    searchEditingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        searchEditingController: searchEditingController,
        onSearchSubmitted: (value) {
          if (value.isNotEmpty) {
            context.read<HomeBloc>().add(
                  SearchPokemonDataEvent(
                    setName: sendSearchText(
                      searchEditingController.text.trim(),
                    ),
                  ),
                );
          } else {
            clearSearchAndCallMainApi(context);
          }
        },
        onClearSearch: () {
          if (searchEditingController.text.isNotEmpty) {
            clearSearchAndCallMainApi(context);
          }
        },
      ),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: BlocBuilder<HomeBloc, HomeState>(
          builder: (context, state) {
            if (state is HomeLoader &&
                context.read<HomeBloc>().currentPage == 1) {
              return const Loader();
            }
            if (state is HomeLoader &&
                context.read<HomeBloc>().currentPage != 1) {
              return const GifLoader(alignment: Alignment.center);
            }
            if (state is HomeSuccess) {
              var pokemonList = context.read<HomeBloc>().listPokemonData;
              if (pokemonList.isEmpty) {
                return const NoDataWidget();
              }
              return PokemonGridView(
                pokemonList: pokemonList,
                scrollController: _scrollController,
              );
            } else if (state is HomeFailure) {
              return Center(
                  child: Text('Failed to load data: ${state.errorMessage}'));
            }
            return Container();
          },
        ),
      ),
    );
  }
}
