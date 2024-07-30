// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class User {
  final String id;
  final String name;
  final String email;
  final int phone;
  final String? profile;
  final String location;
  final String sex;
  final String role;   //admin employer jobSeeker
  final String password;
  final String? dateofbirth;
  final String? workExperience;
  final String? jobTitle;
  final String? company;
  final String? preferredLocation;
  final String? universityName;
  final String? eduLevel;
  final String? faculty;
  final List<dynamic>? favoriteJobs; 
  final List<dynamic>? postedJobs;

  User({
  required this.id, 
  required this.name, 
  required this.email, 
  required this.phone, 
  this.profile, 
  required this.location, 
  required this.sex, 
  required this.role, 
  required this.password, 
  this.dateofbirth, 
  this.workExperience, 
  this.jobTitle, 
  this.company, 
  this.preferredLocation, 
  this.universityName, 
  this.eduLevel, 
  this.faculty, 
  this.favoriteJobs, 
  this.postedJobs});

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'name': name,
      'email': email,
      'phone': phone,
      'profile': profile,
      'location': location,
      'sex': sex,
      'role': role,
      'password': password,
      'dateofbirth': dateofbirth,
      'workExperience': workExperience,
      'jobTitle': jobTitle,
      'company': company,
      'preferredLocation': preferredLocation,
      'universityName': universityName,
      'eduLevel': eduLevel,
      'faculty': faculty,
      'favoriteJobs': favoriteJobs,
      'postedJobs': postedJobs,
    };
  }

  factory User.fromMap(Map<String, dynamic> map) {
    return User(
      id: map['_id'] ?? '',
      name: map['name'] ?? '',
      email: map['email'] ?? '',
      phone: map['phone'] ?? 0,
      profile: map['profile'] != null ? map['profile'] as String : null,
      location: map['location'] ?? '',
      sex: map['sex'] ?? '',
      role: map['role'] ?? '',
      password: map['password'] ?? '',
      dateofbirth: map['dateofbirth'] != null ? map['dateofbirth'] ?? '' : null,
      workExperience: map['workExperience'] != null ? map['workExperience'] ?? '': null,
      jobTitle: map['jobTitle'] != null ? map['jobTitle'] ?? '' : null,
      company: map['company'] != null ? map['company'] ?? '' : null,
      preferredLocation: map['preferredLocation'] != null ? map['preferredLocation'] ?? '' : null,
      universityName: map['universityName'] != null ? map['universityName'] ?? '' : null,
      eduLevel: map['eduLevel'] != null ? map['eduLevel'] ?? '' : null,
      faculty: map['faculty'] != null ? map['faculty'] ?? '' : null,
      favoriteJobs: map['favoriteJobs'] != null
            ? List<Map<String, dynamic>>.from(
                (map['favoriteJobs']?.map((x) => Map<String, dynamic>.from(x))))
            : null,
      postedJobs:map['postedJobs'] != null
            ? List<Map<String, dynamic>>.from(
                (map['postedJobs']?.map((x) => Map<String, dynamic>.from(x))))
            : null,
      );
  }

  String toJson() => json.encode(toMap());

  factory User.fromJson(String source) => User.fromMap(json.decode(source) as Map<String, dynamic>);
}
