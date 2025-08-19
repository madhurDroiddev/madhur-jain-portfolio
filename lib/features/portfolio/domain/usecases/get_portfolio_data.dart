import '../repositories/portfolio_repository.dart';

class GetPortfolioData {
  final PortfolioRepository repository;

  GetPortfolioData(this.repository);

  Future<Map<String, dynamic>> call() async {
    final experiences = await repository.getExperiences();
    final skills = await repository.getSkills();
    final projects = await repository.getProjects();
    final summary = await repository.getSummary();
    final contactInfo = await repository.getContactInfo();

    return {
      'experiences': experiences,
      'skills': skills,
      'projects': projects,
      'summary': summary,
      'contactInfo': contactInfo,
    };
  }
}
