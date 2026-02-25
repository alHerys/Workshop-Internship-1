// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:flutter/material.dart';
import '../../../core/theme/app_text.dart';

class AuthButton extends StatefulWidget {
  final TextEditingController? namaController;
  final TextEditingController emailController;
  final TextEditingController passwordController;
  final TextEditingController? confirmPasswordController;
  final VoidCallback onPressed;

  const AuthButton({
    super.key,
    required this.formKey,
    required this.emailController,
    required this.passwordController,
    this.namaController,
    this.confirmPasswordController,
    required this.onPressed,
  });

  final GlobalKey<FormState> formKey;

  @override
  State<AuthButton> createState() => _AuthButtonState();
}

class _AuthButtonState extends State<AuthButton> {
  bool isFieldsFilled = false;

  void _updateFieldsFilled() {
    final filled =
        widget.emailController.text.isNotEmpty &&
        widget.passwordController.text.isNotEmpty &&
        (widget.namaController == null ||
            widget.namaController!.text.isNotEmpty) &&
        (widget.confirmPasswordController == null ||
            widget.confirmPasswordController!.text.isNotEmpty);
    setState(() {
      isFieldsFilled = filled;
    });
  }

  @override
  void initState() {
    super.initState();
    widget.namaController?.addListener(_updateFieldsFilled);
    widget.emailController.addListener(_updateFieldsFilled);
    widget.passwordController.addListener(_updateFieldsFilled);
    widget.confirmPasswordController?.addListener(_updateFieldsFilled);
  }

  @override
  void dispose() {
    widget.namaController?.removeListener(_updateFieldsFilled);
    widget.emailController.removeListener(_updateFieldsFilled);
    widget.passwordController.removeListener(_updateFieldsFilled);
    widget.confirmPasswordController?.removeListener(_updateFieldsFilled);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: isFieldsFilled ? widget.onPressed : null,
      child: Text('Daftar', style: AppText.semiBold20),
    );
  }
}
