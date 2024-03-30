import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:udhaar_kab_dega/get_it.dart';
import 'package:udhaar_kab_dega/repositories/auth_repository.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc() : super(AuthInitial()) {
    on<GoogleSignIn>(_googleSignIn);
    on<SignOut>(_signOut);
    on<IsSignIn>(_isSignIn);
  }

  final authRepo = getIt<AuthRepo>();

  FutureOr<void> _googleSignIn(
    GoogleSignIn event,
    Emitter<AuthState> emit,
  ) async {
    emit(AuthLoading());

    try {
      final user = await authRepo.signInWithGoogle();
      if (user != null) {
        emit(AuthSuccess(user: user));
      } else {
        emit(const AuthFailure(message: 'Something went wrong!.'));
      }
    } catch (e) {
      final message = e.toString();
      emit(AuthFailure(message: message));
    }
  }

  FutureOr<void> _signOut(SignOut event, Emitter<AuthState> emit) async {
    emit(AuthLoading());
    try {
      await authRepo.signOut();
      emit(AuthLogOut());
    } catch (e) {
      final message = e.toString();
      emit(AuthFailure(message: message));
    }
  }

  FutureOr<void> _isSignIn(IsSignIn event, Emitter<AuthState> emit) async {
    emit(AuthLoading());
    try {
      final user = await authRepo.isSignIn();
      if (user != null) {
        emit(AuthSuccess(user: user));
      } else {
        emit(const AuthFailure(message: ''));
      }
    } catch (e) {
      final message = e.toString();
      emit(AuthFailure(message: message));
    }
  }
}
