// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../core/const/icons_const.dart';
import '../../../core/theme/app_pallete.dart';
import '../../../core/theme/app_text.dart';
import '../../../core/validator/auth_validator.dart';
import '../widgets/auth_button.dart';
import '../widgets/custom_field.dart';
import '../widgets/password_field.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final namaController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();
  final formKey = GlobalKey<FormState>();
  bool passwordObscured = true;
  bool confirmPasswordObscured = true;

  @override
  void dispose() {
    namaController.dispose();
    emailController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppPallete.neutral100,
      body: SafeArea(
        bottom: false,
        left: false,
        right: false,
        child: Form(
          key: formKey,
          child: SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                children: [
                  Expanded(
                    child: Column(
                      mainAxisAlignment: .center,
                      crossAxisAlignment: .stretch,
                      children: [
                        Text(
                          'Daftar',
                          style: AppText.semiBold32.copyWith(
                            color: AppPallete.primaryNormal,
                          ),
                          textAlign: .center,
                        ),
                        SizedBox(height: 8),
                        Text(
                          'Buat akun baru kamu',
                          style: AppText.regular14,
                          textAlign: .center,
                        ),

                        SizedBox(height: 52),

                        Column(
                          spacing: 20,
                          children: [
                            CustomField(
                              label: 'Nama Lengkap',
                              controller: namaController,
                              prefixIcon: SvgPicture.asset(IconConst.person),
                              validator: (value) =>
                                  AuthValidator.name(value: value),
                            ),
                            CustomField(
                              label: 'Email',
                              controller: emailController,
                              prefixIcon: SvgPicture.asset(IconConst.email),
                              validator: (value) =>
                                  AuthValidator.email(value: value),
                            ),

                            PasswordField(
                              label: 'Kata Sandi',
                              controller: passwordController,
                              validator: (value) =>
                                  AuthValidator.password(value: value),
                            ),

                            PasswordField(
                              label: 'Konfirmasi Kata Sandi',
                              controller: confirmPasswordController,
                              validator: (value) =>
                                  AuthValidator.confirmPassword(
                                    password: passwordController.text,
                                    confirmPassword: value,
                                  ),
                            ),
                          ],
                        ),

                        SizedBox(height: 8),
                      ],
                    ),
                  ),

                  Column(
                    crossAxisAlignment: .stretch,
                    mainAxisAlignment: .end,
                    children: [
                      AuthButton(
                        formKey: formKey,
                        namaController: namaController,
                        emailController: emailController,
                        passwordController: passwordController,
                        confirmPasswordController: confirmPasswordController,
                        onPressed: () {
                          // TODO: Implement registration logic
                        },
                      ),
                      Stack(
                        alignment: .center,
                        children: [
                          Divider(),
                          Container(
                            color: AppPallete.neutral100,
                            padding: .symmetric(horizontal: 9, vertical: 12),
                            child: Text(
                              'atau daftar dengan',
                              style: AppText.regular14,
                            ),
                          ),
                        ],
                      ),

                      Row(
                        mainAxisAlignment: .center,
                        spacing: 20,
                        children: [
                          GestureDetector(
                            onTap: () {
                              // TODO: Implement Google registration logic
                            },
                            child: SvgPicture.asset(IconConst.googleLogo),
                          ),
                          GestureDetector(
                            onTap: () {
                              // TODO: Implement Apple registration logic
                            },
                            child: SvgPicture.asset(IconConst.appleLogo),
                          ),
                        ],
                      ),

                      SizedBox(height: 38),

                      RichText(
                        textAlign: .center,
                        text: TextSpan(
                          text: 'Sudah memiliki akun? ',
                          style: AppText.regular14.copyWith(
                            color: AppPallete.neutral900,
                          ),
                          children: [
                            TextSpan(
                              text: 'Masuk',
                              recognizer: TapGestureRecognizer()
                                ..onTap = () {
                                  Navigator.pop(context);
                                },
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
      ),
    );
  }
}
