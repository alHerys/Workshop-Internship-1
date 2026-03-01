import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import '../../../data/models/user_model.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  final SupabaseClient supabase;
  late final StreamSubscription _authStateSubscription;

  AuthCubit(this.supabase) : super(AuthInitial());

  @override
  Future<void> close() async {
    await _authStateSubscription.cancel();
    return super.close();
  }

  void checkSessionListener() {
    try {
      _authStateSubscription = supabase.auth.onAuthStateChange.listen((
        data,
      ) async {
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
                nama: session.user.userMetadata?['name'],
                fotoProfil: session.user.userMetadata?['avatar_url'],
                telepon: session.user.userMetadata?['phone_number'],
                negara: session.user.userMetadata?['country'],
                email: session.user.email!,
              ),
            ),
          );
        } else {
          emit(AuthInitial());
        }
      });
    } catch (e) {
      print(e);
      emit(AuthFailure(e.toString()));
    }
  }

  Future<void> register(String name, String email, String password) async {
    emit(AuthLoading());

    try {
      await supabase.auth.signUp(
        email: email,
        password: password,
        data: {
          'name': name,
          'avatar_url': null,
          'phone_number': null,
          'country': null,
        },
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

  Future<void> authGoogle() async {
    const webClientId =
        '24496365114-piioa7urngn7n08phh0isv5i0uga9v0n.apps.googleusercontent.com';

    final scopes = ['email', 'profile'];

    final googleSignIn = GoogleSignIn.instance;

    await googleSignIn.initialize(
      serverClientId: webClientId,
    );

    final googleUser = await googleSignIn.attemptLightweightAuthentication();
    
    if (googleUser == null) {
      return emit(AuthFailure('Failed to sign in with Google.'));
    }

    final authorization =
        await googleUser.authorizationClient.authorizationForScopes(scopes) ??
        await googleUser.authorizationClient.authorizeScopes(scopes);
    final idToken = googleUser.authentication.idToken;

    if (idToken == null) {
      return emit(AuthFailure('No ID Token found.'));
    }

    try {
      await supabase.auth.signInWithIdToken(
        provider: OAuthProvider.google,
        idToken: idToken,
        accessToken: authorization.accessToken,
      );
    } catch (e) {
      print(e);
      emit(AuthFailure(e.toString()));
    }
  }
  

  void authApple() {}

  @override
  void onChange(Change<AuthState> change) {
    print(change);
    super.onChange(change);
  }
}
