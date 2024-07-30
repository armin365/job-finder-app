import 'package:flutter/material.dart';
import 'package:job_finder_app/models/data.dart';
import 'package:job_finder_app/themes/themes.dart';

class UpliedjobsScreen extends StatefulWidget {
  static const pagename = '/upliedjobs';

  const UpliedjobsScreen({super.key});

  @override
  State<UpliedjobsScreen> createState() => _UpliedjobsScreenState();
}

class _UpliedjobsScreenState extends State<UpliedjobsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white.withOpacity(0.93),
      appBar: AppBar(
        elevation: 5,
        title: const Text('Uplied Jobs'),
      ),
      body: ListView.builder(
        padding: const EdgeInsets.symmetric(horizontal: 8),
        itemCount: jobs.length,
        itemBuilder: (BuildContext context, int index) {
          var job = jobs[index];
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
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      CircleAvatar(
                        backgroundColor: Colors.deepPurpleAccent,
                        foregroundColor: Colors.white,
                        child: ClipRRect(
                            borderRadius: BorderRadius.circular(15),
                            child: Image.asset(
                              (job.profile),
                              fit: BoxFit.cover,
                            )),
                      ),
                      Text(job.title),
                      Container(
                        padding: const EdgeInsets.all(8),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(6),
                          color: blue1Color,
                        ),
                        child: const Center(
                            child: Text(
                          'Accepted',
                          style: TextStyle(color: iconColor),
                        )),
                      ),
                    ],
                  ),
                  Text(job.category),
                  Text(job.company),
                  Text(job.location),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
