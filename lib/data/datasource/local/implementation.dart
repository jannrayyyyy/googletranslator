import 'package:a_translator/data/datasource/local/abstract.dart';
import 'package:a_translator/data/models/history/history_model.dart';
import 'package:a_translator/data/models/favorite/favorite_model.dart';
import 'package:hive/hive.dart';

class LocalDataSourceImpl implements LocalDataSource {
  final favoriteBox = Hive.box('favorite');
  final historyBox = Hive.box('history');
  @override
  Future<void> addFavorite(FavoriteModel favorite) async {
    await favoriteBox.put(favorite.id, favorite);
  }

  @override
  Future<void> addHistory(HistoryModel history) async {
    await favoriteBox.put(history.id, history);
  }

  @override
  Future<void> deleteFavorite(int id) async {
    favoriteBox.delete(id);
  }

  @override
  Future<List<FavoriteModel>> fetchFavorites() async {
    var cachedFavorite = favoriteBox.values.toList();
    final convertedTable = cachedFavorite.map((table) {
      return table as FavoriteModel;
    }).toList();
    return convertedTable;
  }

  @override
  Future<List<HistoryModel>> fetchHistories() async {
    var cachedFavorite = historyBox.values.toList();
    final convertedTable = cachedFavorite.map((table) {
      return table as HistoryModel;
    }).toList();
    return convertedTable;
  }
}
