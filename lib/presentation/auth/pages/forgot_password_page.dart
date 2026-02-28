import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';

import '../../../core/const/icons_const.dart';
import '../../../core/theme/app_pallete.dart';
import '../../../core/theme/app_text.dart';
import '../../../core/validator/auth_validator.dart';
import '../widgets/auth_background.dart';
import '../widgets/auth_button.dart';
import '../widgets/background1.dart';
import '../widgets/background3.dart';
import '../widgets/custom_field.dart';

class ForgotPasswordPage extends StatefulWidget {
  const ForgotPasswordPage({super.key});

  @override
  State<ForgotPasswordPage> createState() => _ForgotPasswordPageState();
}

class _ForgotPasswordPageState extends State<ForgotPasswordPage> {
  final formKey = GlobalKey<FormState>();
  final emailController = TextEditingController();

  @override
  void dispose() {
    emailController.dispose();
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
                            'Lupa Password',
                            style: AppText.semiBold32.copyWith(
                              color: AppPallete.primaryNormal,
                            ),
                            textAlign: .center,
                          ),
                          SizedBox(height: 8),
                          Text(
                            'Silahkan tulis alamat email kamu',
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
                        ],
                      ),

                      Spacer(),

                      Flexible(
                        child: AuthButton(
                          emailController: emailController,
                          buttonContent: Text(
                            'Masuk',
                            style: AppText.semiBold20,
                          ),
                          onPressed: () async {
                            if (formKey.currentState!.validate()) {
                              // TODO: Handle Send Email
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
