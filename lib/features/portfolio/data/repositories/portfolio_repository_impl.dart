import '../../domain/repositories/portfolio_repository.dart';
import '../../domain/entities/experience.dart';
import '../../domain/entities/skill.dart';
import '../../domain/entities/project.dart';
import '../datasources/portfolio_local_datasource.dart';

class PortfolioRepositoryImpl implements PortfolioRepository {
  final PortfolioLocalDataSource localDataSource;

  PortfolioRepositoryImpl(this.localDataSource);

  @override
  Future<List<Experience>> getExperiences() async {
    try {
      final experiences = await localDataSource.getExperiences();
      return experiences;
    } catch (e) {
      throw Exception('Failed to load experiences: $e');
    }
  }

  @override
  Future<List<Skill>> getSkills() async {
    try {
      final skills = await localDataSource.getSkills();
      return skills;
    } catch (e) {
      throw Exception('Failed to load skills: $e');
    }
  }

  @override
  Future<List<Project>> getProjects() async {
    try {
      final projects = await localDataSource.getProjects();
      return projects;
    } catch (e) {
      throw Exception('Failed to load projects: $e');
    }
  }

  @override
  Future<String> getSummary() async {
    try {
      return await localDataSource.getSummary();
    } catch (e) {
      throw Exception('Failed to load summary: $e');
    }
  }

  @override
  Future<Map<String, String>> getContactInfo() async {
    try {
      return await localDataSource.getContactInfo();
    } catch (e) {
      throw Exception('Failed to load contact info: $e');
    }
  }
}