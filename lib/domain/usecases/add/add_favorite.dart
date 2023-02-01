// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:a_translator/domain/entities/favotire_entity.dart';
import 'package:a_translator/domain/repository/abstract.dart';

class AddFavorite {
  final Repository repo;
  AddFavorite({required this.repo});

  Future<void> call(FavoriteEntity favorite) async {
    await repo.addFavorite(favorite);
  }
}
