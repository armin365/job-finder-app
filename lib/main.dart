import 'package:flutter/material.dart';
import 'package:job_finder_app/providers/company_provider.dart';
import 'package:job_finder_app/providers/user_provider.dart';
import 'package:job_finder_app/routes/pages.dart';
import 'package:job_finder_app/screens/splash/splash_screen.dart';
import 'package:job_finder_app/screens/users/services/authservices.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (context) => Userprovider()),
      ChangeNotifierProvider(
        create: (context) => CompanyProvider(),
      ),
    ],
    child: const MyApp(),
  ));
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
      home: const MyHome(),
      onGenerateRoute: (settings) => generate(settings),
    );
  }
}

class MyHome extends StatefulWidget {
  const MyHome({super.key});

  @override
  State<MyHome> createState() => _MyHomeState();
}

class _MyHomeState extends State<MyHome> {
  Authservices authServices = Authservices();
  @override
  void initState() {
    authServices.getUserById(context);
    super.initState();
  }

 

  @override
  Widget build(BuildContext context) {
   
    return const SplashScreen();
  }
}
