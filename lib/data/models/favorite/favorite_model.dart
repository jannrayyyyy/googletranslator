import 'package:a_translator/domain/entities/favotire_entity.dart';
import 'package:hive/hive.dart';

part 'favorite_model.g.dart';

@HiveType(typeId: 0)
class FavoriteModel extends FavoriteEntity {
  const FavoriteModel({
    @HiveField(0) required super.id,
    @HiveField(1) required super.fromValue,
    @HiveField(2) required super.rawText,
    @HiveField(3) required super.toValue,
    @HiveField(4) required super.translatedText,
  });

  factory FavoriteModel.fromEntity(FavoriteEntity favorite) {
    return FavoriteModel(
      id: favorite.id,
      fromValue: favorite.fromValue,
      rawText: favorite.rawText,
      toValue: favorite.toValue,
      translatedText: favorite.translatedText,
    );
  }
}
