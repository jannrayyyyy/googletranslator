// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import 'package:a_translator/domain/entities/favotire_entity.dart';
import 'package:a_translator/domain/usecases/add/add_favorite.dart';
import 'package:a_translator/domain/usecases/delete/delete_favorite.dart';
import 'package:a_translator/domain/usecases/fetch/fetch_favorite.dart';

part 'favorite_event.dart';
part 'favorite_state.dart';

class FavoriteBloc extends Bloc<FavoriteEvent, FavoriteState> {
  final FetchFavorite favorite;
  final DeleteFavorite deleteFavorite;
  final AddFavorite addFavorite;
  FavoriteBloc(
    this.favorite,
    this.deleteFavorite,
    this.addFavorite,
  ) : super(FavoriteInitial()) {
    on<FavoriteEvent>((event, emit) async {
      if (event is FetchValueEvent) {
        emit(FavoriteLoading());
        final fav = await favorite();
        if (fav.isEmpty) {
          emit(FavoriteEmpty());
        } else {
          emit(FavoriteLoaded(favorite: fav));
        }
      } else if (event is DeleteValueEvent) {
        emit(FavoriteLoading());
        await deleteFavorite(event.id).then((value) {
          emit(LoadingSuccessful());
        });
      } else if (event is AddValueEvent) {
        emit(FavoriteLoading());
        await addFavorite(event.favorite).then((value) {
          emit(LoadingSuccessful());
        });
      }
    });
  }
}
