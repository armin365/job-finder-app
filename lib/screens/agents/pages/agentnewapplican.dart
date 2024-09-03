import 'package:flutter/material.dart';
import 'package:job_finder_app/models/applicant_model.dart';

import 'package:job_finder_app/themes/themes.dart';

class AgentnewapplicantScreen extends StatefulWidget {
  final List<Application> applicants;

  const AgentnewapplicantScreen({super.key, required this.applicants});

  @override
  State<AgentnewapplicantScreen> createState() =>
      _AgentnewapplicantScreenState();
}

class _AgentnewapplicantScreenState extends State<AgentnewapplicantScreen> {
  bool isLoading = true;
  @override
  void initState() {
    Future.delayed(const Duration(seconds: 2), () {
      setState(() {
        isLoading = false;
      });
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: isLoading
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : widget.applicants.isEmpty
              ? const Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.warning, size: 64, color: Colors.orange),
                      SizedBox(height: 16),
                      Text(
                        'No pending applicants',
                        style: TextStyle(fontSize: 18, color: Colors.grey),
                      ),
                    ],
                  ),
                )
              : ListView.builder(
                  padding: const EdgeInsets.symmetric(horizontal: 8),
                  itemCount: widget.applicants.length,
                  itemBuilder: (BuildContext context, int index) {
                    var app = widget.applicants[index];
                    var job = app.job;
                    var company = app.company;

                    return Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8),
                      child: Container(
                        padding: const EdgeInsets.all(8),
                        decoration: BoxDecoration(
                          color: Colors.blue.withOpacity(0.1),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            if (company != null)
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  CircleAvatar(
                                    backgroundColor: Colors.deepPurpleAccent,
                                    foregroundColor: Colors.white,
                                    backgroundImage: NetworkImage(company.logo),
                                  ),
                                  Text(job?.title ?? 'Title Unavailable'),
                                  Container(
                                    padding: const EdgeInsets.all(8),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(6),
                                      color: blue1Color,
                                    ),
                                    child: Center(
                                      child: Text(
                                        app.status ?? 'Status Unavailable',
                                        style:
                                            const TextStyle(color: iconColor),
                                      ),
                                    ),
                                  ),
                                ],
                              )
                            else
                              const Text('Company information unavailable'),
                            if (job != null) ...[
                              Text(app.user?.name ?? "Title not found"),
                              Text(company?.name ?? 'Category Unavailable'),
                            ] else
                              const Text('Job information unavailable'),
                          ],
                        ),
                      ),
                    );
                  },
                ),
    );
  }
}
