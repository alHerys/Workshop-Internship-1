import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';

import '../../../core/const/gif_const.dart';
import '../../../core/const/icons_const.dart';
import '../../../core/theme/app_pallete.dart';
import '../../../core/theme/app_text.dart';
import '../../../core/validator/auth_validator.dart';
import '../cubit/auth_cubit.dart';
import '../widgets/auth_background.dart';
import '../widgets/auth_button.dart';
import '../widgets/background1.dart';
import '../widgets/background3.dart';
import '../widgets/custom_field.dart';
import '../widgets/password_field.dart';
import 'login_page.dart';
import 'password_email_send_page.dart';

class NewPasswordPage extends StatefulWidget {
  const NewPasswordPage({super.key});

  @override
  State<NewPasswordPage> createState() => _NewPasswordPageState();
}

class _NewPasswordPageState extends State<NewPasswordPage> {
  final formKey = GlobalKey<FormState>();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();

  @override
  void dispose() {
    passwordController.dispose();
    confirmPasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppPallete.primaryLightActive,
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        foregroundColor: Colors.transparent,
        systemOverlayStyle: SystemUiOverlayStyle.dark,

        leading: Padding(
          padding: const EdgeInsets.only(left: 24),
          child: GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: CircleAvatar(
              backgroundColor: AppPallete.neutral100,
              child: Icon(
                Icons.arrow_back_ios_new_rounded,
                color: AppPallete.primaryNormal,
              ),
            ),
          ),
        ),
      ),

      body: SafeArea(
        bottom: false,
        left: false,
        right: false,
        child: Stack(
          children: [
            AuthBackground(
              background1: Background1(),
              background1Color: AppPallete.neutral100,
              background3: Background3(),
              background3Color: AppPallete.neutral100.withValues(alpha: 0.5),
            ),

            Form(
              key: formKey,
              child: SafeArea(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: Column(
                    crossAxisAlignment: .stretch,
                    mainAxisAlignment: .center,
                    children: [
                      Spacer(),

                      Column(
                        mainAxisAlignment: .center,
                        crossAxisAlignment: .stretch,
                        children: [
                          Text(
                            'Password Baru',
                            style: AppText.semiBold32.copyWith(
                              color: AppPallete.primaryNormal,
                            ),
                            textAlign: .center,
                          ),
                          SizedBox(height: 8),
                          Text(
                            'Silahkan masukkan password baru kamu',
                            style: AppText.regular14,
                            textAlign: .center,
                          ),

                          SizedBox(height: 52),

                          PasswordField(
                            label: 'Kata Sandi',
                            controller: passwordController,
                            validator: (value) =>
                                AuthValidator.password(value: value),
                          ),

                          SizedBox(height: 20),

                          PasswordField(
                            label: 'Konfirmasi Kata Sandi',
                            controller: confirmPasswordController,
                            validator: (value) => AuthValidator.confirmPassword(
                              password: passwordController.text,
                              confirmPassword: value,
                            ),
                          ),
                        ],
                      ),

                      Spacer(),

                      Flexible(
                        child: AuthButton(
                          passwordController: passwordController,
                          confirmPasswordController: confirmPasswordController,
                          buttonContent: BlocConsumer<AuthCubit, AuthState>(
                            listener: (context, state) {
                              if (state is AuthInitial) {
                                Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => LoginPage(),
                                  ),
                                );
                              }

                              if (state is AuthFailure) {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(content: Text(state.message)),
                                );
                              }
                            },
                            builder: (context, state) {
                              if (state is AuthLoading) {
                                return Image.asset(GifConst.loadingDot, height: 30);
                              }

                              return Text('Kirim', style: AppText.semiBold20);
                            },
                          ),
                          onPressed: () async {
                            if (formKey.currentState!.validate()) {
                              await context.read<AuthCubit>().updatePassword(
                                passwordController.text.trim(),
                              );
                            }
                          },
                        ),
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
