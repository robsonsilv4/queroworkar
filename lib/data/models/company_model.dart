import 'package:equatable/equatable.dart';

class Company extends Equatable {
  const Company({
    required this.id,
    required this.name,
    required this.category,
    required this.location,
    required this.imageUrl,
  });

  factory Company.fromJson(Map<String, dynamic> json) => Company(
    id: json['id'] as String,
    name: json['name'] as String,
    category: json['category'] as String,
    location: json['location'] as String,
    imageUrl: json['imageUrl'] as String,
  );

  static const empty = Company(
    id: '',
    name: '',
    category: '',
    location: '',
    imageUrl: '',
  );

  final String id;
  final String name;
  final String category;
  final String location;
  final String imageUrl;

  Map<String, dynamic> toJson() => {
    'id': id,
    'name': name,
    'category': category,
    'location': location,
    'imageUrl': imageUrl,
  };

  @override
  List<Object?> get props => [id, name, category, location, imageUrl];
}
