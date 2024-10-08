import 'package:flutter/material.dart';
import 'package:job_finder_app/screens/admin/pages/categories.dart';
import 'package:job_finder_app/screens/admin/pages/companies.dart';
import 'package:job_finder_app/screens/admin/pages/dashbord.dart';
import 'package:job_finder_app/screens/admin/pages/jobslist.dart';
import 'package:job_finder_app/screens/admin/pages/subcategories.dart';
import 'package:job_finder_app/screens/admin/pages/users.dart';
import 'package:job_finder_app/screens/users/services/authservices.dart';
import 'package:job_finder_app/themes/themes.dart';

class NavigatorDrawer extends StatefulWidget {
  const NavigatorDrawer({super.key});

  @override
  State<NavigatorDrawer> createState() => _NavigatorDrawerState();
}

class _NavigatorDrawerState extends State<NavigatorDrawer> {
  @override
  Widget build(BuildContext context) {
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
                Navigator.pushNamed(context, AdminDashboard.pagename);
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
                Navigator.pushNamed(context, AdminJobsScreen.pagename);
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
                Navigator.pushNamed(context, AdminCategories.pagename);
              },
              contentPadding: EdgeInsets.zero,
              leading: const Icon(
                Icons.store,
                color: Colors.white,
              ),
              title: const Text(
                'Categories',
                style: TextStyle(color: Colors.white),
              ),
            ),
            SizedBox(
              height: size.height * 0.01,
            ),
            ListTile(
              onTap: () {
                Navigator.pushNamed(context, AdminSubCategories.pagename);
              },
              contentPadding: EdgeInsets.zero,
              leading: const Icon(
                Icons.category,
                color: Colors.white,
              ),
              title: const Text(
                'Sub Categories',
                style: TextStyle(color: Colors.white),
              ),
            ),
            SizedBox(
              height: size.height * 0.01,
            ),
            ListTile(
              onTap: () {
                Navigator.pushNamed(context, AdminUsers.pagename);
              },
              contentPadding: EdgeInsets.zero,
              leading: const Icon(
                Icons.group,
                color: Colors.white,
              ),
              title: const Text(
                'Users',
                style: TextStyle(color: Colors.white),
              ),
            ),
            SizedBox(
              height: size.height * 0.01,
            ),
            ListTile(
              onTap: () {
                Navigator.pushNamed(context, AdminCompanies.pagename);
              },
              contentPadding: EdgeInsets.zero,
              leading: const Icon(
                Icons.business,
                color: Colors.white,
              ),
              title: const Text(
                'Companies',
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
