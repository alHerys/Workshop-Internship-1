// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import '../../../core/const/image_const.dart';
import '../../auth/pages/start_page.dart';
import '../onboarding_widget.dart';

class OnboardingPage3 extends StatelessWidget {
  const OnboardingPage3({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: OnboardingWidget(
        imagePath: ImageConst.onboardingPangsit,
        mainText: 'Nikmati',
        subText: 'Cicipi petualangan seru dan kuliner terbaik',
        onPressed: () {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => StartPage()),
          );
        },
      ),
    );
  }
}
