import '../models/experience_model.dart';
import '../models/skill_model.dart';
import '../models/project_model.dart';
import '../../../core/constants/app_constants.dart';

abstract class PortfolioLocalDataSource {
  Future<List<ExperienceModel>> getExperiences();
  Future<List<SkillModel>> getSkills();
  Future<List<ProjectModel>> getProjects();
  Future<String> getSummary();
  Future<Map<String, String>> getContactInfo();
}

class PortfolioLocalDataSourceImpl implements PortfolioLocalDataSource {
  @override
  Future<List<ExperienceModel>> getExperiences() async {
    // Simulate network delay
    await Future.delayed(const Duration(milliseconds: 100));
    
    return [
      const ExperienceModel(
        company: 'Cognizant',
        position: 'Sr. Software Engineer',
        duration: 'March 2025 - Present',
        description: 'Developing and maintaining scalable mobile applications using Native Android development and Flutter for enterprise and banking solutions.',
      ),
      const ExperienceModel(
        company: 'Alternative Tech Lab Pvt Ltd',
        position: 'Senior Mobile App Developer',
        duration: 'July 2024 - March 2025',
        description: 'Leading the development of product-based mobile applications, including e-commerce and booking platforms.',
      ),
      const ExperienceModel(
        company: 'Cognizant',
        position: 'Associate Project',
        duration: 'Aug 2021 - July 2024',
        description: 'Developed features for Personal Banking Application including remote cheque scanning and global search functionality.',
      ),
      const ExperienceModel(
        company: 'DLT Labs',
        position: 'Mobile Application Developer',
        duration: 'March 2021 - July 2021',
        description: 'Developed and maintained custom plugins to enhance application functionality and managed production code.',
      ),
      const ExperienceModel(
        company: 'Ongraph Technology',
        position: 'Mobile Application Developer',
        duration: 'Nov 2017 - Feb 2021',
        description: 'Developed IoT-based applications and enterprise expense management applications using Native Android and Flutter.',
      ),
    ];
  }

  @override
  Future<List<SkillModel>> getSkills() async {
    await Future.delayed(const Duration(milliseconds: 100));
    
    return [
      const SkillModel(
        name: 'Native Android Development',
        category: 'Languages & Frameworks',
        description: 'Java, Kotlin, Android SDK',
      ),
      const SkillModel(
        name: 'Flutter',
        category: 'Languages & Frameworks',
        description: 'Cross-platform development',
      ),
      const SkillModel(
        name: 'Clean Architecture',
        category: 'Architecture',
        description: 'MVVM, SOLID principles',
      ),
      const SkillModel(
        name: 'Testing',
        category: 'Testing',
        description: 'Unit Testing, Widget Testing, Integration Testing',
      ),
      const SkillModel(
        name: 'APIs & Databases',
        category: 'Backend',
        description: 'REST APIs, Firebase, SQLite, GraphQL',
      ),
      const SkillModel(
        name: 'Version Control',
        category: 'Tools',
        description: 'Git, GitHub, Bitbucket',
      ),
      const SkillModel(
        name: 'Payment Integration',
        category: 'Other Skills',
        description: 'Razorpay, Stripe, In-App Purchases',
      ),
      const SkillModel(
        name: 'IoT Integration',
        category: 'Other Skills',
        description: 'Bluetooth Device Integration',
      ),
    ];
  }

  @override
  Future<List<ProjectModel>> getProjects() async {
    await Future.delayed(const Duration(milliseconds: 100));
    
    return [
      const ProjectModel(
        name: 'Personal Banking Application',
        description: 'Developed features including remote cheque scanning, global search functionality, and multi-account management.',
        technologies: 'Native Android, Java, Kotlin',
      ),
      const ProjectModel(
        name: 'Corporate Banking Application',
        description: 'Feature development and task distribution across the team with code reviews and compliance standards.',
        technologies: 'Native Android, Clean Architecture',
      ),
      const ProjectModel(
        name: 'IoT-Based Application',
        description: 'Bluetooth-enabled application for device locking/unlocking functionality.',
        technologies: 'Native Android, Bluetooth SDK',
      ),
      const ProjectModel(
        name: 'Enterprise Expense Management',
        description: 'Expense and report management application with GPS trip monitoring.',
        technologies: 'Flutter, GPS, Local Storage',
      ),
    ];
  }

  @override
  Future<String> getSummary() async {
    await Future.delayed(const Duration(milliseconds: 50));
    return AppConstants.summary;
  }

  @override
  Future<Map<String, String>> getContactInfo() async {
    await Future.delayed(const Duration(milliseconds: 50));
    return {
      'name': AppConstants.name,
      'title': AppConstants.title,
      'subtitle': AppConstants.subtitle,
      'phone': AppConstants.phone,
      'email': AppConstants.email,
      'github': AppConstants.githubUrl,
      'linkedin': AppConstants.linkedinUrl,
    };
  }
}