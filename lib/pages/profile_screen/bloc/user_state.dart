part of 'user_bloc.dart';

abstract class UserState {}


class UserInitState extends UserState{}
class UserLoadingState extends UserState{}
class UserResponseState extends UserState{
  Either<String,UserModel>data;

  UserResponseState(this.data);
}



