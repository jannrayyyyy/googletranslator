// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:a_translator/data/datasource/local/abstract.dart';
import 'package:a_translator/data/models/history/history_model.dart';
import 'package:a_translator/domain/entities/favotire_entity.dart';
import 'package:a_translator/domain/entities/history_model.dart';
import 'package:a_translator/domain/repository/abstract.dart';

import '../models/favorite/favorite_model.dart';

class RepositoryImpl implements Repository {
  final LocalDataSource local;
  RepositoryImpl({required this.local});
  @override
  Future<void> addFavorite(FavoriteEntity favorite) async {
    await local.addFavorite(FavoriteModel.fromEntity(favorite));
  }

  @override
  Future<void> addHistory(HistoryEntity history) async {
    await local.addHistory(HistoryModel.fromEntity(history));
  }

  @override
  Future<void> deleteFavorite(int id) async {
    await local.deleteFavorite(id);
  }

  @override
  Future<List<FavoriteEntity>> fetchFavorites() async {
    return await local.fetchFavorites();
  }

  @override
  Future<List<HistoryEntity>> fetchHistories() async {
    return await local.fetchHistories();
  }
}
