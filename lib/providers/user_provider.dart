import 'package:flutter/material.dart';
import 'package:job_finder_app/models/usermodel.dart';

class Userprovider extends ChangeNotifier {
  User users = User(
      id: '',
      name: '',
      profile: '',
      email: '',
      phone: 0,
      location: '',
      sex: '',
      role: 'jobseeker',
      password: '',
      dateofbirth: '',
      workExperience: '',
      jobTitle: '',
      company: '',
      preferredLocation: '',
      universityName: '',
      eduLevel: '',
      faculty: '',
      favoriteJobs: [],
      postedJobs: []);

}
