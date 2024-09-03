import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:job_finder_app/common/http_response_handlling.dart';
import 'package:job_finder_app/constants/globalvariales.dart';
import 'package:http/http.dart' as http;
import 'package:job_finder_app/models/applicant_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Applicationservices {
  void createApplication({
    required BuildContext context,
    required String jobId,
    required String userId,
  }) async {
    try {
      http.Response applicationRes = await http.post(
          Uri.parse("$url/api/applicant/createapplication"),
          headers: {"Content-Type": "application/json"},
          body: jsonEncode({"jobId": jobId, "userId": userId}));

      if (context.mounted) {
        httpResponseHandle(
            response: applicationRes,
            context: context,
            onSuccess: () {
              print(applicationRes.statusCode);
              print(applicationRes.body);
              showSnackMessage(context, "Job Applied successfully");
              Navigator.pop(context);
            });
      }
    } catch (e) {
      if (context.mounted) {
        showSnackMessage(context, e.toString());
      }
    }
  }

  List<Application> applicants = [];
  Future<List<Application>> getApplicantByUser(BuildContext context) async {
    try {
      SharedPreferences preferences = await SharedPreferences.getInstance();
      String? id = preferences.getString('userId');

      http.Response res = await http.get(
          Uri.parse('$url/api/applicant/getapplicationByUser/$id'),
          headers: {"Content-Type": "application/json"});
      print(res.body);
      print(res.statusCode);
      if (context.mounted) {
        httpResponseHandle(
            response: res,
            context: context,
            onSuccess: () {
try {
   for (int i = 0; i < jsonDecode(res.body).length; i++) {
          applicants.add(Application.fromJson(jsonDecode(res.body)[i]));
        }
  } catch (e) {
    print('Error during mapping: $e');
    showSnackMessage(context, 'Error during data processing.');
  }            });
      }
    } catch (e) {
      if (context.mounted) {
        showSnackMessage(context, e.toString());
      }
    }
    return applicants;
  }

  List<Application> campanyApplicantions = [];
  Future<List<Application>> getApplicantByCompany(BuildContext context) async {
    try {
     
      SharedPreferences preferences = await SharedPreferences.getInstance();
      String? id = preferences.getString('companyId');

      http.Response res = await http.get(
          Uri.parse('$url/api/applicant/getapplicationByCompany/$id'),
          headers: {"Content-Type": "application/json"});
      print(res.body);
      print(res.statusCode);
      if (context.mounted) {
        httpResponseHandle(
            response: res,
            context: context,
            onSuccess: () {
try {
   for (int i = 0; i < jsonDecode(res.body).length; i++) {
          campanyApplicantions.add(Application.fromJson(jsonDecode(res.body)[i]));
        }
  } catch (e) {
    print('Error during mapping: $e');
    showSnackMessage(context, 'Error during data processing.');
  }            });
      }
    } catch (e) {
      if (context.mounted) {
        showSnackMessage(context, e.toString());
      }
    }
    return campanyApplicantions;
  }

  // Future<List<Application>> getApplicantByUser(BuildContext context) async {
  //   List<Application> applicants = [];
  //   try {
  //     SharedPreferences preferences = await SharedPreferences.getInstance();
  //     String? id = preferences.getString('userId');

  //     http.Response res = await http.get(
  //       Uri.parse('$url/api/applicant/getapplicationByUser/$id'),
  //       headers: {"Content-Type": "application/json"},
  //     );

  //     print(res.statusCode);
  //     print(res.body);

  //     if (res.statusCode == 200) {
  //       var jsonResponse = jsonDecode(res.body);
  //       List<dynamic> jsonList;

  //       // Determine if response is a list directly or an object with a list
  //       if (jsonResponse is List) {
  //         jsonList = jsonResponse;
  //       } else if (jsonResponse is Map<String, dynamic> &&
  //           jsonResponse.containsKey('applications')) {
  //         jsonList = jsonResponse['applications'];
  //       } else {
  //         print('Unexpected JSON response format');
  //         return applicants;
  //       }

  //       for (var item in jsonList) {
  //         try {
  //           if (item is Map<String, dynamic>) {
  //             applicants.add(Application.fromJson(item));
  //           } else {
  //             print('Unexpected item type: ${item.runtimeType}');
  //           }
  //         } catch (e, stacktrace) {
  //           print('Error parsing item: $e');
  //           print('Stack trace: $stacktrace');
  //         }
  //       }
  //     } else {
  //       print('Failed to load applicants: ${res.statusCode}');
  //     }
  //   } catch (e) {
  //     print('Error fetching applicants: $e');
  //     if (context.mounted) {
  //       showSnackMessage(context, 'Error: $e');
  //     }
  //   }
  //   return applicants;
  // }

// List<Application> applications = [];
//   Future<List<Application>> getAllApplicants(BuildContext context, ) async {
//     try {
//       http.Response res = await http.get(Uri.parse('$url/api/applicant/getapplication'),
//           headers: {"Content-Type": "application/json"});
//       print(res.statusCode);
//       print(res.body);
//       if (res.statusCode == 200) {
//         for (int i = 0; i < jsonDecode(res.body).length; i++) {
//           applications.add(Application.fromJson(jsonEncode(jsonDecode(res.body)[i])));
//         }
//       }
//     } catch (e) {
//       print(e.toString());
//       showSnackMessage(context, e.toString());
//     }
//     return applications;
//   }

  // Future<List<Application>> getApplicationsByUser(BuildContext context) async {
  //   try {
  //     SharedPreferences preferences = await SharedPreferences.getInstance();
  //     String? id = preferences.getString('userId');

  //     if (id == null) {
  //       throw Exception('User ID not found in preferences');
  //     }

  //     final response = await http.get(
  //       Uri.parse('$url/api/applicant/getapplicationByUser/$id'),
  //       headers: {"Content-Type": "application/json"},
  //     );

  //     // Print response for debugging
  //     print('Status code: ${response.statusCode}');
  //     print('Response body: ${response.body}');

  //     if (response.statusCode == 200) {
  //       // Decode the response body as List<dynamic>
  //       List<dynamic> data = json.decode(response.body);

  //       // Ensure each item is a Map<String, dynamic>
  //       List<Application> applications = data.map((item) {
  //         if (item is Map<String, dynamic>) {
  //           return Application.fromJson(item);
  //         } else {
  //           throw Exception('Unexpected data format');
  //         }
  //       }).toList();

  //       return applications;
  //     } else {
  //       throw Exception('Failed to load applications: ${response.statusCode}');
  //     }
  //   } catch (e) {
  //     print('Error: $e');
  //     throw Exception('Failed to load applications');
  //   }
  // }

  Future<List<Application>> getApp(BuildContext context) async {
    List<Application> applications = [];
    try {
      http.Response res = await http.get(Uri.parse('$url/api/applicant/getapplication'),
          headers: {"Content-Type": "application/json"});
      print(res.statusCode);
      print(res.body);
      if (res.statusCode == 200) {
        for (int i = 0; i < jsonDecode(res.body).length; i++) {
          applications.add(Application.fromJson(jsonDecode(res.body)[i]));
        }
      }
    } catch (e) {
      print(e.toString());
      showSnackMessage(context, e.toString());
    }
    return applications;
  }
}
