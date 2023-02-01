import 'package:bloc/bloc.dart';

part 'navigate_state.dart';

class NavigateCubit extends Cubit<NavigateState> {
  NavigateCubit() : super(NavigateState(index: 0));

  void navigateScreen({required int index}) {
    emit(NavigateState(index: index));
  }
}
