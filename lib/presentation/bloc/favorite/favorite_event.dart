// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'favorite_bloc.dart';

abstract class FavoriteEvent extends Equatable {
  const FavoriteEvent();

  @override
  List<Object> get props => [];
}

class FetchValueEvent extends FavoriteEvent {}

class DeleteValueEvent extends FavoriteEvent {
  final int id;
  const DeleteValueEvent({required this.id});
}

class AddValueEvent extends FavoriteEvent {
  final FavoriteEntity favorite;
  const AddValueEvent({required this.favorite});
}
