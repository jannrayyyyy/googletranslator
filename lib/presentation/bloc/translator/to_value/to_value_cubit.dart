import 'package:bloc/bloc.dart';

part 'to_value_state.dart';

class ToValueCubit extends Cubit<ToValueState> {
  ToValueCubit() : super(ToValueState());

  void changeToValue({
    String? toLangText,
    String? toValue,
  }) {
    emit(ToValueState(
      toLangText: toLangText,
      toValue: toValue,
    ));
  }
}
