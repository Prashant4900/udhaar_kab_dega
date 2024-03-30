part of 'auth_bloc.dart';

sealed class AuthEvent extends Equatable {
  const AuthEvent();

  @override
  List<Object> get props => [];
}

final class GoogleSignIn extends AuthEvent {}

final class SignOut extends AuthEvent {}

final class IsSignIn extends AuthEvent {}
