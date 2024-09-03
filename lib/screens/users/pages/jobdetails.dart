import 'package:flutter/material.dart';
import 'package:job_finder_app/models/jobmodel.dart';
import 'package:job_finder_app/providers/user_provider.dart';
import 'package:job_finder_app/screens/agents/services/agent_services.dart';
import 'package:job_finder_app/screens/users/pages/home.dart';
import 'package:job_finder_app/screens/users/services/applicationservices.dart';
import 'package:provider/provider.dart';
import 'package:timeago/timeago.dart' as timeago;

class JobdetailsScreen extends StatefulWidget {
  static const pagename = '/jobdetails';
  final Job job;
  const JobdetailsScreen({super.key, required this.job});

  @override
  State<JobdetailsScreen> createState() => _JobdetailsScreenState();
}

class _JobdetailsScreenState extends State<JobdetailsScreen> {
  AgentServices agentServices = AgentServices();
  List<Job> jobs = [];
  void getUsers() async {
    jobs = await agentServices.getAllJobss(context: context);
    if (mounted) {
      setState(() {});
    }
  }

  @override
  void initState() {
    getUsers();
    super.initState();
  }

  Applicationservices applicationservices = Applicationservices();

  @override
  Widget build(BuildContext context) {
    var user = Provider.of<Userprovider>(
      context,
    ).users;
    return Scaffold(
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 30),
        child: ElevatedButton(
          onPressed: () {
            applicationservices.createApplication(
                context: context, jobId: widget.job.id, userId: user.id);
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.deepPurpleAccent,
            foregroundColor: Colors.white,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30),
            ),
          ),
          child: const Padding(
            padding: EdgeInsets.symmetric(vertical: 18),
            child: Text('Apply'),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              children: [
                Image.asset(
                  'assets/annie-spratt-MChSQHxGZrQ-unsplash.jpg',
                  width: double.infinity,
                  height: 200,
                  fit: BoxFit.cover,
                ),
                Positioned(
                  top: 40,
                  left: 16,
                  child: CircleAvatar(
                    backgroundColor: Colors.black.withOpacity(0.5),
                    child: IconButton(
                        onPressed: () {
                          Navigator.pushNamed(context, HomeScreen.pagename);
                        },
                        icon:
                            const Icon(Icons.arrow_back, color: Colors.white)),
                  ),
                ),
                Positioned(
                  top: 40,
                  right: 16,
                  child: CircleAvatar(
                    backgroundColor: Colors.black.withOpacity(0.5),
                    child:
                        const Icon(Icons.favorite_border, color: Colors.white),
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ListTile(
                    contentPadding: EdgeInsets.zero,
                    leading: CircleAvatar(
                      backgroundColor: Colors.cyan,
                      foregroundColor: Colors.white,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(40),
                        child: Image.asset(
                          'assets/images/soft.png',
                          width: 60,
                          height: 50,
                        ),
                      ),
                    ),
                    title: Text(widget.job.title,
                        style: const TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 24)),
                    subtitle: Text(
                        '${widget.job.company.name} • ${widget.job.location} • ${timeago.format(widget.job.postedDate)}'),
                  ),
                  const SizedBox(height: 16),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Chip(
                          avatar: const Icon(Icons.monetization_on),
                          label: Text(widget.job.salary.toString())),
                      const SizedBox(
                        width: 5,
                      ),
                      Chip(
                          avatar: const Icon(Icons.access_time),
                          label: Text(widget.job.jobType)),
                      const SizedBox(
                        width: 5,
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),
                  const Text(
                    'Job Overview',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    widget.job.jobOverview,
                  ),
                  const SizedBox(height: 8),
                  const Text(
                    'Job Description',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    widget.job.description,
                  ),
                  const SizedBox(height: 8),
                  const Text(
                    'Job Requirements',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    widget.job.experienceRequirements!.join('\n'),
                  ),
                  const Text(
                    'Job Responsibilities',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                  ),
                  const SizedBox(height: 8),
                  Text(widget.job.responsibilities!.join('\n')),
                  const Text(
                    'Job Qualifications',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    widget.job.qualifications!.join('\n'),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
