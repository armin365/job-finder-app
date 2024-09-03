import 'package:flutter/material.dart';
import 'package:job_finder_app/themes/themes.dart';

class AgentnewapplicantScreen extends StatefulWidget {
  const AgentnewapplicantScreen({super.key});
  static const pagename = '/agentnewapplicant';

  @override
  State<AgentnewapplicantScreen> createState() =>
      _AgentnewapplicantScreenState();
}

class _AgentnewapplicantScreenState extends State<AgentnewapplicantScreen> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: Column(
        children: [
          SizedBox(
            height: size.height * 0.02,
          ),
          Container(
            height: 110,
            color: iconColor,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ListTile(
                  contentPadding: EdgeInsets.zero,
                  leading: const CircleAvatar(
                    radius: 26,
                    backgroundImage: AssetImage(('assets/images/profile.jpg')),
                  ),
                  title: const Text('Mohamed amiin'),
                  subtitle: const Text('Job Name'),
                  trailing: TextButton(
                      onPressed: () {},
                      child: const Text(
                        'View',
                        style: TextStyle(color: blue1Color, fontSize: 21),
                      )),
                ),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 8),
                  child: Text('1 week ago'),
                )
              ],
            ),
          ),
          SizedBox(
            height: size.height * 0.02,
          ),
          Container(
            height: 110,
            color: iconColor,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ListTile(
                  contentPadding: EdgeInsets.zero,
                  leading: const CircleAvatar(
                    radius: 26,
                    backgroundImage: AssetImage(('assets/images/profile.jpg')),
                  ),
                  title: const Text('Jama\'a hassan'),
                  subtitle: const Text('Job Name'),
                  trailing: TextButton(
                      onPressed: () {},
                      child: const Text(
                        'View',
                        style: TextStyle(color: blue1Color, fontSize: 21),
                      )),
                ),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 8),
                  child: Text('1 day ago'),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
