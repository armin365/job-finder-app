import 'package:flutter/material.dart';
import 'package:job_finder_app/screens/auth/login.dart';
import 'package:job_finder_app/screens/users/pages/changepassword.dart';
import 'package:job_finder_app/screens/users/pages/update_profile.dart';
import 'package:job_finder_app/screens/users/pages/upliedjobs.dart';
import 'package:job_finder_app/themes/themes.dart';
import 'package:job_finder_app/widgets/icon_widget.dart';

class ProfileScreen extends StatefulWidget {
  static const pagename = '/settings';
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: Icon(
                Icons.arrow_back_ios,
              ),
            ),
            SizedBox(
              height: size.height * 0.01,
            ),
            const Center(
              child: Text(
                'Profile',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
              ),
            ),
            SizedBox(
              height: size.height * 0.02,
            ),
            Center(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    padding: const EdgeInsets.all(5),
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      color: blue1Color,
                    ),
                    child: const CircleAvatar(
                      radius: 45,
                      backgroundImage:
                          AssetImage(('assets/images/profile.jpg')),
                    ),
                  ),
                  SizedBox(
                    height: size.height * 0.03,
                  ),
                  const Text(
                    "Amiin",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 19),
                  ),
                  const Text(
                    "612890802",
                    style: TextStyle(fontSize: 12),
                  ),
                  const Text("amiin@gmail.com", style: TextStyle(fontSize: 12))
                ],
              ),
            ),
            SizedBox(
              height: size.height * 0.05,
            ),
            ListTile(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const Updateprofile()));
              },
              leading: const IconWidget(
                color: blue1Color,
                icon: Icons.person_pin,
                icolor: iconColor,
              ),
              title: const Text('Update Profile'),
              trailing: const Icon(
                Icons.arrow_forward_ios,
                color: blue1Color,
              ),
            ),
            SizedBox(
              height: size.height * 0.01,
            ),
            ListTile(
              onTap: () {
                Navigator.pushNamed(context, UpliedjobsScreen.pagename);
              },
              leading: const IconWidget(
                color: blue1Color,
                icon: Icons.work_history,
                icolor: iconColor,
              ),
              title: const Text('Uplied Jobs'),
              trailing: const Icon(Icons.arrow_forward_ios, color: blue1Color),
            ),
            SizedBox(
              height: size.height * 0.01,
            ),
            ListTile(
              onTap: () {
                Navigator.pushNamed(context, ChangepasswordScreen.pagename);
              },
              leading: const IconWidget(
                color: blue1Color,
                icon: Icons.settings,
                icolor: iconColor,
              ),
              title: const Text('Change Password'),
              trailing: const Icon(Icons.arrow_forward_ios, color: blue1Color),
            ),
            SizedBox(
              height: size.height * 0.01,
            ),
            const ListTile(
              leading: IconWidget(
                color: blue1Color,
                icon: Icons.privacy_tip,
                icolor: iconColor,
              ),
              title: Text('Privacy Policy'),
              trailing: Icon(Icons.arrow_forward_ios, color: blue1Color),
            ),
            SizedBox(
              height: size.height * 0.01,
            ),
            ListTile(
              onTap: () {
                Navigator.pushNamed(context, LoginScreen.pagename);
              },
              leading: const IconWidget(
                color: blue1Color,
                icon: Icons.logout,
                icolor: iconColor,
              ),
              title: const Text('Log Out'),
            ),
          ],
        ),
      ),
    );
  }
}
