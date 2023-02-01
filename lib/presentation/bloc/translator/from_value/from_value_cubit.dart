import 'package:bloc/bloc.dart';

part 'from_value_state.dart';

class FromValueCubit extends Cubit<FromValueState> {
  FromValueCubit() : super(FromValueState());

  void changeFromValue({
    String? fromLangText,
    String? fromValue,
  }) {
    emit(FromValueState(
      fromLangText: fromLangText,
      fromValue: fromValue,
    ));
  }
}
