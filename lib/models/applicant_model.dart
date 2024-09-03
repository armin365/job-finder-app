// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:job_finder_app/models/company_model.dart';
import 'package:job_finder_app/models/jobmodel.dart';
import 'package:job_finder_app/models/usermodel.dart';

class JobRef {
  String? title;
  dynamic category;
  dynamic subcategory;
  JobRef({
    this.title,
    this.category,
    this.subcategory,
  });

  JobRef.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    category = json['category'];
    subcategory = json['subcategory'];
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
  UserRef({
    this.name,
    this.email,
    this.image,
  });

  UserRef.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    email = json['email'];
    image = json['image'];
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
