import 'package:flutter/material.dart';
import 'package:job_finder_app/models/usermodel.dart';

class Userprovider extends ChangeNotifier {
  User users = User(
      id: '',
      name: '',
      email: '',
      phone: 0,
      image: '',
      location: '',
      sex: '',
      password: '',
      age: '',
      preferredLocation: '',
      education: [],
      workExperience: [],
      role: 'job_seeker',
      applications: [],
      favoriteJobs: []);

  void setUser(String user) {
    users = User.fromJson(user);
    notifyListeners();
  }

  void setFromModel(User user) {
    users = user;
    notifyListeners();
  }
}
