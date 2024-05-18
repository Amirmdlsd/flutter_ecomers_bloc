import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:meta/meta.dart';

import '../data/repository/repository.dart';

part 'edit_user_event.dart';

part 'edit_user_state.dart';

class EditUserBloc extends Bloc<EditUserEvent, EditUserState> {
  final IEditUserRepository _repository;

  EditUserBloc(this._repository) : super(EditUserInitial()) {
    on<UserEditEvent>((event, emit) async {
      emit(EditUserLoadingState());
      var edit = await _repository.editUser(
          email: event.email, file: event.file, name: event.name);
      emit(EditUserResponseState(edit));
    });
  }
}
