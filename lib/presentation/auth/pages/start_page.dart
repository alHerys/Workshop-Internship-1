import 'package:flutter/material.dart';

import '../../../core/const/image_const.dart';
import '../../../core/theme/app_pallete.dart';
import '../../../core/theme/app_text.dart';

class StartPage extends StatelessWidget {
  const StartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const .all(20.0),
          child: Center(
            child: Column(
              children: [
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 31),
                    child: Column(
                      mainAxisAlignment: .center,
                      children: [
                        Image.asset(
                          ImageConst.logo,
                          width: 148.73,
                          height: 167.62,
                        ),
                        Text(
                          'Mulai',
                          style: AppText.semiBold32.copyWith(
                            color: AppPallete.primaryNormal,
                          ),
                        ),
                        RichText(
                          textAlign: .center,
                          text: TextSpan(
                            text:
                                'Mulailah perjalanan Malang-mu hari ini bersama ',
                            style: AppText.regular16.copyWith(
                              color: AppPallete.primaryNormal,
                            ),
                            children: [
                              TextSpan(
                                text: 'Malang Venture',
                                style: AppText.specialAnkor,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Column(
                  crossAxisAlignment: .stretch,
                  spacing: 16,
                  children: [
                    ElevatedButton(
                      onPressed: () {},
                      child: Text('Daftar', style: AppText.semiBold20),
                    ),
                    ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppPallete.primaryLight,
                        foregroundColor: AppPallete.primaryNormal,
                      ),
                      child: Text('Masuk', style: AppText.semiBold20),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
