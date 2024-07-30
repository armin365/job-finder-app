import 'package:flutter/material.dart';
import 'package:job_finder_app/themes/themes.dart';
import 'package:job_finder_app/widgets/drawer.dart';

class AdminDashboard extends StatefulWidget {
  const AdminDashboard({super.key});
  static const pagename = '/dashboard';

  @override
  State<AdminDashboard> createState() => _AdminDashboardState();
}

class _AdminDashboardState extends State<AdminDashboard> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      key: _scaffoldKey,
      endDrawer: const NavigatorDrawer(),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ListTile(
                  leading: const CircleAvatar(
                    radius: 26,
                    backgroundImage: AssetImage(('assets/images/hormuud.png')),
                  ),
                  title: const Text("Hormuud Telecom"),
                  subtitle: const Text("Mogadishu"),
                  trailing: IconButton(
                    icon: const Icon(Icons.menu),
                    onPressed: () {
                      _scaffoldKey.currentState?.openEndDrawer();
                    },
                  ),
                ),
                const Divider(),
                SizedBox(
                  height: size.height * 0.02,
                ),
                const Text(
                  "Dashboard",
                  style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: size.height * 0.01,
                ),
                TextField(
                  decoration: InputDecoration(
                    hintText: 'search',
                    suffixIcon: const Icon(Icons.search),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                      borderSide:
                          const BorderSide(color: Colors.deepPurpleAccent),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                      borderSide:
                          const BorderSide(color: Colors.deepPurpleAccent),
                    ),
                  ),
                ),
                SizedBox(
                  height: size.height * 0.03,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Container(
                      width: 180, // Adjust width as needed
                      padding: const EdgeInsets.all(16.0),
                      decoration: BoxDecoration(
                        color: backColor,
                        borderRadius: BorderRadius.circular(16.0),
                      ),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          const SizedBox(height: 16.0),
                          CircleAvatar(
                            radius: 30,
                            backgroundColor: Colors.blue[100],
                            child: const Icon(
                              Icons.group,
                              color: Colors.blue,
                              size: 35,
                            ),
                          ),
                          const SizedBox(height: 16.0),
                          Text(
                            'Uplied Jobs',
                            style: TextStyle(
                              color: Colors.grey[800],
                            ),
                          ),
                          const SizedBox(height: 8.0),
                          const Text(
                            '243 Jobs',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 24,
                            ),
                          ),
                          const SizedBox(height: 16.0),
                          ElevatedButton(
                            onPressed: () {},
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.blue, // background color
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(16.0),
                              ),
                              padding: const EdgeInsets.symmetric(
                                  vertical: 12, horizontal: 24),
                            ),
                            child: const Text(
                              'View More',
                              style: TextStyle(color: iconColor),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      width: size.width * 0.01,
                    ),
                    Container(
                      width: 180, // Adjust width as needed
                      padding: const EdgeInsets.all(16.0),
                      decoration: BoxDecoration(
                        color: backColor,
                        borderRadius: BorderRadius.circular(16.0),
                      ),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          const SizedBox(height: 16.0),
                          CircleAvatar(
                            radius: 30,
                            backgroundColor: Colors.blue[100],
                            child: const Icon(
                              Icons.business_center,
                              color: Colors.blue,
                              size: 35,
                            ),
                          ),
                          const SizedBox(height: 16.0),
                          Text(
                            'Total Jobs',
                            style: TextStyle(
                              color: Colors.grey[800],
                            ),
                          ),
                          const SizedBox(height: 8.0),
                          const Text(
                            '304 Jobs',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 24,
                            ),
                          ),
                          const SizedBox(height: 16.0),
                          ElevatedButton(
                            onPressed: () {},
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.blue, // background color
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(16.0),
                              ),
                              padding: const EdgeInsets.symmetric(
                                  vertical: 12, horizontal: 24),
                            ),
                            child: const Text(
                              'View More',
                              style: TextStyle(color: iconColor),
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
                SizedBox(
                  height: size.height * 0.02,
                ),
                const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Recent Uplied jobs',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    Text('View All'),
                  ],
                ),
                SizedBox(
                  height: size.height * 0.01,
                ),
                Container(
                  height: 110,
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
                        title: Text('Graphic Designer'),
                        subtitle: Text('Software Academy'),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 8),
                        child: Text('1 Month ago'),
                      )
                    ],
                  ),
                ),
                SizedBox(
                  height: size.height * 0.01,
                ),
                Container(
                  height: 110,
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
                        subtitle: Text('Hormuud'),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 8),
                        child: Text('1 week ago'),
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
