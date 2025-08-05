import '../../domain/entities/project.dart';

class ProjectModel extends Project {
  const ProjectModel({
    required super.name,
    required super.description,
    required super.technologies,
    super.githubUrl,
    super.liveUrl,
  });

  factory ProjectModel.fromJson(Map<String, dynamic> json) {
    return ProjectModel(
      name: json['name'] ?? '',
      description: json['description'] ?? '',
      technologies: json['technologies'] ?? '',
      githubUrl: json['githubUrl'],
      liveUrl: json['liveUrl'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'description': description,
      'technologies': technologies,
      'githubUrl': githubUrl,
      'liveUrl': liveUrl,
    };
  }
}