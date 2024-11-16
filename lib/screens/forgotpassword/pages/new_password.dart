import 'package:flutter/material.dart';

import 'package:job_finder_app/themes/themes.dart';

class NewPassword extends StatefulWidget {
  const NewPassword({super.key});
  static const pagename = '/newpassword';
  @override
  State<NewPassword> createState() => _NewPasswordState();
}

class _NewPasswordState extends State<NewPassword> {
  bool _showpassowrd = true;

  void _togglePasswordVisibility() {
    setState(() {
      _showpassowrd = !_showpassowrd;
    });
  }

  TextEditingController newpasswordController = TextEditingController();
  TextEditingController confirmpasswordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              const Expanded(
                flex: 2,
                child: Center(
                  child: Text(
                    "New Password",
                    style: TextStyle(fontSize: 40),
                  ),
                ),
              ),
              SizedBox(
                height: size.height * 0.03,
              ),
              Expanded(
                  flex: 5,
                  child: Column(
                    children: [
                      TextField(
                        controller: newpasswordController,
                        obscureText: _showpassowrd,
                        decoration: InputDecoration(
                          labelText: 'New Password',
                          suffixIcon: IconButton(
                            onPressed: () {
                              _togglePasswordVisibility();
                            },
                            icon: Icon(_showpassowrd
                                ? Icons.visibility
                                : Icons.visibility_off),
                          ),
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
                        height: size.height * 0.02,
                      ),
                      TextField(
                        controller: confirmpasswordController,
                        obscureText: _showpassowrd,
                        decoration: InputDecoration(
                          labelText: 'Confirm Password',
                          suffixIcon: IconButton(
                            onPressed: () {
                              _togglePasswordVisibility();
                            },
                            icon: Icon(_showpassowrd
                                ? Icons.visibility
                                : Icons.visibility_off),
                          ),
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
                        height: size.height * 0.02,
                      ),
                      SizedBox(
                        width: double.infinity,
                        child: ElevatedButton(
                          onPressed: () {},
                          style: ElevatedButton.styleFrom(
                            backgroundColor: primaryColor,
                            foregroundColor: iconColor,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30),
                            ),
                          ),
                          child: const Padding(
                            padding: EdgeInsets.symmetric(vertical: 18),
                            child: Text('Save'),
                          ),
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
