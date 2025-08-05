import '../../domain/entities/skill.dart';

class SkillModel extends Skill {
  const SkillModel({
    required super.name,
    required super.category,
    required super.description,
  });

  factory SkillModel.fromJson(Map<String, dynamic> json) {
    return SkillModel(
      name: json['name'] ?? '',
      category: json['category'] ?? '',
      description: json['description'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'category': category,
      'description': description,
    };
  }
}