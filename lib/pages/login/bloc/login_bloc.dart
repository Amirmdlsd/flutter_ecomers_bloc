import 'package:bloc/bloc.dart';
import 'package:untitled2/pages/login/bloc/login_event.dart';
import 'package:untitled2/pages/login/bloc/login_state.dart';
import 'package:untitled2/pages/login/controller.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc() : super(LoginState()) {
    on<LoginEvent>(_login);
  }

  Future<void> _login(LoginEvent event, Emitter<LoginState> emit) async {
    await LoginController.login(
        context: event.context, email: event.email, password: event.password);
    emit(LoginState(email: event.email, password: event.password));
  }
}
