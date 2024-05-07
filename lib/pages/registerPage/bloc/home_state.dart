class RegisterState {
  final String name;
  final String email;
  final String password;

  RegisterState({this.email = '', this.password = '', this.name = ''});

  RegisterState copyWith({String? email, String? pass, String? name}) {
    return RegisterState(
        name: name ?? this.name,
        email: email ?? this.email,
        password: password ?? this.password);
  }
}
