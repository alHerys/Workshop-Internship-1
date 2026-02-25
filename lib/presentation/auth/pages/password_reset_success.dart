import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import '../../../core/const/gif_const.dart';
import '../../../core/theme/app_pallete.dart';
import '../../../core/theme/app_text.dart';
import 'login_page.dart';

class PasswordResetSuccessPage extends StatelessWidget {
  final String email;
  const PasswordResetSuccessPage({super.key, required this.email});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppPallete.neutral100,

      body: SafeArea(
        bottom: false,
        left: false,
        right: false,
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: .stretch,
              children: [
                Expanded(
                  child: Column(
                    mainAxisAlignment: .center,
                    crossAxisAlignment: .stretch,
                    children: [
                      Image.asset(
                        GifConst.resetPassword,
                        filterQuality: .medium,
                      ),

                      Text(
                        'Link Reset Terkirim',
                        style: AppText.semiBold32.copyWith(
                          color: AppPallete.primaryNormal,
                        ),
                        textAlign: .center,
                      ),
                      SizedBox(height: 8),
                      RichText(
                        textAlign: .center,
                        text: TextSpan(
                          text: 'Cek email ',
                          style: AppText.regular14.copyWith(
                            color: AppPallete.neutral900,
                          ),
                          children: [
                            TextSpan(
                              text: email,
                              style: AppText.regular14.copyWith(
                                fontWeight: .bold,
                              ),
                            ),
                            TextSpan(
                              text:
                                  ' untuk link reset. Periksa folder spam jika tidak ditemukan',
                            ),
                          ],
                        ),
                      ),

                      SizedBox(height: 52),
                    ],
                  ),
                ),

                ElevatedButton(
                  onPressed: () {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(builder: (context) => LoginPage()),
                    );
                  },
                  child: Text('Selesai', style: AppText.semiBold20),
                ),

                SizedBox(height: 12),
                RichText(
                  textAlign: .center,
                  text: TextSpan(
                    text: 'Belum mendapatkan email? ',
                    style: AppText.regular14.copyWith(
                      color: AppPallete.neutral900,
                    ),
                    children: [
                      TextSpan(
                        text: 'Kirim ulang',
                        recognizer: TapGestureRecognizer()
                          ..onTap = () {
                            showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return AlertDialog(
                                  title: Text(
                                    'Email Terkirim',
                                    style: AppText.semiBold18,
                                    textAlign: .center,
                                  ),
                                  content: Text(
                                    'Kami telah mengirim ulang email. Periksa kotak masuk atau folder spam Anda.',
                                    style: AppText.regular14,
                                    textAlign: .center,
                                  ),
                                  actionsAlignment: .center,
                                  contentPadding: .all(20),
                                  insetPadding: .all(20),
                                  actions: [
                                    ElevatedButton(
                                      onPressed: () {
                                        Navigator.pop(context);
                                      },
                                      child: Padding(
                                        padding: const EdgeInsets.symmetric(
                                          horizontal: 20,
                                        ),
                                        child: Text(
                                          'OK',
                                          style: AppText.semiBold14,
                                        ),
                                      ),
                                    ),
                                  ],
                                );
                              },
                            );
                          },
                        style: AppText.regular14.copyWith(
                          decoration: .underline,
                          color: AppPallete.primaryNormal,
                        ),
                      ),
                    ],
                  ),
                ),

                SizedBox(height: 100),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
