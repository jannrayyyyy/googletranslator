import 'package:a_translator/data/models/favorite/favorite_model.dart';
import 'package:a_translator/data/models/history/history_model.dart';

abstract class LocalDataSource {
  Future<void> addHistory(HistoryModel history);
  Future<void> addFavorite(FavoriteModel favorite);
  Future<void> deleteFavorite(int id);
  Future<List<FavoriteModel>> fetchFavorites();
  Future<List<HistoryModel>> fetchHistories();
}
