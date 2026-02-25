// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:flutter/material.dart';

class CustomField extends StatelessWidget {
  final String label;
  final TextEditingController controller;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final bool isObscured;
  final String? Function(String?)? validator;

  const CustomField({
    super.key,
    required this.label,
    required this.controller,
    this.prefixIcon,
    this.suffixIcon,
    this.isObscured = false,
    this.validator,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      validator: validator,
      decoration: InputDecoration(
        label: Text(label),
        prefixIcon: prefixIcon != null
            ? Padding(
                padding: const .only(left: 16, right: 8),
                child: prefixIcon,
              )
            : null,
        suffixIcon: suffixIcon != null
            ? Padding(
                padding: const .only(right: 16, left: 8),
                child: suffixIcon,
              )
            : null,
      ),
      obscureText: isObscured,
    );
  }
}
