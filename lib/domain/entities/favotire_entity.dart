// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';

class FavoriteEntity extends Equatable {
  final int id;
  final String fromValue;
  final String rawText;
  final String toValue;
  final String translatedText;
  const FavoriteEntity({
    required this.id,
    required this.fromValue,
    required this.rawText,
    required this.toValue,
    required this.translatedText,
  });
  @override
  List<Object?> get props => [id];
}
