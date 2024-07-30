import 'package:flutter/material.dart';
import 'package:job_finder_app/themes/themes.dart';

class AdminJobsScreen extends StatefulWidget {
  const AdminJobsScreen({super.key});
  static const pagename = '/adminjobs';

  @override
  State<AdminJobsScreen> createState() => _AdminJobsScreenState();
}

class _AdminJobsScreenState extends State<AdminJobsScreen> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        elevation: 5,
        title: const Text('Jobs'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  height: 100,
                  color: iconColor,
                  child: const Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ListTile(
                        contentPadding: EdgeInsets.zero,
                        leading: CircleAvatar(
                          radius: 26,
                          backgroundImage:
                              AssetImage(('assets/images/soft.png')),
                        ),
                        title: Text('Senior Ux Designer'),
                        subtitle: Row(
                          children: [
                            Text('1 month ago'),
                            Text('•'),
                            Text('remote'),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: size.height * 0.01,
                ),
                Container(
                  height: 100,
                  color: iconColor,
                  child: const Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ListTile(
                        contentPadding: EdgeInsets.zero,
                        leading: CircleAvatar(
                          radius: 26,
                          backgroundImage:
                              AssetImage(('assets/images/hormuud.png')),
                        ),
                        title: Text('Software Developer'),
                        subtitle: Row(
                          children: [
                            Text('1 week ago'),
                            Text('•'),
                            Text('Full-Time'),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: size.height * 0.01,
                ),
                Container(
                  height: 100,
                  color: iconColor,
                  child: const Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ListTile(
                        contentPadding: EdgeInsets.zero,
                        leading: CircleAvatar(
                          radius: 26,
                          backgroundImage:
                              AssetImage(('assets/images/profile.jpg')),
                        ),
                        title: Text('Graphic Designer'),
                        subtitle: Row(
                          children: [
                            Text('3 month ago'),
                            Text('•'),
                            Text('Part-Time'),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: size.height * 0.01,
                ),
                Container(
                  height: 100,
                  color: iconColor,
                  child: const Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ListTile(
                        contentPadding: EdgeInsets.zero,
                        leading: CircleAvatar(
                          radius: 26,
                          backgroundImage:
                              AssetImage(('assets/images/soft.png')),
                        ),
                        title: Text('Programmer'),
                        subtitle: Row(
                          children: [
                            Text('1 day ago'),
                            Text('•'),
                            Text('internship'),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: size.height * 0.01,
                ),
                Container(
                  height: 100,
                  color: iconColor,
                  child: const Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ListTile(
                        contentPadding: EdgeInsets.zero,
                        leading: CircleAvatar(
                          radius: 26,
                          backgroundImage:
                              AssetImage(('assets/images/hormuud.png')),
                        ),
                        title: Text('Date Scientist'),
                        subtitle: Row(
                          children: [
                            Text('1 month ago'),
                            Text('•'),
                            Text('remote'),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
