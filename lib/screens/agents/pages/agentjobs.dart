import 'package:flutter/material.dart';
import 'package:job_finder_app/models/company_model.dart';
import 'package:job_finder_app/models/jobmodel.dart';
import 'package:job_finder_app/screens/agents/pages/agentupdatejob.dart';
import 'package:job_finder_app/screens/agents/services/agent_services.dart';
import 'package:job_finder_app/themes/themes.dart';
import 'package:timeago/timeago.dart' as timeago;

class AgentJobsScreen extends StatefulWidget {
  const AgentJobsScreen({super.key, required this.company});
  static const pagename = '/agentjobs';
  final Company company;
  @override
  State<AgentJobsScreen> createState() => _AgentJobsScreenState();
}

class _AgentJobsScreenState extends State<AgentJobsScreen> {
  AgentServices agentServices = AgentServices();
  List<Job> jobs = [];
  void getjobs() async {
    jobs = await agentServices.getPostedJobs(
        context: context, companyId: widget.company.id);
    if (mounted) {
      setState(() {});
    }
  }

  @override
  void initState() {
    getjobs();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.white.withOpacity(0.96),
      appBar: AppBar(
        elevation: 5,
        title: const Text('Jobs'),
      ),
      body: jobs.isEmpty
          ? Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset('assets/splash.png'),
                CircularProgressIndicator(),
              ],
            )
          : Padding(
              padding: const EdgeInsets.all(8.0),
              child: SafeArea(
                child: Column(
                  children: [
                    Expanded(
                      child: ListView.builder(
                        itemCount: jobs.length,
                        itemBuilder: (BuildContext context, int index) {
                          var job = jobs[index];
                          return Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Container(
                              height: 100,
                              color: iconColor,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  ListTile(
                                    contentPadding: EdgeInsets.zero,
                                    leading: CircleAvatar(
                                      radius: 26,
                                      backgroundImage: AssetImage(
                                          ('assets/images/soft.png')),
                                    ),
                                    title: Text(job.title),
                                    subtitle: Row(
                                      children: [
                                        Text(timeago.format(job.postedDate)),
                                        Text('•'),
                                        Text(job.jobType),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          );
                        },
                      ),
                    )
                  ],
                ),
              ),
            ),
    );
  }
}
