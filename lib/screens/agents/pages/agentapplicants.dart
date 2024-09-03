import 'package:flutter/material.dart';
import 'package:job_finder_app/models/applicant_model.dart';
import 'package:job_finder_app/screens/agents/pages/agentacceptedapp.dart';
import 'package:job_finder_app/screens/agents/pages/agentnewapplican.dart';
import 'package:job_finder_app/screens/agents/pages/agentrejectedapp.dart';
import 'package:job_finder_app/screens/users/services/applicationservices.dart';

class AgentapplicantsPage extends StatefulWidget {
  const AgentapplicantsPage({super.key});
  static const pagename = '/agentapplicants';
  @override
  State<AgentapplicantsPage> createState() => _AgentapplicantsPageState();
}

class _AgentapplicantsPageState extends State<AgentapplicantsPage> {
   Applicationservices applicationservices = Applicationservices();
  List<Application> applicants = [];
  List<Application> pendingApplicants = [];
  List<Application> acceptedApplicants = [];
  List<Application> rejectedApplicants = [];

  void getApplicants() async {
    applicants = await applicationservices.getApplicantByCompany(context);
    filterApplicantsByStatus();
    if (mounted) {
      setState(() {});
    }
  }
   void filterApplicantsByStatus() {
    pendingApplicants = applicants.where((app) => app.status == 'pending').toList();
    acceptedApplicants = applicants.where((app) => app.status == 'accepted').toList();
    rejectedApplicants = applicants.where((app) => app.status == 'rejected').toList();
  }

  @override
  void initState() {
    getApplicants();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return DefaultTabController(
        length: 3,
        child: Scaffold(
          appBar: AppBar(
            title: const Text("Applicants"),
            elevation: 4,
          ),
          body: SafeArea(
              child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              children: [
                SizedBox(
                  height: size.height * 0.02,
                ),
                const TabBar(
                  indicator: BoxDecoration(
                    color: Colors.transparent,
                  ),
                  tabs: [
                    Tab(
                      child: Text("Pending"),
                    ),
                    Tab(
                      child: Text("Accepted"),
                    ),
                    Tab(
                      child: Text("Rejected"),
                    ),
                  ],
                ),
                 Expanded(
                    child: TabBarView(children: [
                  AgentnewapplicantScreen(applicants: pendingApplicants),
                  AgentacceptedapplicantScreen(applicants: acceptedApplicants),
                  AgentrejectedapplicantScreen(applicants: rejectedApplicants)
                ]))
              ],
            ),
          )),
        ));
  }
}
