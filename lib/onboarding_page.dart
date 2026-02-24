import 'package:flutter/material.dart';

class OnboardingPage extends StatelessWidget {
  const OnboardingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Center(
          child: Column(
            mainAxisAlignment: .center,
            crossAxisAlignment: .stretch,
            spacing: 20,
            children: [
              Column(
                children: [
                  Image.asset('assets/Group 334.png', width: 148, height: 167),
                  Text(
                    'Mulai',
                    textAlign: .center,
                    style: TextStyle(
                      fontWeight: .w600,
                      color: Colors.blue,
                      fontSize: 32,
                    ),
                  ),
                  Text(
                    'Mulailah perjalan Malang-mu hari ini \n bersama Malang Venture',
                    textAlign: .center,
                    style: TextStyle(fontSize: 16, color: Colors.blue),
                  ),
                ],
              ),

              SizedBox(height: 215,),

              Column(
                crossAxisAlignment: .stretch,
                spacing: 16,
                children: [
                  ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blue,
                    ),
                    child: Text(
                      'Daftar',
                      style: TextStyle(color: Colors.white, fontWeight: .w600),
                    ),
                  ),

                  ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.lightBlue.withValues(alpha: 0.4),
                    ),
                    child: Text('Masuk', style: TextStyle(color: Colors.white)),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
