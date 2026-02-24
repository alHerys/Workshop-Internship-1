import 'package:flutter/material.dart';
import 'package:workshop_intership/onboarding_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(colorScheme: .fromSeed(seedColor: const Color.fromARGB(255, 14, 5, 30))),
      home: OnboardingPage()
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.lightBlue,
        centerTitle: true,
        leading: Icon(Icons.abc),
        actions: [
          Icon(Icons.ac_unit),
          Icon(Icons.ac_unit)
        ],

        title: Text(widget.title),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Center(
          child: Column(
            spacing: 20,
            children: [

              Text(
                'Login Page', 
                style: TextStyle(
                  fontSize: 50,
                  color: Colors.blue
                ),
              ),

              TextField(
                decoration: InputDecoration(
                  label: Text('Email'),
                  border: OutlineInputBorder()
                ),
              ),
              TextField(
                decoration: InputDecoration(
                  label: Text('Password'),
                  border: OutlineInputBorder()
                ),
              ),
              TextField(
                decoration: InputDecoration(
                  label: Text('Name'),
                  border: OutlineInputBorder()
                ),
              ),

              ElevatedButton(onPressed: () {}, child: Text('Login')),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.accessible_forward_sharp),
      ),
    );
  }
}
