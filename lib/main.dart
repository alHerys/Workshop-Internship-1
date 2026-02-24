import 'package:flutter/material.dart';
import 'presentation/auth/pages/login_page.dart';
import 'presentation/auth/pages/start_page.dart';
import 'presentation/onboarding/pages/onboarding_page_1.dart';

import 'core/theme/app_theme.dart';

void main() {
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
      home: LoginPage(),
    );
  }
}
