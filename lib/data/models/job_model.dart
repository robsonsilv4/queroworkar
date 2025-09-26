import 'package:equatable/equatable.dart';
import 'package:quero_workar/data/models/models.dart';

class Job extends Equatable {
  const Job({
    required this.id,
    required this.url,
    required this.company,
    required this.title,
    required this.description,
    required this.date,
  });

  factory Job.fromJson(Map<String, dynamic> json) => Job(
    id: json['id'] as String,
    url: json['url'] as String,
    company: Company.fromJson(json['company'] as Map<String, dynamic>),
    title: json['title'] as String,
    description: json['description'] as String,
    date: DateTime.parse(json['date'] as String),
  );

  static final empty = Job(
    id: '',
    url: '',
    company: Company.empty,
    title: '',
    description: '',
    date: DateTime.now(),
  );

  final String id;
  final String url;
  final Company company;
  final String title;
  final String description;
  final DateTime date;

  Map<String, dynamic> toJson() => {
    'id': id,
    'url': url,
    'company': company.toJson(),
    'title': title,
    'description': description,
    'date': date.toIso8601String(),
  };

  @override
  List<Object?> get props => [id, url, company, title, description, date];
}
