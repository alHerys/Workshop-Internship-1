import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';

import '../../core/theme/app_pallete.dart';
import '../../core/theme/app_text.dart';
import '../../data/models/user_model.dart';
import '../auth/cubit/auth_cubit.dart';
import '../auth/pages/start_page.dart';
import '../auth/widgets/auth_background.dart';
import '../auth/widgets/background2.dart';
import 'cubit/profile_cubit.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  late UserModel user;
  String? _currentPhotoUrl;

  @override
  void initState() {
    super.initState();
    final state = context.read<AuthCubit>().state;
    if (state is AuthSuccess) {
      user = state.user;
      nameController.text = state.user.nama;
      emailController.text = state.user.email;
      _currentPhotoUrl = state.user.fotoProfil;
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
      body: BlocListener<ProfileCubit, ProfileState>(
        listener: (context, state) {
          if (state is ProfileLoading) {
            ScaffoldMessenger.of(
              context,
            ).showSnackBar(const SnackBar(content: Text('Mengupload foto...')));
          } else if (state is ProfilePhotoUpdated) {
            setState(() {
              _currentPhotoUrl = state.photoUrl;
            });
            ScaffoldMessenger.of(context)
              ..hideCurrentSnackBar()
              ..showSnackBar(
                const SnackBar(content: Text('Foto profil berhasil diubah!')),
              );
          } else if (state is ProfileError) {
            ScaffoldMessenger.of(context)
              ..hideCurrentSnackBar()
              ..showSnackBar(
                SnackBar(content: Text('Gagal: ${state.message}')),
              );
          }
        },
        child: Stack(
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
                padding: const EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  spacing: 28,
                  children: [
                    Text(
                      'Akun dan Profil',
                      textAlign: TextAlign.center,
                      style: AppText.semiBold22,
                    ),
                    const SizedBox(),
                    Center(
                      child: Stack(
                        alignment: Alignment.bottomRight,
                        children: [
                          CircleAvatar(
                            radius: 60,
                            backgroundImage: _currentPhotoUrl != null
                                ? NetworkImage(_currentPhotoUrl!)
                                : null,
                            child: _currentPhotoUrl == null
                                ? const Icon(Icons.person, size: 90)
                                : null,
                          ),
                          GestureDetector(
                            onTap: () => _showPhotoDialog(context),
                            child: const CircleAvatar(
                              backgroundColor: AppPallete.primaryNormal,
                              child: Icon(Icons.edit_square),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(),
                    TextField(
                      controller: nameController,
                      readOnly: true,
                      decoration: InputDecoration(label: Text('Nama Lengkap')),
                    ),
                    TextField(
                      controller: emailController,
                      readOnly: true,
                      decoration: InputDecoration(label: Text('Email')),
                    ),

                    ElevatedButton(
                      onPressed: () {
                        showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return AlertDialog(
                              title: const Text(
                                'Yakin ingin Log out?',
                                style: AppText.semiBold18,
                                textAlign: TextAlign.center,
                              ),
                              actionsAlignment: MainAxisAlignment.center,
                              contentPadding: EdgeInsets.all(20),
                              insetPadding: EdgeInsets.all(20),
                              actions: [
                                ElevatedButton(
                                  onPressed: () {
                                    Navigator.pop(context);
                                  },
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(
                                      horizontal: 20,
                                    ),
                                    child: const Text(
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
      ),
    );
  }

  void _showPhotoDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext dialogContext) {
        return AlertDialog(
          title: Row(
            spacing: 10,
            children: [
              Icon(Icons.add_a_photo_outlined),
              Text(
                'Ubah Foto Profil',
                style: AppText.medium16,
                textAlign: TextAlign.left,
              ),
            ],
          ),
          actions: [
            ListTile(
              title: Text('Ambil foto baru'),
              contentPadding: EdgeInsets.symmetric(horizontal: 10),
              trailing: Icon(Icons.photo_camera_outlined),
              onTap: () {
                Navigator.pop(dialogContext);
                context.read<ProfileCubit>().updateProfilePhoto(
                  source: ImageSource.camera,
                );
              },
            ),
            ListTile(
              title: Text('Pilih dari galeri'),
              contentPadding: EdgeInsets.symmetric(horizontal: 10),
              trailing: Icon(Icons.image_outlined),
              onTap: () {
                Navigator.pop(dialogContext);
                context.read<ProfileCubit>().updateProfilePhoto(
                  source: ImageSource.gallery,
                );
              },
            ),
          ],
          contentPadding: EdgeInsets.all(20),
          insetPadding: EdgeInsets.all(20),
        );
      },
    );
  }
}
