import '../entities/experience.dart';
import '../entities/skill.dart';
import '../entities/project.dart';

abstract class PortfolioRepository {
  Future<List<Experience>> getExperiences();
  Future<List<Skill>> getSkills();
  Future<List<Project>> getProjects();
  Future<String> getSummary();
  Future<Map<String, String>> getContactInfo();
}
