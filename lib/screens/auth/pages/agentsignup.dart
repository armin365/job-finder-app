import 'package:flutter/material.dart';
import 'package:job_finder_app/common/textfields.dart';
import 'package:job_finder_app/screens/auth/pages/login.dart';
import 'package:job_finder_app/screens/users/services/authservices.dart';

class AgentSignUpScreen extends StatefulWidget {
  static const pagename = '/companysignup';
  const AgentSignUpScreen({super.key});

  @override
  State<AgentSignUpScreen> createState() => _AgentSignUpScreenState();
}

class _AgentSignUpScreenState extends State<AgentSignUpScreen> {
  TextEditingController companynamecontroller = TextEditingController();
  TextEditingController emailcontroller = TextEditingController();
  TextEditingController phonecontroller = TextEditingController();
  TextEditingController passwordcontroller = TextEditingController();
final Authservices authservices = Authservices();

   void registerCompany() {
    authservices.registerUser(
        context: context,
        name: companynamecontroller.text,
        email: emailcontroller.text,
        phone: phonecontroller.text,
        password: passwordcontroller.text,
        role: 'company');
  }

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
                  const Center(
                    child: Text(
                      "Sign up as Company",
                      style: TextStyle(fontSize: 40),
                    ),
                  ),
                  SizedBox(
                    height: size.height * 0.02,
                  ),
                  CustomTextFeild(
                    controller: companynamecontroller,
                    hintText: 'enter Company name',
                    textInputType: TextInputType.name,
                    myicon: Icons.factory,
                  ),
                  SizedBox(
                    height: size.height * 0.02,
                  ),
                  CustomTextFeild(
                    controller: emailcontroller,
                    hintText: 'enter your email',
                    textInputType: TextInputType.name,
                    myicon: Icons.email,
                  ),
                  SizedBox(
                    height: size.height * 0.02,
                  ),
                  CustomTextFeild(
                    controller: phonecontroller,
                    hintText: 'enter your phone',
                    textInputType: TextInputType.name,
                    myicon: Icons.call,
                  ),
                  SizedBox(
                    height: size.height * 0.02,
                  ),
                  CustomTextFeild(
                    controller: passwordcontroller,
                    hintText: 'enter your password',
                    textInputType: TextInputType.name,
                    myicon: Icons.lock,
                  ),
                  SizedBox(
                    height: size.height * 0.02,
                  ),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: registerCompany,
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
                  Center(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          "Already have an account?",
                          style: TextStyle(fontSize: 17),
                        ),
                        const SizedBox(
                          width: 1,
                        ),
                        TextButton(
                          onPressed: () {
                            Navigator.pushNamed(context, LoginScreen.pagename);
                          },
                          child: const Text(
                            "Login",
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
