import 'package:flutter/material.dart';
import 'package:job_finder_app/models/applicant_model.dart';
import 'package:job_finder_app/models/data.dart';
import 'package:job_finder_app/models/jobmodel.dart';
import 'package:job_finder_app/screens/agents/services/agent_services.dart';
import 'package:job_finder_app/screens/users/services/applicationservices.dart';
import 'package:job_finder_app/themes/themes.dart';

class UpliedjobsScreen extends StatefulWidget {
  static const pagename = '/upliedjobs';

  const UpliedjobsScreen({super.key});

  @override
  State<UpliedjobsScreen> createState() => _UpliedjobsScreenState();
}

class _UpliedjobsScreenState extends State<UpliedjobsScreen> {
  AgentServices agentServices = AgentServices();
  Applicationservices applicationservices = Applicationservices();
  List<Application> applicant = [];
  void getApplicants() async {
    applicant = await applicationservices.getApplicantByUser(context);
    if (mounted) {
      setState(() {});
    }
  }

  List<Job> jobs = [];
  void getJobs() async {
    jobs = await agentServices.getAllJobss(context: context);
    if (mounted) {
      setState(() {});
    }
  }

  bool isLoading = true;

  @override
  void initState() {
    getJobs();
    getApplicants();
    Future.delayed(const Duration(seconds: 2), () {
      setState(() {
        isLoading = false;
      });
    });
    super.initState();
  }

  final Map<String, Color> statusColors = {
    'pending': Colors.yellow,
    'accepted': Colors.green,
    'rejected': Colors.red,
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white.withOpacity(0.93),
      appBar: AppBar(
        elevation: 5,
        title: const Text('Uplied Jobs'),
      ),
      body: isLoading
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : applicant.isEmpty
              ? const Center(
                  child: const Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.warning, size: 64, color: Colors.orange),
                      SizedBox(height: 16),
                      Text(
                        'No applied jobs',
                        style: TextStyle(fontSize: 18, color: Colors.grey),
                      ),
                    ],
                  ),
                )
              : ListView.builder(
                  padding: const EdgeInsets.symmetric(horizontal: 8),
                  itemCount: applicant.length,
                  itemBuilder: (BuildContext context, int index) {
                    var app = applicant[index];
                    var job = app.job;
                    var company = app.company;
                    Color statusColor =
                        statusColors[app.status ?? 'pending'] ?? Colors.grey;

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
                                      color: statusColor,
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
                              Text('Company information unavailable'),
                            if (job != null) ...[
                              Text(app.user?.name ?? "Title not found"),
                              Text(company?.name ?? 'Category Unavailable'),
                            ] else
                              Text('Job information unavailable'),
                          ],
                        ),
                      ),
                    );
                  },
                ),
    );
  }
}
