abstract class AuthStatus {}

class AuthInitial extends AuthStatus {}

class AuthLoading extends AuthStatus {}

class AuthSuccess extends AuthStatus {}

class AuthErorr extends AuthStatus {
  final String message;
  AuthErorr(this.message);
}

class ProfileLoading extends AuthStatus {}

class ProfileSuccess extends AuthStatus {}

class ProfileErorr extends AuthStatus {
  final String message;
  ProfileErorr(this.message);
}
