import 'package:equatable/equatable.dart';

class Job extends Equatable {
  const Job({
    required this.image,
    required this.title,
    required this.description,
    required this.date,
    required this.url,
  });

  factory Job.fromJson(Map<String, dynamic> json) => Job(
        image: json['image'] as String,
        title: json['title'] as String,
        description: json['description'] as String,
        date: DateTime.parse(json['date'] as String),
        url: json['url'] as String,
      );

  static final empty = Job(
    image: '',
    title: '',
    description: '',
    date: DateTime.now(),
    url: '',
  );

  final String image;
  final String title;
  final String description;
  final DateTime date;
  final String url;

  Map<String, dynamic> toJson() => {
        'image': image,
        'title': title,
        'description': description,
        'date': date.toIso8601String(),
        'url': url,
      };

  @override
  List<Object?> get props => [image, title, description, date, url];
}
