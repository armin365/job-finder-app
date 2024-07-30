import 'package:flutter/material.dart';
import 'package:job_finder_app/themes/themes.dart';

class ChangepasswordScreen extends StatefulWidget {
  const ChangepasswordScreen({super.key});
  static const pagename = '/changepassword';
  @override
  State<ChangepasswordScreen> createState() => _ChangepasswordScreenState();
}

class _ChangepasswordScreenState extends State<ChangepasswordScreen> {
  bool _showpassowrd = true;

  void _togglePasswordVisibility() {
    setState(() {
      _showpassowrd = !_showpassowrd;
    });
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 30),
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
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              const Expanded(
                flex: 2,
                child: Center(
                  child: Text(
                    "Chage Password",
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
                        obscureText: _showpassowrd,
                        decoration: InputDecoration(
                          labelText: 'Current Password',
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
                      )
                    ],
                  ))
            ],
          ),
        ),
      ),
    );
  }
}
