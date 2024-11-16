import 'package:flutter/material.dart';
import 'package:job_finder_app/providers/user_provider.dart';
import 'package:job_finder_app/screens/users/pages/changepassword.dart';
import 'package:job_finder_app/screens/users/pages/update_profile.dart';
import 'package:job_finder_app/screens/users/pages/upliedjobs.dart';
import 'package:job_finder_app/screens/users/pages/view_profile.dart';
import 'package:job_finder_app/screens/users/services/authservices.dart';
import 'package:job_finder_app/themes/themes.dart';
import 'package:job_finder_app/widgets/icon_widget.dart';
import 'package:provider/provider.dart';

class ProfileScreen extends StatefulWidget {
  static const pagename = '/settings';
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    var user = Provider.of<Userprovider>(
      context,
    ).users;

    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: size.height * 0.03,
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
                      child: CircleAvatar(
                        radius: 45,
                        backgroundImage: (user.image != null &&
                                user.image!.isNotEmpty &&
                                Uri.tryParse(user.image!)?.hasAbsolutePath ==
                                    true)
                            ? NetworkImage(user.image!)
                            : const AssetImage('assets/images/profile.jpg')
                                as ImageProvider,
                      ),
                    ),
                    SizedBox(
                      height: size.height * 0.03,
                    ),
                    Text(
                      user.name,
                      style: const TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 19),
                    ),
                    Text(
                      user.phone.toString(),
                      style: const TextStyle(fontSize: 12),
                    ),
                    Text(user.email, style: const TextStyle(fontSize: 12))
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
                          builder: (context) => const ViewProfileScreen()));
                },
                leading: const IconWidget(
                  color: blue1Color,
                  icon: Icons.person_pin,
                  icolor: iconColor,
                ),
                title: const Text('View Profile'),
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
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => Updateprofile(
                                user: user,
                              )));
                },
                leading: const IconWidget(
                  color: blue1Color,
                  icon: Icons.person_pin,
                  icolor: iconColor,
                ),
                title: const Text('Apdate Profile'),
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
                title: const Text('Aplied Jobs'),
                trailing:
                    const Icon(Icons.arrow_forward_ios, color: blue1Color),
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
                trailing:
                    const Icon(Icons.arrow_forward_ios, color: blue1Color),
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
                onTap: () => showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        title: const Text('Log Out'),
                        content: const Text('Are you Sure To Logout'),
                        actions: [
                          TextButton(
                            onPressed: () => Navigator.pop(context),
                            child: const Text('NO'),
                          ),
                          TextButton(
                              onPressed: () {
                                Authservices().logOut(context);
                              },
                              child: const Text('YES'))
                        ],
                      );
                    }),
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
      ),
    );
  }
}

class AuthServices {}
