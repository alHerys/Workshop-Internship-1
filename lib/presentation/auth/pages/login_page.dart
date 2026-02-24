// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../core/const/icons_const.dart';
import '../../../core/theme/app_pallete.dart';
import '../../../core/theme/app_text.dart';
import '../../../core/validator/auth_validator.dart';
import '../widgets/background1.dart';
import '../widgets/background2.dart';
import '../widgets/background3.dart';
import '../widgets/custom_field.dart';
import '../widgets/password_field.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final formKey = GlobalKey<FormState>();
  bool isObscured = true;

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppPallete.primaryLightActive,
      body: SafeArea(
        bottom: false,
        left: false,
        right: false,
        child: Stack(
          children: [
            Padding(
              padding: EdgeInsets.only(
                top: MediaQuery.sizeOf(context).height * 0.1,
              ),
              child: Stack(
                children: [
                  ClipPath(
                    clipper: Background1(),
                    child: Container(
                      color: AppPallete.neutral100.withValues(alpha: 0.4),
                    ),
                  ),
                  ClipPath(
                    clipper: Background2(),
                    child: Container(
                      color: AppPallete.neutral100.withValues(alpha: 0.5),
                    ),
                  ),
                  ClipPath(
                    clipper: Background3(),
                    child: Container(color: AppPallete.neutral100),
                  ),
                ],
              ),
            ),

            Form(
              key: formKey,
              child: SafeArea(
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Stack(
                    children: [
                      Column(
                        mainAxisAlignment: .center,
                        crossAxisAlignment: .stretch,
                        children: [
                          Text(
                            'Selamat datang!',
                            style: AppText.semiBold32.copyWith(
                              color: AppPallete.primaryNormal,
                            ),
                            textAlign: .center,
                          ),
                          SizedBox(height: 8),
                          Text(
                            'Masuk ke akunmu',
                            style: AppText.regular14,
                            textAlign: .center,
                          ),

                          SizedBox(height: 52),

                          CustomField(
                            label: 'Email',
                            controller: emailController,
                            prefixIcon: SvgPicture.asset(IconConst.email),
                            validator: (value) =>
                                AuthValidator.email(value: value),
                          ),
                          SizedBox(height: 28),
                          PasswordField(
                            passwordController: passwordController,
                            validator: (value) =>
                                AuthValidator.password(value: value),
                          ),

                          SizedBox(height: 8),
                          Text(
                            'Lupa kata sandi?',
                            style: AppText.medium14.copyWith(
                              color: AppPallete.primaryNormal,
                            ),
                            textAlign: .end,
                          ),

                          SizedBox(height: 60),
                        ],
                      ),

                      Column(
                        crossAxisAlignment: .stretch,
                        mainAxisAlignment: .end,
                        children: [
                          ElevatedButton(
                            onPressed: () {
                              if (!formKey.currentState!.validate()) {
                                print('Success');
                              }
                            },
                            child: Text('Masuk', style: AppText.semiBold20),
                          ),
                          Stack(
                            alignment: .center,
                            children: [
                              Divider(),
                              Container(
                                color: AppPallete.neutral100,
                                padding: .symmetric(
                                  horizontal: 9,
                                  vertical: 12,
                                ),
                                child: Text(
                                  'atau masuk dengan',
                                  style: AppText.regular14,
                                ),
                              ),
                            ],
                          ),

                          Row(
                            mainAxisAlignment: .center,
                            spacing: 20,
                            children: [
                              SvgPicture.asset(IconConst.googleLogo),
                              SvgPicture.asset(IconConst.appleLogo),
                            ],
                          ),

                          SizedBox(height: 38),

                          RichText(
                            textAlign: .center,
                            text: TextSpan(
                              text: 'Belum memiliki akun? ',
                              style: AppText.regular14.copyWith(
                                color: AppPallete.neutral900,
                              ),
                              children: [
                                TextSpan(
                                  text: 'Daftar',
                                  recognizer: TapGestureRecognizer()
                                    ..onTap = () {},
                                  style: AppText.regular14.copyWith(
                                    decoration: .underline,
                                    color: AppPallete.primaryNormal,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
