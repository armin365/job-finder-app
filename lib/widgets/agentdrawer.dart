import 'package:flutter/material.dart';
import 'package:job_finder_app/providers/company_provider.dart';
import 'package:job_finder_app/screens/agents/pages/agentapplicants.dart';
import 'package:job_finder_app/screens/agents/pages/agentjobs.dart';
import 'package:job_finder_app/screens/agents/pages/agentpostjob.dart';
import 'package:job_finder_app/screens/agents/pages/agentprofile.dart';

import 'package:job_finder_app/screens/agents/pages/agentshomepage.dart';
import 'package:job_finder_app/screens/users/services/authservices.dart';
import 'package:job_finder_app/themes/themes.dart';
import 'package:provider/provider.dart';

class AgentNavigatorDrawer extends StatefulWidget {
  const AgentNavigatorDrawer({super.key});

  @override
  State<AgentNavigatorDrawer> createState() => _AgentNavigatorDrawerState();
}

class _AgentNavigatorDrawerState extends State<AgentNavigatorDrawer> {
  @override
  Widget build(BuildContext context) {
    var company = Provider.of<CompanyProvider>(
      context,
    ).companies;
    final size = MediaQuery.of(context).size;
    return Drawer(
      child: Material(
        color: blue1Color,
        elevation: 5,
        child: ListView(
          padding: const EdgeInsets.symmetric(horizontal: 25),
          children: [
            SizedBox(
              height: size.height * 0.05,
            ),
            SizedBox(
              height: size.height * 0.05,
            ),
            ListTile(
              onTap: () {
                Navigator.pushNamed(context, Agentshomepage.pagename);
              },
              contentPadding: EdgeInsets.zero,
              leading: const Icon(
                Icons.home,
                color: Colors.white,
              ),
              title: const Text(
                'Home',
                style: TextStyle(color: Colors.white),
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
                        builder: (context) =>
                            AgentprofileScreen(company: company)));
              },
              contentPadding: EdgeInsets.zero,
              leading: const Icon(
                Icons.account_circle,
                color: Colors.white,
              ),
              title: const Text(
                'Profile',
                style: TextStyle(color: Colors.white),
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
                        builder: (context) => Agentpostjob(company: company)));
              },
              contentPadding: EdgeInsets.zero,
              leading: const Icon(
                Icons.add_business_outlined,
                color: Colors.white,
              ),
              title: const Text(
                'Post Job',
                style: TextStyle(color: Colors.white),
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
                        builder: (context) =>
                            AgentJobsScreen(company: company)));
              },
              contentPadding: EdgeInsets.zero,
              leading: const Icon(
                Icons.business_center,
                color: Colors.white,
              ),
              title: const Text(
                'Jobs',
                style: TextStyle(color: Colors.white),
              ),
            ),
            SizedBox(
              height: size.height * 0.01,
            ),
            ListTile(
              onTap: () {
                Navigator.pushNamed(context, AgentapplicantsPage.pagename);
              },
              contentPadding: EdgeInsets.zero,
              leading: const Icon(
                Icons.notification_important,
                color: Colors.white,
              ),
              title: const Text(
                'Applicants',
                style: TextStyle(color: Colors.white),
              ),
            ),
            SizedBox(
              height: size.height * 0.01,
            ),
            ListTile(
              onTap: () {
                // Navigator.pushNamed(context, AdminUsers.pagename);
              },
              contentPadding: EdgeInsets.zero,
              leading: const Icon(
                Icons.settings,
                color: Colors.white,
              ),
              title: const Text(
                'Settings',
                style: TextStyle(color: Colors.white),
              ),
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
              contentPadding: EdgeInsets.zero,
              leading: const Icon(
                Icons.logout,
                color: Colors.white,
              ),
              title: const Text(
                'Log out',
                style: TextStyle(color: Colors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
