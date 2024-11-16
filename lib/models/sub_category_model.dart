import 'dart:convert';

// ignore_for_file: public_member_api_docs, sort_constructors_first
class SubCategory {
  final String id;
  final String name;

  SubCategory({
    required this.id,
    required this.name,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'name': name,
    };
  }

  factory SubCategory.fromMap(Map<String, dynamic> map) {
    return SubCategory(
      id: map['_id'] ?? '',
      name: map['name'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory SubCategory.fromJson(String source) =>
      SubCategory.fromMap(json.decode(source) as Map<String, dynamic>);
}
