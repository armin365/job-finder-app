import 'package:flutter/material.dart';
import 'package:job_finder_app/themes/themes.dart';

class AdminUsers extends StatefulWidget {
  const AdminUsers({super.key});
  static const pagename = '/adminusers';

  @override
  State<AdminUsers> createState() => _AdminUsersState();
}

class _AdminUsersState extends State<AdminUsers> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        elevation: 5,
        title: const Text('Users'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  height: 90,
                  color: iconColor,
                  child: const ListTile(
                    contentPadding: EdgeInsets.zero,
                    leading: CircleAvatar(
                      radius: 26,
                      backgroundImage:
                          AssetImage(('assets/images/profile.jpg')),
                    ),
                    title: Text('Mohamed amiin'),
                    subtitle: Row(
                      children: [
                        Text('amiin@gmail.com'),
                        SizedBox(
                          width: 10,
                        ),
                        Text('•'),
                        SizedBox(
                          width: 10,
                        ),
                        Text('Job Seeker'),
                      ],
                    ),
                    trailing: Icon(Icons.more_vert),
                  ),
                ),
                SizedBox(
                  height: size.height * 0.01,
                ),
                Container(
                  height: 90,
                  color: iconColor,
                  child: const ListTile(
                    contentPadding: EdgeInsets.zero,
                    leading: CircleAvatar(
                      radius: 26,
                      backgroundImage:
                          AssetImage(('assets/images/profile.jpg')),
                    ),
                    title: Text('Mohamed amiin'),
                    subtitle: Row(
                      children: [
                        Text('amiin@gmail.com'),
                        SizedBox(
                          width: 10,
                        ),
                        Text('•'),
                        SizedBox(
                          width: 10,
                        ),
                        Text('Job Seeker'),
                      ],
                    ),
                    trailing: Icon(Icons.more_vert),
                  ),
                ),
                SizedBox(
                  height: size.height * 0.01,
                ),
                Container(
                  height: 90,
                  color: iconColor,
                  child: const ListTile(
                    contentPadding: EdgeInsets.zero,
                    leading: CircleAvatar(
                      radius: 26,
                      backgroundImage:
                          AssetImage(('assets/images/profile.jpg')),
                    ),
                    title: Text('Mohamed amiin'),
                    subtitle: Row(
                      children: [
                        Text('amiin@gmail.com'),
                        SizedBox(
                          width: 10,
                        ),
                        Text('•'),
                        SizedBox(
                          width: 10,
                        ),
                        Text('Job Seeker'),
                      ],
                    ),
                    trailing: Icon(Icons.more_vert),
                  ),
                ),
                SizedBox(
                  height: size.height * 0.01,
                ),
                Container(
                  height: 90,
                  color: iconColor,
                  child: const ListTile(
                    contentPadding: EdgeInsets.zero,
                    leading: CircleAvatar(
                      radius: 26,
                      backgroundImage:
                          AssetImage(('assets/images/profile.jpg')),
                    ),
                    title: Text('jama\'a farax'),
                    subtitle: Row(
                      children: [
                        Text('jama@gmail.com'),
                        SizedBox(
                          width: 10,
                        ),
                        Text('•'),
                        SizedBox(
                          width: 10,
                        ),
                        Text('Job Seeker'),
                      ],
                    ),
                    trailing: Icon(Icons.more_vert),
                  ),
                ),
                SizedBox(
                  height: size.height * 0.01,
                ),
                Container(
                  height: 90,
                  color: iconColor,
                  child: const ListTile(
                    contentPadding: EdgeInsets.zero,
                    leading: CircleAvatar(
                      radius: 26,
                      backgroundImage:
                          AssetImage(('assets/images/profile.jpg')),
                    ),
                    title: Text('adan cabdi'),
                    subtitle: Row(
                      children: [
                        Text('adan@gmail.com'),
                        Text('•'),
                        SizedBox(
                          width: 10,
                        ),
                        Text('•'),
                        SizedBox(
                          width: 10,
                        ),
                        Text('Job Seeker'),
                      ],
                    ),
                    trailing: Icon(Icons.more_vert),
                  ),
                ),
                SizedBox(
                  height: size.height * 0.01,
                ),
                Container(
                  height: 90,
                  color: iconColor,
                  child: const ListTile(
                    contentPadding: EdgeInsets.zero,
                    leading: CircleAvatar(
                      radius: 26,
                      backgroundImage:
                          AssetImage(('assets/images/hormuud.png')),
                    ),
                    title: Text('Hormuud'),
                    subtitle: Row(
                      children: [
                        Text('test@gmail.com'),
                        SizedBox(
                          width: 10,
                        ),
                        Text('•'),
                        SizedBox(
                          width: 10,
                        ),
                        Text('Agent'),
                      ],
                    ),
                    trailing: Icon(Icons.more_vert),
                  ),
                ),
                SizedBox(
                  height: size.height * 0.01,
                ),
                Container(
                  height: 90,
                  color: iconColor,
                  child: const ListTile(
                    contentPadding: EdgeInsets.zero,
                    leading: CircleAvatar(
                      radius: 26,
                      backgroundImage: AssetImage(('assets/images/soft.png')),
                    ),
                    title: Text('Software Academy'),
                    subtitle: Row(
                      children: [
                        Text('soft@gmail.com'),
                        SizedBox(
                          width: 10,
                        ),
                        Text('•'),
                        SizedBox(
                          width: 10,
                        ),
                        Text('Agent'),
                      ],
                    ),
                    trailing: Icon(Icons.more_vert),
                  ),
                ),
                SizedBox(
                  height: size.height * 0.01,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
