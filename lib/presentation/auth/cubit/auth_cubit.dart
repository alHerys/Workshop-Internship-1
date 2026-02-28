import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import '../../../data/models/user_model.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  final supabase = Supabase.instance.client;
  late final StreamSubscription _authStateSubscription;

  AuthCubit() : super(AuthInitial());

  @override
  Future<void> close() async {
    await _authStateSubscription.cancel();
    return super.close();
  }

  void checkSessionListener() {
    _authStateSubscription = supabase.auth.onAuthStateChange.listen((data) {
      final session = data.session;
      final event = data.event;

      if (event == AuthChangeEvent.passwordRecovery) {
        emit(PasswordRecovery());
        return;
      }

      if (session != null) {
        print(session.user);
        emit(
          AuthSuccess(
            UserModel(
              nama: session.user.userMetadata?['nama'],
              email: session.user.email!,
            ),
          ),
        );
      } else {
        emit(AuthInitial());
      }
    });
  }

  Future<void> register(String name, String email, String password) async {
    emit(AuthLoading());

    try {
      await supabase.auth.signUp(
        email: email,
        password: password,
        data: {'nama': name},
        emailRedirectTo: kIsWeb
            ? null
            : 'io.supabase.malangventure://auth-callback',
      );
    } catch (e) {
      emit(AuthFailure(e.toString()));
    }
  }

  Future<void> login(String email, String password) async {
    emit(AuthLoading());

    try {
      await supabase.auth.signInWithPassword(email: email, password: password);
    } catch (e) {
      emit(AuthFailure(e.toString()));
    }
  }

  Future<void> logout() async {
    emit(AuthLoading());
    try {
      await supabase.auth.signOut();
    } catch (e) {
      emit(AuthFailure(e.toString()));
    }
  }

  Future<void> sendEmailForgotPassword(String email) async {
    emit(AuthLoading());

    try {
      await supabase.auth.resetPasswordForEmail(
        email,
        redirectTo: 'io.supabase.malangventure://auth-callback',
      );
      emit(SendEmailForgotPassword());
    } catch (e) {
      emit(AuthFailure(e.toString()));
    }
  }

  Future<void> updatePassword(String newPassword) async {
    emit(AuthLoading());
    try {
      await supabase.auth.updateUser(UserAttributes(password: newPassword));
    } catch (e) {
      emit(AuthFailure(e.toString()));
    }
  }

  void authGoogle() {}
  void authApple() {}

  @override
  void onChange(Change<AuthState> change) {
    print(change);
    super.onChange(change);
  }
}
