import '../../domain/entities/experience.dart';

class ExperienceModel extends Experience {
  const ExperienceModel({
    required super.company,
    required super.position,
    required super.duration,
    required super.description,
  });

  factory ExperienceModel.fromJson(Map<String, dynamic> json) {
    return ExperienceModel(
      company: json['company'] ?? '',
      position: json['position'] ?? '',
      duration: json['duration'] ?? '',
      description: json['description'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'company': company,
      'position': position,
      'duration': duration,
      'description': description,
    };
  }
}