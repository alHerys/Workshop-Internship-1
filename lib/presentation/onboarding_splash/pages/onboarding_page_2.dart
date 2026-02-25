import 'package:flutter/material.dart';

import '../../../core/const/image_const.dart';
import '../widgets/onboarding_widget.dart';
import 'onboarding_page_3.dart';

class OnboardingPage2 extends StatelessWidget {
  const OnboardingPage2({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: OnboardingWidget(
        imagePath: ImageConst.onboardingCandi,
        mainText: 'Rasakan',
        subText: 'Nikmati keindahan alam dan kekayaan budaya',
        onPressed: () {
          Navigator.pushReplacement(
            context,
            PageRouteBuilder(
              pageBuilder: (context, animation, secondaryAnimation) =>
                  OnboardingPage3(),
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
