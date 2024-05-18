import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:meta/meta.dart';
import 'package:untitled2/pages/profile_screen/data/repository/user_repository.dart';
import 'package:untitled2/pages/profile_screen/data/user_model.dart';

part 'user_event.dart';

part 'user_state.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  final IUserRepository _repo;

  UserBloc(this._repo) : super(UserInitState()) {
    on<GetUserInfoEvent>((event, emit) async {
      emit(UserLoadingState());
      await _repo
          .getUserDataRepo()
          .then((data) => emit(UserResponseState(data)));
    });
  }
}
