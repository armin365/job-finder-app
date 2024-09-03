import 'package:flutter/material.dart';
import 'package:job_finder_app/models/usermodel.dart';
import 'package:job_finder_app/screens/users/services/authservices.dart';
import 'package:job_finder_app/themes/themes.dart';

class AdminUsers extends StatefulWidget {
  const AdminUsers({super.key});
  static const pagename = '/adminusers';

  @override
  State<AdminUsers> createState() => _AdminUsersState();
}

class _AdminUsersState extends State<AdminUsers> {
  Authservices authservices = Authservices();
  List<User> users = [];
  void getUsers() async {
    users = await authservices.getAllusers(context: context);
    if (mounted) {
      setState(() {});
    }
  }

  @override
  void initState() {
    getUsers();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        elevation: 5,
        title: const Text('Users'),
      ),
      body: users.isEmpty
          ? Center(
              child: CircularProgressIndicator(),
            )
          : Padding(
              padding: const EdgeInsets.all(8.0),
              child: SafeArea(
                child: Column(
                  children: [
                    Expanded(
                      child: ListView.builder(
                        itemCount: users.length,
                        itemBuilder: (BuildContext context, int index) {
                          var user = users[index];
                          return Container(
                            height: 90,
                            color: iconColor,
                            child: ListTile(
                              contentPadding: EdgeInsets.zero,
                              leading: CircleAvatar(
                                radius: 26,
                                backgroundImage:
                                    AssetImage(('assets/images/profile.jpg')),
                              ),
                              title: Text(user.name),
                              subtitle: Row(
                                children: [
                                  Text(user.email),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  Text('•'),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  Text(user.role),
                                ],
                              ),
                              trailing: Icon(Icons.more_vert),
                            ),
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
    );
  }
}
