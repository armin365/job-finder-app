import 'package:flutter/material.dart';
import 'package:job_finder_app/screens/forgotpassword/pages/new_password.dart';

class VerificationScreen extends StatelessWidget {
  const VerificationScreen({super.key});
  static const pagename = '/Verification_Screen';

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: size.height * 0.1),
              const Text(
                "Enter Verification Code",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 20),

              // Verification Code Inputs
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: List.generate(6, (index) {
                  return SizedBox(
                    width: 50,
                    child: TextField(
                      textAlign: TextAlign.center,
                      keyboardType: TextInputType.number,
                      maxLength: 1,
                      decoration: InputDecoration(
                        counterText: '',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30),
                          borderSide:
                              const BorderSide(color: Colors.deepPurpleAccent),
                        ),
                      ),
                    ),
                  );
                }),
              ),
              const SizedBox(height: 10),
              TextButton(
                onPressed: () {
                  // Add resend logic here
                },
                child: const Text(
                  "If you didn't receive a code, Resend",
                ),
              ),
              const SizedBox(height: 30),

              // Send Button
              Container(
                width: size.width * 0.9,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.pushNamed(context, NewPassword.pagename);
                  },
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(vertical: 15),
                    backgroundColor: Colors.deepPurpleAccent,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                  ),
                  child: const Text(
                    'Send',
                    style: TextStyle(fontSize: 16, color: Colors.white),
                  ),
                ),
              ),
              const SizedBox(height: 20),

              // Social Login Icons
              const Text('or'),

              const SizedBox(height: 30),

              // Sign Up Button
              Container(
                width: size.width * 0.9,
                child: OutlinedButton(
                  onPressed: () {
                    // Add Sign up logic
                  },
                  style: OutlinedButton.styleFrom(
                    side: const BorderSide(color: Colors.grey),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                    padding: const EdgeInsets.symmetric(vertical: 15),
                  ),
                  child: const Text(
                    'Sign up',
                    style: TextStyle(fontSize: 16),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
