import 'package:flutter/material.dart';
import 'package:job_finder_app/screens/auth/pages/login.dart';
import 'package:job_finder_app/screens/auth/pages/signup.dart';
import 'package:job_finder_app/screens/forgotpassword/pages/verification.dart';
import 'package:job_finder_app/themes/themes.dart';

class ForgotPassword extends StatefulWidget {
  const ForgotPassword({super.key});
  static const pagename = '/forgot_password_page';
  @override
  State<ForgotPassword> createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {
  TextEditingController emailController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              const Expanded(
                flex: 2,
                child: Center(
                  child: Text(
                    "Forgot Password",
                    style: TextStyle(fontSize: 40),
                  ),
                ),
              ),
              SizedBox(
                height: size.height * 0.01,
              ),
              Expanded(
                  flex: 5,
                  child: Column(
                    children: [
                      const Text(
                        "Enter Your Email Address",
                        style: TextStyle(fontSize: 21),
                      ),
                      SizedBox(
                        height: size.height * 0.02,
                      ),
                      TextField(
                        controller: emailController,
                        decoration: InputDecoration(
                          labelText: 'Example@gmail.com',
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8),
                            borderSide: const BorderSide(color: primaryColor),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8),
                            borderSide: const BorderSide(color: primaryColor),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: size.height * 0.01,
                      ),
                      TextButton(
                        onPressed: () {
                          Navigator.pushNamed(context, LoginScreen.pagename);
                        },
                        child: const Text(
                          "Back to Login",
                          style: TextStyle(
                              color: Colors.deepPurpleAccent, fontSize: 17),
                        ),
                      ),
                      SizedBox(
                        height: size.height * 0.02,
                      ),
                      SizedBox(
                        width: double.infinity,
                        child: ElevatedButton(
                          onPressed: () {
                            Navigator.pushNamed(
                                context, VerificationScreen.pagename);
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: primaryColor,
                            foregroundColor: iconColor,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30),
                            ),
                          ),
                          child: const Padding(
                            padding: EdgeInsets.symmetric(vertical: 18),
                            child: Text('Send'),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: size.height * 0.01,
                      ),
                      Center(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text(
                              "Don't have an account?",
                              style: TextStyle(fontSize: 17),
                            ),
                            const SizedBox(
                              width: 1,
                            ),
                            TextButton(
                              onPressed: () {
                                Navigator.pushNamed(
                                    context, SignUpScreen.pagename);
                              },
                              child: const Text(
                                "Sign Up",
                                style: TextStyle(
                                    color: Colors.deepPurpleAccent,
                                    fontSize: 17),
                              ),
                            )
                          ],
                        ),
                      ),
                    ],
                  ))
            ],
          ),
        ),
      ),
    );
  }
}
