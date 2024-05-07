class LoginState {
  final String email;
  final String password;

  const LoginState({this.email = '', this.password = ''});

  LoginState copyWith({String? email, String? pass}) {
    return LoginState(
        email: email ?? this.email, password: pass ?? this.password);
  }
}
