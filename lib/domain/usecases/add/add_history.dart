// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:a_translator/domain/entities/history_model.dart';
import 'package:a_translator/domain/repository/abstract.dart';

class AddHistory {
  final Repository repo;
  AddHistory({required this.repo});

  Future<void> call(HistoryEntity history) async {
    await repo.addHistory(history);
  }
}
