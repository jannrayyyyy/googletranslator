import 'package:a_translator/data/datasource/local/abstract.dart';
import 'package:a_translator/data/datasource/local/implementation.dart';
import 'package:a_translator/data/repository/implementation.dart';
import 'package:a_translator/domain/repository/abstract.dart';
import 'package:a_translator/domain/usecases/add/add_favorite.dart';
import 'package:a_translator/domain/usecases/delete/delete_favorite.dart';
import 'package:a_translator/domain/usecases/fetch/fetch_favorite.dart';
import 'package:a_translator/presentation/bloc/favorite/favorite_bloc.dart';
import 'package:get_it/get_it.dart';

final sl = GetIt.instance;

Future init() async {
  sl.registerFactory(() => FavoriteBloc(sl(), sl(), sl()));

  sl.registerLazySingleton(() => AddFavorite(repo: sl()));
  sl.registerLazySingleton(() => DeleteFavorite(repo: sl()));
  sl.registerLazySingleton(() => FetchFavorite(repo: sl()));

  sl.registerLazySingleton<Repository>(() => RepositoryImpl(local: sl()));
  sl.registerLazySingleton<LocalDataSource>(() => LocalDataSourceImpl());
}
