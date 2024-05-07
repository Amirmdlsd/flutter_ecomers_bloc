import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:untitled2/pages/registerPage/bloc/home_event.dart';
import 'package:untitled2/pages/registerPage/bloc/home_state.dart';
import 'package:untitled2/pages/registerPage/controller.dart';

class RegisterBloc extends Bloc<RegisterEvent, RegisterState> {

  RegisterBloc() : super(RegisterState()) {
    on<RegisterEvent>((event, emit) {

      RegisterController.register(name:event.name,email: event.email, password: event.pass,context:event.context);
      emit(RegisterState(email: event.email, password: event.pass));
    });
  }
}
