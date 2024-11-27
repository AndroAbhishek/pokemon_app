import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/common/utils/gif_loader.dart';
import '../../data/model/model_pokemon/response_api_pokemon_model_data.dart';
import '../bloc/home_bloc.dart';
import '../pages/card_details.dart';
import 'pokemon_card.dart';

class PokemonGridView extends StatelessWidget {
  final List<Datum> pokemonList;
  final ScrollController scrollController;

  const PokemonGridView({
    super.key,
    required this.pokemonList,
    required this.scrollController,
  });

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      controller: scrollController,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
        childAspectRatio: 0.7,
      ),
      itemCount:
          pokemonList.length + (context.read<HomeBloc>().isLastPage ? 0 : 1),
      itemBuilder: (context, index) {
        if (index == pokemonList.length &&
            !context.read<HomeBloc>().isLastPage) {
          return const GifLoader(
            alignment: Alignment.centerRight,
          );
        }
        var pokemon = pokemonList[index];
        void onPokemonTap() {
          Navigator.push(
            context,
            CardDetails.route(pokemon),
          );
        }

        return PokemonCard(
          pokemon: pokemon,
          onTap: onPokemonTap,
        );
      },
    );
  }
}
