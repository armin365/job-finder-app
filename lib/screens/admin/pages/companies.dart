import 'package:flutter/material.dart';
import 'package:job_finder_app/models/company_model.dart';
import 'package:job_finder_app/models/usermodel.dart';
import 'package:job_finder_app/screens/users/services/authservices.dart';
import 'package:job_finder_app/themes/themes.dart';

class AdminCompanies extends StatefulWidget {
  const AdminCompanies({super.key});
  static const pagename = '/adminCompanies';

  @override
  State<AdminCompanies> createState() => _AdminCompaniesState();
}

class _AdminCompaniesState extends State<AdminCompanies> {
  Authservices authservices = Authservices();
  List<Company> companies = [];
  void getCompanies() async {
    companies = await authservices.getAllcompanies(context: context);
    if (mounted) {
      setState(() {});
    }
  }

  @override
  void initState() {
    getCompanies();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        elevation: 5,
        title: const Text('Companies'),
      ),
      body: companies.isEmpty
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
                        itemCount: companies.length,
                        itemBuilder: (BuildContext context, int index) {
                          var company = companies[index];
                          return Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Container(
                              height: 90,
                              color: iconColor,
                              child: ListTile(
                                contentPadding: EdgeInsets.zero,
                                leading: CircleAvatar(
                                  radius: 26,
                                  backgroundImage:
                                      AssetImage(('assets/images/profile.jpg')),
                                ),
                                title: Text(company.name),
                                subtitle: Row(
                                  children: [
                                    Text(company.contactEmail!),
                                    SizedBox(
                                      width: 10,
                                    ),
                                  ],
                                ),
                                trailing: Icon(Icons.more_vert),
                              ),
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
