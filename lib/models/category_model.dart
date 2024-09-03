import 'dart:convert';

// ignore_for_file: public_member_api_docs, sort_constructors_first
class JobCategory {
  final String id;
  final String name;
  final String description;
  final String image;
  
  JobCategory({
    required this.id,
    required this.name,
    required this.description,
    required this.image,
   
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'name': name,
      'description': description,
      'image': image,
      
    };
  }

  factory JobCategory.fromMap(Map<String, dynamic> map) {
    return JobCategory(
      id: map['_id'] ?? "",
      name: map['name'] ?? "",
      description: map['description'] ?? '',
      image: map['image'] ?? '',
     
    );
  }

  String toJson() => json.encode(toMap());

  factory JobCategory.fromJson(String source) =>
      JobCategory.fromMap(json.decode(source) as Map<String, dynamic>);
}
