part of 'edit_user_bloc.dart';


abstract class EditUserEvent {}


class UserEditEvent extends EditUserEvent{
  final String email;
  final File file;
  final String name;

  UserEditEvent(this.file,this.name,this.email, );
}