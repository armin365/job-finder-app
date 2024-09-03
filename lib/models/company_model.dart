import 'dart:convert';

class Company {
  final String id;
  final String name;
  final String email;
  final String password;
  final String? website;
  final String? description;
  final String? industry;
  final String? location;
  final String? contactEmail;
  final int? contactPhone;
  final String? logo;

  Company({
    required this.id,
    required this.name,
    required this.email,
    required this.password,
    this.website,
    this.description,
    this.industry,
    this.location,
    this.contactEmail,
    this.contactPhone,
    this.logo,
  });

  // Factory constructor to create a Company from JSON
  factory Company.fromMap(Map<String, dynamic> map) {
    return Company(
      id: map['_id'] ?? '',
      name: map['name'] ?? '',
      email: map['email'] ?? '',
      password: map['password'] ?? '',
      website: map['website'] ?? '',
      description: map['description'] ?? '',
      industry: map['industry'] ?? '',
      location: map['location'] ?? '',
      contactEmail: map['contactEmail'] ?? '',
      contactPhone: map['contactPhone'] ?? '',
      logo: map['logo'] ?? '',
    );
  }

  // Method to convert a Company instance to JSON
  Map<String, dynamic> toMap() {
    return {
      '_id': id,
      'name': name,
      'email': email,
      'password': password,
      'website': website,
      'description': description,
      'industry': industry,
      'location': location,
      'contactEmail': contactEmail,
      'contactPhone': contactPhone,
      'logo': logo,
    };
  }

  String toJson() => json.encode(toMap());

  factory Company.fromJson(String source) =>
      Company.fromMap(json.decode(source) as Map<String, dynamic>);
}
