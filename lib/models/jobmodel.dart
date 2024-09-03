// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:job_finder_app/models/category_model.dart';
import 'package:job_finder_app/models/company_model.dart';
import 'package:job_finder_app/models/sub_category_model.dart';

class Job {
  final String title;
  final JobCategory category;
  final SubCategory subcategory;
  final Company company;
  final String location;
  final String description;
  final DateTime postedDate;
  final List<dynamic>? responsibilities;
  final List<dynamic>? qualifications;
  final double salary;
  final List<dynamic>? experienceRequirements;
  final String jobOverview;
  final String jobType;
  final String id;
  final DateTime expiryDate;
  Job({
    required this.title,
    required this.category,
    required this.subcategory,
    required this.company,
    required this.location,
    required this.description,
    required this.postedDate,
    this.responsibilities,
    this.qualifications,
    required this.salary,
    this.experienceRequirements,
    required this.jobOverview,
    required this.jobType,
    required this.id,
    required this.expiryDate,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'title': title,
      'category': category.toMap(),
      'subcategory': subcategory.toMap(),
      'company': company.toMap(),
      'location': location,
      'description': description,
      'postedDate': postedDate.millisecondsSinceEpoch,
      'responsibilities': responsibilities,
      'qualifications': qualifications,
      'salary': salary,
      'experienceRequirements': experienceRequirements,
      'jobOverview': jobOverview,
      'jobType': jobType,
      'id': id,
      'expiryDate': expiryDate.millisecondsSinceEpoch,
    };
  }

  factory Job.fromMap(Map<String, dynamic> map) {
    return Job(
      title: map['title'] ?? '',
      category: JobCategory.fromMap(map['category'] as Map<String, dynamic>),
      subcategory:
          SubCategory.fromMap(map['subcategory'] as Map<String, dynamic>),
      company: Company.fromMap(map['company'] as Map<String, dynamic>),
      location: map['location'] ?? '',
      description: map['description'] ?? '',
      postedDate: map['postedDate'] != null
          ? DateTime.parse(map['postedDate'])
          : DateTime.now(),
      responsibilities: map['responsibilities'] != null
          ? List<String>.from(map['responsibilities'] as List)
          : null,
      qualifications: map['qualifications'] != null
          ? List<String>.from(map['qualifications'] as List)
          : null,
      salary: (map['salary'] is int)
          ? (map['salary'] as int).toDouble()
          : map['salary'] ?? 0.0,
      experienceRequirements: map['experienceRequirements'] != null
          ? List<String>.from(map['experienceRequirements'] as List)
          : null,
      jobOverview: map['jobOverview'] ?? '',
      jobType: map['jobType'] ?? '',
      id: map['_id'] ?? '',
      expiryDate: map['expiryDate'] != null
          ? DateTime.parse(map['expiryDate'])
          : DateTime.now(),
    );
  }

  String toJson() => json.encode(toMap());

  factory Job.fromJson(String source) =>
      Job.fromMap(json.decode(source) as Map<String, dynamic>);
}
