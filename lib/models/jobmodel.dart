import 'dart:convert';

class Job {
  final String title;
  final String description;
  final String company;
  final String location;
  final double salary;
  final String jobtype;
  final String? id;
  final String category;
  final String profile;
  final DateTime postedDate;

  Job( {
    required this.title,
    required this.description,
    required this.company,
    required this.location,
    required this.salary,
    required this.jobtype,
    this.id,
    required this.category,
    required this.profile,
    required this.postedDate,
  });

  Map<String, dynamic> toMap() {
    return {
      'title': title,
      'description': description,
      'company': company,
      'location': location,
      'salary': salary,
      'jobtype': jobtype,
      'category': category,
      'profile': profile,
      'postedDate': postedDate,
      'id': id,
    };
  }

  factory Job.fromMap(Map<String, dynamic> map) {
    return Job(
      title: map['title'] ?? '',
      description: map['description'] ?? '',
      company: map['company'] ?? '',
      location: map['location'] ?? '',
      salary: map['salary']?.toDouble() ?? 0.0,
      jobtype: map['jobtype'] ?? '',
      id: map['id'],
      category: map['category'] ?? '',
      profile: map['profile'] ?? '',
      postedDate: map['postedDate'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory Job.fromJson(String source) => Job.fromMap(json.decode(source));
}