import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import 'core/const/secret_const.dart';
import 'core/theme/app_theme.dart';
import 'presentation/onboarding_splash/pages/onboarding_page_1.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Supabase.initialize(
    url: SecretConst.supabaseUrl,
    anonKey: SecretConst.supabaseAnonKey,
  );

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.theme,
      home: OnboardingPage1(),
    );
  }
}
