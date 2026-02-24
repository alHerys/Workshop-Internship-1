// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../../../core/const/icons_const.dart';
import '../pages/login_page.dart';
import 'custom_field.dart';

class PasswordField extends StatefulWidget {
  final TextEditingController passwordController;
  final String? Function(String?)? validator;

  const PasswordField({
    super.key,
    required this.passwordController,
    this.validator,
  });

  @override
  State<PasswordField> createState() => _PasswordFieldState();
}

class _PasswordFieldState extends State<PasswordField> {
  bool isObscured = true;

  @override
  Widget build(BuildContext context) {
    return CustomField(
      validator: widget.validator,
      label: 'Kata Sandi',
      controller: widget.passwordController,
      isObscured: isObscured,
      prefixIcon: SvgPicture.asset(IconConst.lock),
      suffixIcon: GestureDetector(
        onTap: () => setState(() {
          isObscured = !isObscured;
        }),
        child: SvgPicture.asset(
          isObscured ? IconConst.visibilityOff : IconConst.visibilityOn,
        ),
      ),
    );
  }
}
