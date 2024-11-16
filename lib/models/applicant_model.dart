// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:job_finder_app/models/company_model.dart';
import 'package:job_finder_app/models/jobmodel.dart';
import 'package:job_finder_app/models/usermodel.dart';

class JobRef {
  String? title;
  dynamic category;
  dynamic subcategory;
  String? location;
  List<String>? responsibilities;
  List<String>? qualifications;
  List<String>? experienceRequirements;

  JobRef({
    this.title,
    this.category,
    this.subcategory,
    this.location,
    this.responsibilities,
    this.qualifications,
    this.experienceRequirements,
  });

  JobRef.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    category = json['category'];
    subcategory = json['subcategory'];
    location = json['location'];
    responsibilities = List<String>.from(json['responsibilities'] ?? []);
    qualifications = List<String>.from(json['qualifications'] ?? []);
    experienceRequirements =
        List<String>.from(json['experienceRequirements'] ?? []);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['title'] = this.title;
    if (this.category != null) {
      data['category'] = this.category;
    }
    if (this.subcategory != null) {
      data['subcategory'] = this.subcategory;
    }
    data['location'] = this.location;
    data['responsibilities'] = this.responsibilities;
    data['qualifications'] = this.qualifications;
    data['experienceRequirements'] = this.experienceRequirements;
    // if (this.job != null) {
    //   data['job'] = this.job!.toJson();
    // }
    // if (this.company != null) {
    //   data['company'] = this.company!.toJson();
    // }
    // data['status'] = this.status;

    return data;
  }
}

class CompanyRef {
  String? name;
  dynamic email;
  dynamic logo;
  CompanyRef({
    this.name,
    this.email,
    this.logo,
  });

  CompanyRef.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    email = json['email'];
    logo = json['logo'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    if (this.email != null) {
      data['email'] = this.email;
    }
    if (this.logo != null) {
      data['logo'] = this.logo;
    }
    return data;
  }
}

class UserRef {
  String? name;
  dynamic email;
  dynamic image;
  int? phone;
  String? age;
  String? location;
  String? preferredLocation;
  List<String>? Education;
  List<String>? workExperience;

  UserRef({
    this.name,
    this.email,
    this.image,
    this.phone,
    this.age,
    this.location,
    this.preferredLocation,
    this.Education,
    this.workExperience,
  });

  UserRef.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    email = json['email'];
    image = json['image'];
    phone = json['phone'];
    age = json['age'];
    location = json['location'];
    preferredLocation = json['preferredLocation'];
    Education = List<String>.from(json['Education'] ?? []);
    workExperience = List<String>.from(json['workExperience'] ?? []);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    if (this.email != null) {
      data['email'] = this.email;
    }
    if (this.image != null) {
      data['image'] = this.image;
    }
    data['phone'] = this.phone;
    data['age'] = this.age;
    data['location'] = this.location;
    data['preferredLocation'] = this.preferredLocation;
    data['Education'] = this.Education;
    data['workExperience'] = this.workExperience;

    return data;
  }
}

class Application {
  String? id;
  UserRef? user;
  JobRef? job;
  CompanyRef? company;
  String? status;

  Application({
    this.id,
    this.user,
    this.job,
    this.company,
    this.status,
  });

  Application.fromJson(Map<String, dynamic> json) {
    id = json['_id'];
    user = json['user'] != null ? UserRef.fromJson(json['user']) : null;
    job = json['job'] != null ? JobRef.fromJson(json['job']) : null;
    company = json['company'] != null
        ? new CompanyRef.fromJson(json['company'])
        : null;
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.id;
    if (this.user != null) {
      data['user'] = this.user!.toJson();
    }
    if (this.job != null) {
      data['job'] = this.job!.toJson();
    }
    if (this.company != null) {
      data['company'] = this.company!.toJson();
    }
    data['status'] = this.status;

    return data;
  }
}

class Applixation {
  String? id;
  User? user;
  Job? job;
  Company? company;
  String? status;

  Applixation({
    this.id,
    this.user,
    this.job,
    this.company,
    this.status,
  });

  Applixation.fromJson(Map<String, dynamic> json) {
    id = json['_id'];
    user = json['user'] != null ? new User.fromJson(json['user']) : null;
    job = json['job'] != null ? new Job.fromJson(json['job']) : null;
    company =
        json['company'] != null ? new Company.fromJson(json['company']) : null;
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.id;
    if (this.user != null) {
      data['user'] = this.user!.toJson();
    }
    if (this.job != null) {
      data['job'] = this.job!.toJson();
    }
    if (this.company != null) {
      data['company'] = this.company!.toJson();
    }
    data['status'] = this.status;

    return data;
  }
}
