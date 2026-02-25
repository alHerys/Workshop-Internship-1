// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../../../core/const/icons_const.dart';
import 'custom_field.dart';

class PasswordField extends StatefulWidget {
  final TextEditingController controller;
  final String? Function(String?)? validator;
  final String label;

  const PasswordField({
    super.key,
    required this.controller,
    this.validator,
    required this.label,
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
      label: widget.label,
      controller: widget.controller,
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
