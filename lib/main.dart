import 'package:flutter/material.dart';
import 'package:job_finder_app/routes/pages.dart';
import 'package:job_finder_app/screens/welcome/welcome.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      
      debugShowCheckedModeBanner: false,
      title: 'Job Finder app',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurpleAccent),
        useMaterial3: true,
      ),
      home: const WelcomeScreen(),
      onGenerateRoute: (settings) => generate(settings),
    );
  }
}
