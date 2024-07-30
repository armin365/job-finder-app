import 'package:flutter/material.dart';
import 'package:job_finder_app/screens/auth/login.dart';
import 'package:job_finder_app/screens/auth/signup.dart';

class WelcomeScreen extends StatefulWidget {
  static const pagename = '/';
  const WelcomeScreen({super.key});

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned.fill(
            child: Image.asset(
              "assets/pic1.jpeg",
              fit: BoxFit.cover,
            ),
          ),
          Positioned.fill(
              child: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(colors: [
                Colors.black.withOpacity(0),
                Colors.black.withOpacity(0.3),
              ], begin: Alignment.topCenter, end: Alignment.bottomCenter),
            ),
          )),
          const Positioned(
              top: 135,
              left: 35,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Text(
                        "Find",
                        style: TextStyle(
                            fontSize: 48,
                            color: Colors.white,
                            fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Text("cool",
                          style: TextStyle(
                              fontSize: 48,
                              color: Colors.cyan,
                              fontWeight: FontWeight.bold)),
                    ],
                  ),
                  Text("Jobs",
                      style: TextStyle(
                          fontSize: 48,
                          color: Colors.white,
                          fontWeight: FontWeight.bold)),
                ],
              )),
          Positioned(
            bottom: 50,
            left: 10,
            right: 10,
            child: Column(
              children: [
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.pushNamed(context, SignUpScreen.pagename);
                    },
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.deepPurpleAccent,
                        foregroundColor: Colors.white,
                        shape: const StadiumBorder()),
                    child: const Padding(
                      padding: EdgeInsets.symmetric(vertical: 12),
                      child: Text(
                        "Sign Up",
                        style: TextStyle(fontSize: 19),
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 5,
                ),
                Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        "Already have an account?",
                        style: TextStyle(color: Colors.white, fontSize: 17),
                      ),
                      const SizedBox(
                        width: 1,
                      ),
                      TextButton(
                        onPressed: () {
                          Navigator.pushNamed(context, LoginScreen.pagename);
                        },
                        child: const Text(
                          "Log In",
                          style: TextStyle(
                              color: Colors.deepPurpleAccent, fontSize: 17),
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
