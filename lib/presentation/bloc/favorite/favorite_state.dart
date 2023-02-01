// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'favorite_bloc.dart';

abstract class FavoriteState extends Equatable {
  const FavoriteState();

  @override
  List<Object> get props => [];
}

class FavoriteInitial extends FavoriteState {}

class FavoriteLoading extends FavoriteState {}

class FavoriteLoaded extends FavoriteState {
  final List<FavoriteEntity> favorite;
  const FavoriteLoaded({required this.favorite});
}

class FavoriteEmpty extends FavoriteState {}

class LoadingSuccessful extends FavoriteState {}
