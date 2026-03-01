// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';

import '../../../core/const/gif_const.dart';
import '../../../core/const/icons_const.dart';
import '../../../core/theme/app_pallete.dart';
import '../../../core/theme/app_text.dart';
import '../../../core/validator/auth_validator.dart';
import '../../home/pages/root_page.dart';
import '../cubit/auth_cubit.dart';
import '../widgets/auth_button.dart';
import '../widgets/custom_field.dart';
import '../widgets/password_field.dart';
import 'login_page.dart';

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
  bool aggreTermCondition = false;

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
      body: Form(
        key: formKey,
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: LayoutBuilder(
              builder: (context, constraint) {
                return SingleChildScrollView(
                  reverse: true,
                  child: ConstrainedBox(
                    constraints: BoxConstraints(
                      minHeight: constraint.maxHeight,
                    ),
                    child: IntrinsicHeight(
                      child: Column(
                        mainAxisAlignment: .center,
                        crossAxisAlignment: .stretch,
                        children: [
                          Spacer(),

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

                          CheckboxListTile(
                            activeColor: AppPallete.primaryNormal,
                            controlAffinity: .leading,
                            checkboxShape: CircleBorder(),
                            value: aggreTermCondition,
                            contentPadding: .all(0),
                            checkColor: AppPallete.neutral100,
                            side: BorderSide(
                              color: AppPallete.primaryNormal,
                              width: 2,
                            ),
                            onChanged: (value) {
                              setState(() {
                                aggreTermCondition = value ?? false;
                              });
                            },
                            title: RichText(
                              text: TextSpan(
                                text: 'Setuju dengan ',
                                style: AppText.regular14.copyWith(
                                  color: AppPallete.neutral900,
                                ),
                                children: [
                                  TextSpan(
                                    text: 'Syarat & Ketentuan',
                                    recognizer: TapGestureRecognizer()
                                      ..onTap = () {
                                        // TODO: Term & Condition
                                      },
                                    style: AppText.regular14.copyWith(
                                      decoration: .underline,
                                      color: AppPallete.primaryNormal,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),

                          SizedBox(height: 10),

                          Spacer(),

                          AuthButton(
                            namaController: namaController,
                            emailController: emailController,
                            passwordController: passwordController,
                            confirmPasswordController:
                                confirmPasswordController,
                            aggreTermCondition: aggreTermCondition,
                            onPressed: () async {
                              if (formKey.currentState!.validate()) {
                                await context.read<AuthCubit>().register(
                                  namaController.text,
                                  emailController.text,
                                  passwordController.text,
                                );

                                showDialog(
                                  context: context,
                                  barrierDismissible: false,
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
                                    );
                                  },
                                );
                              }
                            },
                            buttonContent: BlocConsumer<AuthCubit, AuthState>(
                              listener: (context, state) {
                                if (state is AuthFailure) {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(
                                      content: Text(
                                        'Error Occured: ${state.message}',
                                      ),
                                    ),
                                  );

                                  print(state.message);
                                }

                                if (state is AuthSuccess) {
                                  Navigator.pushReplacement(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => RootPage(),
                                    ),
                                  );
                                }
                              },
                              builder: (context, state) {
                                if (state is AuthLoading) {
                                  return Image.asset(
                                    GifConst.loadingDot,
                                    height: 40,
                                  );
                                }

                                return Text(
                                  'Daftar',
                                  style: AppText.semiBold20,
                                );
                              },
                            ),
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
                                onTap: () async {
                                  context.read<AuthCubit>().authGoogle();
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
                                      Navigator.pushReplacement(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) => LoginPage(),
                                        ),
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
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
