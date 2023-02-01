import 'package:a_translator/domain/entities/favotire_entity.dart';
import 'package:a_translator/domain/entities/history_model.dart';

abstract class Repository {
  Future<void> addHistory(HistoryEntity history);
  Future<void> addFavorite(FavoriteEntity favorite);
  Future<void> deleteFavorite(int id);
  Future<List<FavoriteEntity>> fetchFavorites();
  Future<List<HistoryEntity>> fetchHistories();
}
