import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../auth/cubit/auth_cubit.dart';
import '../../auth/pages/start_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            Text('This is Home Page'),
            BlocListener<AuthCubit, AuthState>(
              listener: (context, state) {
                if (state is AuthInitial) {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => StartPage()),
                  );
                }
              },
              child: ElevatedButton(
                onPressed: () async {
                  await context.read<AuthCubit>().logout();
                },
                child: Text('Logout'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
