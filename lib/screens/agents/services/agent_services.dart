import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:job_finder_app/constants/globalvariales.dart';
import 'package:job_finder_app/models/jobmodel.dart';
import 'package:job_finder_app/screens/agents/pages/agentjobs.dart';
import 'package:job_finder_app/screens/agents/pages/agentshomepage.dart';

class AgentServices {
  void createJob({
    required BuildContext context,
    required String companyId,
    required String title,
    required String category,
    required String subcategory,
    required String location,
    required String description,
    required List<String> responsibilities,
    required List<String> qualifications,
    required String salary,
    required List<String> experienceRequirements,
    required String jobOverview,
    required String jobType,
    required String expiryDate,
  }) async {
    try {
      http.Response res =
          await http.post(Uri.parse('$url/api/job/createjob/$companyId'),
              headers: {"Content-Type": "application/json"},
              body: jsonEncode({
                "title": title,
                "category": category,
                "subcategory": subcategory,
                "location": location,
                "description": description,
                "responsibilities": responsibilities,
                "qualifications": qualifications,
                "salary": salary,
                "experienceRequirements": experienceRequirements,
                "jobOverview": jobOverview,
                "jobType": jobType,
                "expiryDate": expiryDate,
              }));

      if (res.statusCode == 201) {
        if (context.mounted) {
          showSnackMessage(context, "Job Posted successfully");
          Navigator.pushNamed(context, Agentshomepage.pagename);
        }
      } else {
        if (context.mounted) {
          print(res.body);
          showSnackMessage(context, res.body);
        }
      }
    } catch (e) {
      if (context.mounted) {
        print(e.toString());
        showSnackMessage(context, e.toString());
      }
    }
  }

  List<Job> jobs = [];
  Future<List<Job>> getAllJobss({required BuildContext context}) async {
    try {
      http.Response res = await http.get(Uri.parse('$url/api/job/getjob'),
          headers: {"Content-Type": "application/json"});
      print(res.statusCode);
      print(res.body);
      if (res.statusCode == 200) {
        for (int i = 0; i < jsonDecode(res.body).length; i++) {
          jobs.add(Job.fromJson(jsonEncode(jsonDecode(res.body)[i])));
        }
      }
    } catch (e) {
      print(e.toString());
      showSnackMessage(context, e.toString());
    }
    return jobs;
  }

  List<Job> postedJobs = [];
  Future<List<Job>> getPostedJobs(
      {required BuildContext context, required String companyId}) async {
    try {
      http.Response res = await http.get(
          Uri.parse('$url/api/job/getpostedjobs/$companyId'),
          headers: {"Content-Type": "application/json"});
      print(res.statusCode);
      print(res.body);
      if (res.statusCode == 200) {
        for (int i = 0; i < jsonDecode(res.body).length; i++) {
          postedJobs.add(Job.fromJson(jsonEncode(jsonDecode(res.body)[i])));
        }
      }
    } catch (e) {
      print(e.toString());
      showSnackMessage(context, e.toString());
    }
    return postedJobs;
  }
}
