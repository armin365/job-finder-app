import 'package:flutter/material.dart';
import 'package:job_finder_app/screens/users/pages/favirote.dart';
import 'package:job_finder_app/screens/users/pages/job.dart';
import 'package:job_finder_app/screens/users/pages/notification.dart';
import 'package:job_finder_app/screens/users/pages/profile.dart';

class HomeScreen extends StatefulWidget {
  static const pagename = '/home';
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Widget> pageslist = [
    const JobScreen(),
    const FaviroteScreen(),
    const NotificationScreen(),
    const ProfileScreen(),
  ];

  int _selectedPage = 0;

  void update(int index) {
    setState(() {
      _selectedPage = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pageslist[_selectedPage],
      bottomNavigationBar: BottomNavigationBar(
          currentIndex: _selectedPage,
          selectedItemColor: Colors.deepPurpleAccent,
          type: BottomNavigationBarType.fixed,
          onTap: update,
          items: const [
            BottomNavigationBarItem(
                icon: Icon(Icons.business_center), label: 'Jobs'),
            BottomNavigationBarItem(
                icon: Icon(Icons.favorite_outline), label: 'favroit'),
            BottomNavigationBarItem(
                icon: Icon(Icons.notifications_active), label: 'Notifications'),
            BottomNavigationBarItem(
                icon: Icon(Icons.person), label: 'profile'),
          ]),
    );
  }
}
