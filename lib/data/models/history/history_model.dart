import 'package:a_translator/domain/entities/history_model.dart';
import 'package:hive/hive.dart';

part 'history_model.g.dart';

@HiveType(typeId: 1)
class HistoryModel extends HistoryEntity {
  const HistoryModel({
    @HiveField(0) required super.id,
    @HiveField(1) required super.fromValue,
    @HiveField(2) required super.rawText,
    @HiveField(3) required super.toValue,
    @HiveField(4) required super.translatedText,
  });
  factory HistoryModel.fromEntity(HistoryEntity history) {
    return HistoryModel(
      id: history.id,
      fromValue: history.fromValue,
      rawText: history.rawText,
      toValue: history.toValue,
      translatedText: history.translatedText,
    );
  }
}
