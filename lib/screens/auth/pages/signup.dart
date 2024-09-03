import 'package:flutter/material.dart';
import 'package:job_finder_app/screens/auth/pages/agentsignup.dart';
import 'package:job_finder_app/screens/auth/pages/usersignup.dart';
import 'package:job_finder_app/themes/themes.dart';

class SignUpScreen extends StatefulWidget {
  static const pagename = '/signup';
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  @override
  void initState() {
    _tabController = TabController(length: 2, vsync: this);
    _tabController.addListener(() {
      setState(() {});
    });
    super.initState();
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 2,
        child: Scaffold(
          body: SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                children: [
                  const SizedBox(
                    height: 100,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: TabBar(
                        controller: _tabController,
                        indicator: const BoxDecoration(
                          color: Colors.transparent,
                        ),
                        tabs: [
                          Tab(
                            child: Container(
                                width: 200,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(8),
                                    border: Border.all(
                                      width: 1,
                                      color: _tabController.index == 0
                                          ? primaryColor
                                          : Colors.black,
                                    )),
                                child: const Center(
                                    child: Padding(
                                  padding: EdgeInsets.all(8.0),
                                  child: Text('User'),
                                ))),
                          ),
                          Tab(
                            child: Container(
                                width: 200,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(8),
                                    border: Border.all(
                                      width: 1,
                                      color: _tabController.index == 1
                                          ? primaryColor
                                          : Colors.black,
                                    )),
                                child: const Center(
                                    child: Padding(
                                  padding: EdgeInsets.all(8.0),
                                  child: Text('Company'),
                                ))),
                          ),
                        ]),
                  ),
                  Expanded(
                    child: TabBarView(
                        controller: _tabController,
                        children: const [UserSignUpScreen(), AgentSignUpScreen()]),
                  ),
                ],
              ),
            ),
          ),
        ));
  }
}
