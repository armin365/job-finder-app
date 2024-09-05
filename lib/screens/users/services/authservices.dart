import 'dart:convert';
import 'dart:io';

import 'package:cloudinary_public/cloudinary_public.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:job_finder_app/common/http_response_handlling.dart';
import 'package:job_finder_app/constants/globalvariales.dart';
import 'package:http/http.dart' as http;
import 'package:job_finder_app/models/company_model.dart';
import 'package:job_finder_app/models/usermodel.dart';
import 'package:job_finder_app/providers/allusers_provider.dart';
import 'package:job_finder_app/providers/company_provider.dart';
import 'package:job_finder_app/providers/user_provider.dart';
import 'package:job_finder_app/screens/admin/pages/dashbord.dart';
import 'package:job_finder_app/screens/agents/pages/agentshomepage.dart';
import 'package:job_finder_app/screens/auth/pages/login.dart';
import 'package:job_finder_app/screens/users/pages/home.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Authservices {
  void registerUser({
    required BuildContext context,
    required String name,
    required String email,
    required String phone,
    required String password,
    required String role,
  }) async {
    try {
      http.Response res = await http.post(Uri.parse('$url/api/users/reg'),
          headers: {"Content-Type": "application/json"},
          body: jsonEncode({
            "name": name,
            "email": email,
            "phone": phone,
            "password": password,
            "role": role,
          }));

      // if (res.statusCode == 201) {
      //   print(res.statusCode);
      //   print(res.body);
      //   showSnackMessage(context, "Account created successfully");
      //   Navigator.pushNamed(context, LoginScreen.pagename);
      // } else {
      //   print(res.statusCode);
      //   print(res.body);
      //   showSnackMessage(context, "some thing wrong");
      // }
      if (context.mounted) {
        httpResponseHandle(
          response: res,
          context: context,
          onSuccess: () {
            showSnackMessage(context, "Account created successfully");
            Navigator.pushNamed(context, LoginScreen.pagename);
          },
        );
      }
    } catch (e) {
      showSnackMessage(context, e.toString());
    }
  }

  Future<void> login({
    required BuildContext context,
    required String email,
    required String password,
  }) async {
    try {
      var userProvider = Provider.of<Userprovider>(context, listen: false);

      http.Response res = await http.post(Uri.parse('$url/api/users/login'),
          headers: {"Content-Type": "application/json"},
          body: jsonEncode({"email": email, "password": password}));
      print(res.body);
      if (context.mounted) {
        httpResponseHandle(
            response: res,
            context: context,
            onSuccess: () async {
              showSnackMessage(context, "welcome");
              print(res.statusCode);
              print(res.body);
              final decodedRes = jsonDecode(res.body);
              final role = decodedRes["role"];
              SharedPreferences preferences =
                  await SharedPreferences.getInstance();

              // final userData = jsonDecode(res.body)["user"];
              // final companyData = jsonDecode(res.body)["company"];

              await preferences.setString('role', role);

              if (role == "user") {
                final userData = decodedRes["user"];
                print(res.statusCode);
                print(userData);
                print(userData['_id']);
                print(userData['_id'].runtimeType);
                if (userData != null) {
                  preferences.setString('userId', userData['_id']);
                  if (context.mounted) {
                    userProvider.setUser(jsonEncode(userData));
                    if (userProvider.users.role.toLowerCase() == 'admin') {
                      Navigator.pushNamed(context, AdminDashboard.pagename);
                    } else {
                      Navigator.pushNamed(context, HomeScreen.pagename);
                    }
                  }
                }
              } else if (role == "company") {
                final companyData = decodedRes["company"];
                print(res.statusCode);
                print(companyData);
                print(companyData['_id']);
                if (companyData != null) {
                  preferences.setString('companyId', companyData['_id']);
                  if (context.mounted) {
                    Provider.of<CompanyProvider>(context, listen: false)
                        .setcompany(jsonEncode(companyData));
                    Navigator.pushNamed(context, Agentshomepage.pagename);
                  }
                }
              } else {
                print(res.statusCode);
                print(res.body);
                final userData = decodedRes["user"];
                if (userData != null) {
                  preferences.setString('userId', userData['_id']);
                  if (context.mounted) {
                    Provider.of<Userprovider>(context, listen: false)
                        .setUser(res.body);
                    Navigator.pushNamed(context, AdminDashboard.pagename);
                  }
                }
              }
            });
      }
    } catch (e) {
      if (context.mounted) {
        print(e.toString());
        showSnackMessage(context, e.toString());
      }
    }
  }

  void logOut(BuildContext context) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    preferences.clear();
    if (context.mounted) {
      Navigator.pushNamedAndRemoveUntil(
          context, LoginScreen.pagename, (route) => false);
    }
  }

  void getUserById(BuildContext context) async {
    try {
      var userProvider = Provider.of<Userprovider>(context, listen: false);
      var companyProvider =
          Provider.of<CompanyProvider>(context, listen: false);

      SharedPreferences preferences = await SharedPreferences.getInstance();
      String? companyId = preferences.getString('companyId');
      String? id = preferences.getString('userId');
      String? role = preferences.getString('role');

      if (role != null && role == 'user') {
        if (id != null) {
          http.Response res = await http.get(
            Uri.parse('$url/api/users/get/$id'),
            headers: {"Content-Type": "application/json"},
          );

          print(res.body);

          if (context.mounted) {
            httpResponseHandle(
                response: res,
                context: context,
                onSuccess: () {
                  userProvider.setUser(res.body);
                  if (userProvider.users.role.toLowerCase() == 'admin') {
                    Navigator.pushNamed(context, AdminDashboard.pagename);
                  } else {
                    Navigator.pushNamed(context, HomeScreen.pagename);
                  }
                });
          }
        }
      } else if (role != null && role == 'company') {
        http.Response res = await http.get(
          Uri.parse('$url/api/users/getcompany/$companyId'),
          headers: {"Content-Type": "application/json"},
        );

        if (context.mounted) {
          httpResponseHandle(
              response: res,
              context: context,
              onSuccess: () {
                companyProvider.setcompany(res.body);
                Navigator.pushNamed(context, Agentshomepage.pagename);
              });
        }
      } else {
        if (context.mounted) {
          Navigator.pushNamed(context, LoginScreen.pagename);
        }
      }
    } catch (e) {
      if (context.mounted) {
        showSnackMessage(context, e.toString());
      }
    }
  }

  void getAllUserswithprovider(BuildContext context) async {
    try {
      http.Response res = await http.get(
        Uri.parse('$url/api/users/get'),
        headers: {"Content-Type": "application/json"},
      );
      print(res.statusCode);
      print(res.body);
      if (res.statusCode == 200) {
        List<dynamic> jsonList = jsonDecode(res.body);
        List<User> users = jsonList.map((json) => User.fromJson(json)).toList();
        Provider.of<AllusersProvider>(context, listen: false).setUsers(users);
        print(res.statusCode);
        print(res.body);
      }
    } catch (e) {
      if (context.mounted) {
        print(e.toString());
        showSnackMessage(context, e.toString());
      }
    }
  }

  List<User> myusers = [];
  Future<List<User>> getAllusers({required BuildContext context}) async {
    try {
      http.Response res = await http.get(Uri.parse('$url/api/users/get'),
          headers: {"Content-Type": "application/json"});
      print(res.statusCode);
      print(res.body);
      if (res.statusCode == 200) {
        for (int i = 0; i < jsonDecode(res.body).length; i++) {
          myusers.add(User.fromJson(jsonEncode(jsonDecode(res.body)[i])));
        }
      }
    } catch (e) {
      showSnackMessage(context, e.toString());
    }
    return myusers;
  }

  void updateUsers({
    required BuildContext context,
    required String id,
    required String name,
    required String email,
    required int phone,
    required String location,
    required String sex,
    required String age,
    required String preferredLocation,
    required List<String> education,
    required List<String> workExperience,
  }) async {
    try {
      http.Response res =
          await http.put(Uri.parse('$url/api/users/updateuser/$id'),
              headers: {"Content-Type": "application/json"},
              body: jsonEncode({
                "name": name,
                "email": email,
                "phone": phone,
                "location": location,
                "sex": sex,
                "age": age,
                "preferredLocation": preferredLocation,
                "Education": education,
                "workExperience": workExperience,
              }));

      print(res.statusCode);
      print(res.body);
      if (res.statusCode == 200) {
        showSnackMessage(context, 'Profile updated successfully');
        Navigator.pop(context);
      }
    } catch (e) {
      showSnackMessage(context, e.toString());
    }
  }

  void changeUsersPassword({
    required BuildContext context,
    required String password,
    required String newPassword,
    required String confirmPassword,
  }) async {
    try {
      SharedPreferences preferences = await SharedPreferences.getInstance();
      String? id = preferences.getString('userId');
      http.Response res =
          await http.put(Uri.parse('$url/api/users/changepassword/$id'),
              headers: {"Content-Type": "application/json"},
              body: jsonEncode({
                "password": password,
                "newPassword": newPassword,
                "confirmPassword": confirmPassword,
              }));

      print(res.statusCode);
      print(res.body);
      if (res.statusCode == 200) {
        showSnackMessage(context, 'Password Changed successfully');
        Navigator.pop(context);
      } else {
        final Map<String, dynamic> responseBody = jsonDecode(res.body);
        showSnackMessage(context, responseBody['message']);
      }
    } catch (e) {
      showSnackMessage(context, e.toString());
    }
  }

  void updateUsersProfile({
    required BuildContext context,
    required String id,
    required File image,
  }) async {
    try {
      String logourl = '';
      final cloudinary =
          CloudinaryPublic('dks7u4tdh', 'dfd2bmjc', cache: false);

      CloudinaryResponse response = await cloudinary.uploadFile(
        CloudinaryFile.fromFile(image.path,
            resourceType: CloudinaryResourceType.Image),
      );

      logourl = response.secureUrl;
      if (logourl.isNotEmpty) {
        http.Response res =
            await http.put(Uri.parse('$url/api/users/updateProPic/$id'),
                headers: {"Content-Type": "application/json"},
                body: jsonEncode({
                  "image": logourl,
                }));

        print(res.statusCode);
        print(res.body);
        if (res.statusCode == 200) {
          showSnackMessage(context, 'Profile updated successfully');
        }
      } else {
        if (context.mounted) {
          showSnackMessage(context, "image Not Found");
        }
      }
    } catch (e) {
      print(e.toString());
      showSnackMessage(context, e.toString());
    }
  }

  List<Company> companies = [];
  Future<List<Company>> getAllcompanies({required BuildContext context}) async {
    try {
      http.Response res = await http.get(Uri.parse('$url/api/users/getcompany'),
          headers: {"Content-Type": "application/json"});
      print(res.statusCode);
      print(res.body);
      if (res.statusCode == 200) {
        for (int i = 0; i < jsonDecode(res.body).length; i++) {
          companies.add(Company.fromJson(jsonEncode(jsonDecode(res.body)[i])));
        }
      }
    } catch (e) {
      showSnackMessage(context, e.toString());
    }
    return companies;
  }

  void updateCompany({
    required BuildContext context,
    required String name,
    required String id,
    required String website,
    required String description,
    required String location,
    required String industry,
    required String contactEmail,
    required String contactPhone,
    required File logo,
  }) async {
    try {
      String logourl = '';
      final cloudinary =
          CloudinaryPublic('dks7u4tdh', 'dfd2bmjc', cache: false);

      CloudinaryResponse response = await cloudinary.uploadFile(
        CloudinaryFile.fromFile(logo.path,
            resourceType: CloudinaryResourceType.Image),
      );

      logourl = response.secureUrl;
      if (logourl.isNotEmpty) {
        http.Response res =
            await http.put(Uri.parse('$url/api/users/updateCompany/$id'),
                headers: {"Content-Type": "application/json"},
                body: jsonEncode({
                  "name": name,
                  "website": website,
                  "phone": description,
                  "location": location,
                  "sex": industry,
                  "contactEmail": contactEmail,
                  "contactPhone": contactPhone,
                  "logo": logourl,
                }));

        print(res.statusCode);
        print(res.body);
        if (res.statusCode == 200) {
          showSnackMessage(context, 'Company Profile updated successfully');
          Navigator.pop(context);
        }
      } else {
        showSnackMessage(context, "logo Not Found");
      }
    } catch (e) {
      showSnackMessage(context, e.toString());
    }
  }

   
}
