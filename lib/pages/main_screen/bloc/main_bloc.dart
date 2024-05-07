import 'package:bloc/bloc.dart';
import 'package:untitled2/pages/main_screen/bloc/main_event.dart';
import 'package:untitled2/pages/main_screen/bloc/main_state.dart';

class MainBloc extends Bloc<MainEvent, MainState> {
  MainBloc() : super(MainState()) {
    on<ChangeIndexEvent>(_changeIndex);
  }

  void _changeIndex(ChangeIndexEvent event, Emitter<MainState> emit) {
    emit(MainState(currentIndex: event.index));
  }
}
