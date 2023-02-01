// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:a_translator/domain/entities/history_model.dart';
import 'package:a_translator/domain/repository/abstract.dart';

class FetchHistory {
  final Repository repo;
  FetchHistory({required this.repo});
  Future<List<HistoryEntity>> call() async {
    return await repo.fetchHistories();
  }
}
