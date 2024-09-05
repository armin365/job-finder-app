// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class User {
  final String id;
  final String name;
  final String email;
  final int phone;
  final String? image;
  final String? location;
  final String? sex;
  final String password;
  final String? age;
  final String? preferredLocation;
  final List<dynamic>? Education;
  final List<dynamic>? workExperience;
  final String role;
  final List<dynamic>? applications;
  final List<dynamic>? favoriteJobs;
  User({
    required this.id,
    required this.name,
    required this.email,
    required this.phone,
    this.image,
    this.location,
    this.sex,
    required this.password,
    this.age,
    this.preferredLocation,
    this.Education,
    this.workExperience,
    required this.role,
    this.applications,
    this.favoriteJobs,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'name': name,
      'email': email,
      'phone': phone,
      'image': image,
      'location': location,
      'sex': sex,
      'password': password,
      'age': age,
      'preferredLocation': preferredLocation,
      'Education': Education,
      'workExperience': workExperience,
      'role': role,
      'applications': applications,
      'favoriteJobs': favoriteJobs,
    };
  }

  factory User.fromMap(Map<String, dynamic> map) {
    return User(
      id: map['_id'] ?? "",
      name: map['name'] ?? "",
      email: map['email'] ?? "",
      phone: map['phone'] ?? 0,
      image: map['image'] ?? "",
      location: map['location'] ?? "",
      sex: map['sex'] ?? "",
      password: map['password'] ?? "",
      age: map['age'] ?? "",
      preferredLocation: map['preferredLocation'],
      Education:
          map['Education'] != null ? List<String>.from(map['Education']) : [],
      workExperience: map['workExperience'] != null
          ? List<String>.from(map['workExperience'])
          : [],
      role: map['role'] ?? "job_seeker",
      applications: map['applications'] != null
          ? List<String>.from(map['applications'])
          : [],
      favoriteJobs: map['favoriteJobs'] != null
          ? List<Map<String, dynamic>>.from(
              (map['favoriteJobs']?.map((x) => Map<String, dynamic>.from(x))))
          : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory User.fromJson(String source) =>
      User.fromMap(json.decode(source) as Map<String, dynamic>);
}
