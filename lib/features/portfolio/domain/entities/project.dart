import 'package:equatable/equatable.dart';

class Project extends Equatable {
  final String name;
  final String description;
  final String technologies;
  final String? githubUrl;
  final String? liveUrl;

  const Project({
    required this.name,
    required this.description,
    required this.technologies,
    this.githubUrl,
    this.liveUrl,
  });

  @override
  List<Object?> get props => [name, description, technologies, githubUrl, liveUrl];
}