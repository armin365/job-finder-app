import 'package:flutter/material.dart';
import 'package:job_finder_app/common/textfields.dart';
// import 'package:job_finder_app/screens/admin/pages/dashbord.dart';
import 'package:job_finder_app/screens/auth/signup.dart';
import 'package:job_finder_app/screens/users/pages/home.dart';

class LoginScreen extends StatefulWidget {
  static const pagename = '/login';
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            margin: EdgeInsets.only(top: size.height * 0.1),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "Login to your",
                    style: TextStyle(fontSize: 40),
                  ),
                  const Text(
                    "account",
                    style: TextStyle(fontSize: 40),
                  ),
                  SizedBox(
                    height: size.height * 0.02,
                  ),
                  CustomTextFeild(
                    controller: emailController,
                    hintText: 'enter your email',
                    textInputType: TextInputType.name,
                    myicon: Icons.email,
                  ),
                  SizedBox(
                    height: size.height * 0.02,
                  ),
                  CustomTextFeild(
                    controller: passwordController,
                    hintText: '.........',
                    textInputType: TextInputType.name,
                    myicon: Icons.lock,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          IconButton(
                              onPressed: () {},
                              icon: const Icon(Icons.check_box_outline_blank)),
                          const Text("remember me"),
                        ],
                      ),
                      TextButton(
                        onPressed: () {},
                        child: const Text(
                          "Forgot password?",
                          style: TextStyle(color: Colors.deepPurpleAccent),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: size.height * 0.02,
                  ),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.pushNamed(context, HomeScreen.pagename);
                      },
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.deepPurpleAccent,
                          foregroundColor: Colors.white,
                          shape: const StadiumBorder()),
                      child: const Padding(
                        padding: EdgeInsets.symmetric(vertical: 12),
                        child: Text(
                          "Log In",
                          style: TextStyle(fontSize: 19),
                        ),
                      ),
                    ),
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
                            Navigator.pushNamed(context, SignUpScreen.pagename);
                          },
                          child: const Text(
                            "Sign Up",
                            style: TextStyle(
                                color: Colors.deepPurpleAccent, fontSize: 17),
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
