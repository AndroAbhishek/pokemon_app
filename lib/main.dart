import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pokemon_app/feature/home_screen/presentation/bloc/home_bloc.dart';
import 'core/app_theme/app_theme.dart';
import 'core/constants/constants.dart';
import 'feature/splash/pages/splash_screen.dart';
import 'service_locator_dependencies.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initDependecies();
  runApp(
    BlocProvider(
      create: (_) => sl<HomeBloc>(),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: Constants.appTitle,
      theme: AppTheme.lightThemeMode,
      home: const SplashScreen(),
    );
  }
}
