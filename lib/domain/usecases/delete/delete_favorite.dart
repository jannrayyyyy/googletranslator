// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:a_translator/domain/repository/abstract.dart';

class DeleteFavorite {
  final Repository repo;
  DeleteFavorite({required this.repo});
  Future<void> call(int id) async {
    repo.deleteFavorite(id);
  }
}
