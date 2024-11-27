part of 'service_locator_dependencies.dart';

final sl = GetIt.instance;

Future<void> initDependecies() async {
  _initDioClient();
  _initPokemonDetails();
}

void _initDioClient() {
  sl.registerSingleton<DioClient>(
    DioClient(),
  );
}

void _initPokemonDetails() {
  //service
  sl.registerSingleton<GetPokemonDetailsApiService>(
    GetPokemonDetailsApiServiceImpl(),
  );

  sl.registerSingleton<SearchPokemonDetailsApiService>(
    SearchPokemonDetailsApiServiceImpl(),
  );

  //Repository
  sl.registerSingleton<FetchPokemonRepository>(
    FetchPokemonRepositoryImpl(),
  );

  sl.registerSingleton<SearchPokemonRepository>(
    SearchPokemonRepositoryImpl(),
  );

  //UseCase
  sl.registerSingleton<FetchPokemonData>(
    FetchPokemonData(),
  );

  sl.registerSingleton<SearchPokemonData>(
    SearchPokemonData(),
  );

  //Bloc
  sl.registerFactory<HomeBloc>(
    () => HomeBloc(
      fetchPokemonData: sl(),
      searchPokemonData: sl(),
    ),
  );
}
