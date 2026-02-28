import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../core/theme/app_pallete.dart';
import '../../core/theme/app_text.dart';
import '../auth/cubit/auth_cubit.dart';
import '../auth/pages/start_page.dart';
import '../auth/widgets/auth_background.dart';
import '../auth/widgets/auth_button.dart';
import '../auth/widgets/background2.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  final nameController = TextEditingController();
  final emailController = TextEditingController();

  @override
  void initState() {
    super.initState();
    final state = context.read<AuthCubit>().state;
    if (state is AuthSuccess) {
      nameController.text = state.user.nama;
      emailController.text = state.user.email;
    }
  }

  @override
  void dispose() {
    nameController.dispose();
    emailController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppPallete.primaryLightHover,
      body: Stack(
        children: [
          Padding(
            padding: EdgeInsets.only(top: MediaQuery.heightOf(context) * 0.2),
            child: AuthBackground(
              background1: Background2(),
              background1Color: AppPallete.neutral100,
            ),
          ),
          SafeArea(
            child: Padding(
              padding: const .all(20),
              child: Column(
                crossAxisAlignment: .stretch,
                spacing: 28,
                children: [
                  Text(
                    'Akun dan Profil',
                    textAlign: .center,
                    style: AppText.semiBold22,
                  ),
                  const SizedBox(),
                  Center(
                    child: Stack(
                      alignment: .bottomRight,
                      children: [
                        CircleAvatar(
                          radius: 60,
                          child: Icon(Icons.person, size: 90),
                        ),
                        CircleAvatar(
                          backgroundColor: AppPallete.primaryNormal,
                          child: Icon(Icons.edit_square),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(),

                  TextField(
                    controller: nameController,
                    decoration: InputDecoration(label: Text('Nama Lengkap')),
                  ),
                  TextField(
                    controller: emailController,
                    decoration: InputDecoration(label: Text('Email')),
                  ),

                  ElevatedButton(
                    onPressed: () {
                      showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return AlertDialog(
                            title: Text(
                              'Yakin ingin Log out?',
                              style: AppText.semiBold18,
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
                                    'Batal',
                                    style: AppText.semiBold14,
                                  ),
                                ),
                              ),
                              BlocListener<AuthCubit, AuthState>(
                                listener: (context, state) {
                                  if (state is AuthInitial) {
                                    Navigator.pushReplacement(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => StartPage(),
                                      ),
                                    );
                                  }
                                },
                                child: ElevatedButton(
                                  onPressed: () async {
                                    await context.read<AuthCubit>().logout();
                                  },
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: AppPallete.errorNormal,
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(
                                      horizontal: 20,
                                    ),

                                    child: Text(
                                      'Iya',
                                      style: AppText.semiBold14,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          );
                        },
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppPallete.errorNormal,
                    ),
                    child: Text('Log out', style: AppText.semiBold16),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
