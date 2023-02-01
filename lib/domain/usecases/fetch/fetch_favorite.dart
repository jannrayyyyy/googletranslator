// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:a_translator/domain/entities/favotire_entity.dart';
import 'package:a_translator/domain/repository/abstract.dart';

class FetchFavorite {
  final Repository repo;
  FetchFavorite({required this.repo});
  Future<List<FavoriteEntity>> call() async {
    return await repo.fetchFavorites();
  }
}
