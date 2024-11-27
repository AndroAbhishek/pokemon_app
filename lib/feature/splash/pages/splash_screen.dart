import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:pokemon_app/core/app_theme/app_pallete.dart';
import 'package:pokemon_app/feature/home_screen/presentation/pages/home_screen.dart';
import 'package:pokemon_app/feature/home_screen/presentation/widgets/custom_text_widget.dart';
import '../../../core/constants/constants.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return AnimatedSplashScreen(
      splash: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Image.asset(
            Constants.gifLogo,
            height: 250,
            width: 250,
          ),
          const SizedBox(height: 20),
          const Expanded(
            child: CustomTextWidget(
              text: Constants.pokemonCards,
              fontSize: 25,
              fontWeight: FontWeight.bold,
              textColor: AppPallete.textColor,
              fontStyle: FontStyle.italic,
            ),
          ),
        ],
      ),
      nextScreen: const HomeScreen(),
      splashTransition: SplashTransition.fadeTransition,
      animationDuration: const Duration(seconds: 4),
      backgroundColor: Colors.white,
      splashIconSize: 300,
    );
  }
}
