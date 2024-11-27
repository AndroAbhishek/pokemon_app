import 'package:flutter/material.dart';
import 'package:pokemon_app/core/app_theme/app_pallete.dart';
import 'package:pokemon_app/feature/home_screen/data/model/model_pokemon/response_api_pokemon_model_data.dart';
import '../widgets/custom_text_widget.dart';

class CardDetails extends StatefulWidget {
  static route(Datum pokemon) => MaterialPageRoute(
        builder: (context) => CardDetails(pokemon: pokemon),
      );

  final Datum pokemon;
  const CardDetails({super.key, required this.pokemon});

  @override
  State<CardDetails> createState() => _CardDetailsState();
}

class _CardDetailsState extends State<CardDetails> {
  @override
  Widget build(BuildContext context) {
    var pokemon = widget.pokemon;
    String joinList(List<dynamic> list) {
      return list.join(', ');
    }

    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppPallete.gradientColor,
        title: CustomTextWidget(
          text: pokemon.name!,
          fontSize: 25,
          fontWeight: FontWeight.bold,
          textColor: AppPallete.backgroundColor,
        ),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        children: [
          Center(
            child: Stack(
              alignment: Alignment.center,
              children: [
                Image.network(
                  pokemon.images?.large ?? '',
                  fit: BoxFit.contain,
                  loadingBuilder: (BuildContext context, Widget child,
                      ImageChunkEvent? loadingProgress) {
                    if (loadingProgress == null) {
                      return child;
                    } else {
                      return const CircularProgressIndicator.adaptive(
                        backgroundColor: AppPallete.gradientColor,
                      );
                    }
                  },
                ),
              ],
            ),
          ),
          const SizedBox(height: 15),
          Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            elevation: 8,
            color: AppPallete.cardColor,
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      CustomTextWidget(
                        text: 'HP: ${pokemon.hp}',
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        textColor: AppPallete.textColor,
                      ),
                      CustomTextWidget(
                        text: 'Types: ${joinList(pokemon.types)}',
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        textColor: AppPallete.textColor,
                      ),
                    ],
                  ),
                  const SizedBox(height: 15),

                  // Evolves From and Evolves To
                  if (pokemon.evolvesFrom != null &&
                      pokemon.evolvesFrom!.isNotEmpty)
                    CustomTextWidget(
                      text: 'Evolves From: ${pokemon.evolvesFrom}',
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      textColor: AppPallete.textColor,
                    ),
                  if (pokemon.evolvesTo.isNotEmpty)
                    CustomTextWidget(
                      text: 'Evolves To: ${pokemon.evolvesTo.join(', ')}',
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      textColor: AppPallete.textColor,
                    ),
                  const SizedBox(height: 15),

                  // Attacks
                  const CustomTextWidget(
                    text: 'Attacks',
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    textColor: AppPallete.textColor,
                  ),
                  for (var attack in pokemon.attacks)
                    ExpansionTile(
                      iconColor: AppPallete.textColor,
                      collapsedIconColor: AppPallete.textColor,
                      title: CustomTextWidget(
                        text: attack.name!,
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        textColor: AppPallete.textColor,
                      ),
                      children: [
                        ListTile(
                          title: CustomTextWidget(
                            text: 'Cost: ${joinList(attack.cost)}',
                            fontSize: 16,
                            textColor: AppPallete.textColor,
                          ),
                        ),
                        if (attack.damage != null)
                          ListTile(
                            title: CustomTextWidget(
                              text: 'Damage: ${attack.damage}',
                              fontSize: 16,
                              textColor: AppPallete.textColor,
                            ),
                          ),
                        ListTile(
                          title: CustomTextWidget(
                            text: attack.text!,
                            fontSize: 16,
                            textColor: AppPallete.textColor,
                          ),
                        ),
                      ],
                    ),
                  const SizedBox(height: 15),

                  // Weaknesses
                  const CustomTextWidget(
                    text: 'Weaknesses',
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    textColor: AppPallete.textColor,
                  ),
                  ExpansionTile(
                    iconColor: AppPallete.textColor,
                    collapsedIconColor: AppPallete.textColor,
                    title: const CustomTextWidget(
                      text: 'Details',
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      textColor: AppPallete.textColor,
                    ),
                    children: [
                      for (var weakness in pokemon.weaknesses)
                        ListTile(
                          title: CustomTextWidget(
                            text: '${weakness.type}: ${weakness.value}',
                            fontSize: 16,
                            textColor: AppPallete.textColor,
                          ),
                        ),
                    ],
                  ),
                  const SizedBox(height: 15),

                  // Artist
                  CustomTextWidget(
                    text: 'Artist: ${pokemon.artist}',
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    textColor: AppPallete.textColor,
                  ),
                  const SizedBox(height: 15),

                  // Set Details
                  ExpansionTile(
                      iconColor: AppPallete.textColor,
                      collapsedIconColor: AppPallete.textColor,
                      title: const CustomTextWidget(
                        text: 'Set',
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        textColor: AppPallete.textColor,
                      ),
                      children: [
                        ListTile(
                          title: CustomTextWidget(
                            text: 'Name: ${pokemon.datumSet?.name ?? ''}',
                            fontSize: 16,
                            textColor: AppPallete.textColor,
                          ),
                        ),
                        ListTile(
                          title: CustomTextWidget(
                            text: 'Series: ${pokemon.datumSet?.series ?? ''}',
                            fontSize: 16,
                            textColor: AppPallete.textColor,
                          ),
                        ),
                        ListTile(
                          title: CustomTextWidget(
                            text:
                                'Printed Total: ${pokemon.datumSet?.printedTotal ?? ''}',
                            fontSize: 16,
                            textColor: AppPallete.textColor,
                          ),
                        ),
                        ListTile(
                          title: CustomTextWidget(
                            text:
                                'Release Date: ${pokemon.datumSet?.releaseDate ?? ''}',
                            fontSize: 16,
                            textColor: AppPallete.textColor,
                          ),
                        ),
                      ]),
                ],
              ),
            ),
          ),
          const SizedBox(height: 100)
        ],
      ),
    );
  }
}
