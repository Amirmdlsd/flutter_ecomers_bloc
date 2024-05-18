part of 'edit_user_bloc.dart';


abstract class EditUserState {}

 class EditUserInitial extends EditUserState {}

class EditUserLoadingState extends EditUserState{}
class EditUserResponseState extends EditUserState{
  Either<String,String>result;

  EditUserResponseState(this.result);
}
