import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import '../../data/models/user_model.dart';

class AuthProvider extends ChangeNotifier {
  // Panggil Supabase
  final SupabaseClient supabase = Supabase.instance.client;

  // Tentukan datanya
  UserModel? _user;

  // Tentukan statenya
  bool _loading = false;
  bool _success = false;
  bool _failure = false;

  // Buat Getter
  UserModel? get user => _user;
  bool get loading => _loading;
  bool get success => _success;
  bool get failure => _failure;

  // Buat Method Handler
  void login({required String email, required String password}) {
    try {
      final reponse = supabase.auth.signUp(email: email, password: password);
    } catch (e) {
      _failure = true;
      notifyListeners();
    }
  }

  void register({
    required String name,
    required String email,
    required String password,
  }) {}
  void logout() {}
  void googleAuth() {}
  void appleAuth() {}
}
