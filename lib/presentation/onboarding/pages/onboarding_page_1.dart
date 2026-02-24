import 'package:flutter/material.dart';

import '../../../core/const/image_const.dart';
import '../onboarding_widget.dart';
import 'onboarding_page_2.dart';

class OnboardingPage1 extends StatelessWidget {
  const OnboardingPage1({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: OnboardingWidget(
        imagePath: ImageConst.onboardingKincir,
        mainText: 'Jelajahi',
        subText: 'Temukan keindahan tersembunyi di Malang',
        onPressed: () {
          Navigator.pushReplacement(
            context,
            PageRouteBuilder(
              pageBuilder: (context, animation, secondaryAnimation) =>
                  OnboardingPage2(),
              transitionsBuilder:
                  (context, animation, secondaryAnimation, child) {
                    return FadeTransition(opacity: animation, child: child);
                  },
              transitionDuration: Duration(milliseconds: 500),
            ),
          );
        },
      ),
    );
  }
}
