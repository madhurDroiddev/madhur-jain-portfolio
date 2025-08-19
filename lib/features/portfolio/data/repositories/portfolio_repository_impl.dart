import '../../domain/repositories/portfolio_repository.dart';
import '../../domain/entities/experience.dart';
import '../../domain/entities/skill.dart';
import '../../domain/entities/project.dart';
import '../datasources/portfolio_local_datasource.dart';
import '../datasources/portfolio_remote_datasource.dart';

class PortfolioRepositoryImpl implements PortfolioRepository {
  final PortfolioLocalDataSource localDataSource;
  final PortfolioRemoteDataSource remoteDataSource;

  PortfolioRepositoryImpl(this.localDataSource, this.remoteDataSource);

  @override
  Future<List<Experience>> getExperiences() async {
    try {
      final experiences = await remoteDataSource.getExperiences();
      return experiences;
    } catch (e) {
      // Fallback to local static data
      final fallback = await localDataSource.getExperiences();
      return fallback;
    }
  }

  @override
  Future<List<Skill>> getSkills() async {
    try {
      final skills = await remoteDataSource.getSkills();
      return skills;
    } catch (e) {
      final fallback = await localDataSource.getSkills();
      return fallback;
    }
  }

  @override
  Future<List<Project>> getProjects() async {
    try {
      final projects = await remoteDataSource.getProjects();
      return projects;
    } catch (e) {
      final fallback = await localDataSource.getProjects();
      return fallback;
    }
  }

  @override
  Future<String> getSummary() async {
    try {
      return await remoteDataSource.getSummary();
    } catch (e) {
      return await localDataSource.getSummary();
    }
  }

  @override
  Future<Map<String, String>> getContactInfo() async {
    try {
      return await remoteDataSource.getContactInfo();
    } catch (e) {
      return await localDataSource.getContactInfo();
    }
  }
}
