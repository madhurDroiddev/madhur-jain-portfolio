import 'package:cloud_firestore/cloud_firestore.dart';
import '../datasources/portfolio_local_datasource.dart';

class PortfolioBootstrapService {
  final FirebaseFirestore firestore;
  final PortfolioLocalDataSource localDataSource;

  PortfolioBootstrapService({
    FirebaseFirestore? firestore,
    required this.localDataSource,
  }) : firestore = firestore ?? FirebaseFirestore.instance;

  /// Seeds Firestore with default portfolio data if empty.
  /// Idempotent: skips if `portfolio/v1/meta/about` already exists.
  Future<void> seedIfEmpty() async {
    final DocumentReference<Map<String, dynamic>> versionDoc =
        firestore.collection('portfolio').doc('v1');

    final DocumentSnapshot<Map<String, dynamic>> aboutDoc =
        await versionDoc.collection('meta').doc('about').get();
    if (aboutDoc.exists) {
      return; // Already seeded
    }

    final String summary = await localDataSource.getSummary();
    final Map<String, String> contact = await localDataSource.getContactInfo();
    final experiences = await localDataSource.getExperiences();
    final skills = await localDataSource.getSkills();
    final projects = await localDataSource.getProjects();

    final WriteBatch batch = firestore.batch();

    // Meta
    batch.set(versionDoc.collection('meta').doc('about'), {
      'summary': summary,
    });
    batch.set(versionDoc.collection('meta').doc('contact'), {
      'name': contact['name'] ?? '',
      'title': contact['title'] ?? '',
      'subtitle': contact['subtitle'] ?? '',
      'phone': contact['phone'] ?? '',
      'email': contact['email'] ?? '',
      'github': contact['github'] ?? '',
      'linkedin': contact['linkedin'] ?? '',
    });

    // Experiences
    for (int i = 0; i < experiences.length; i++) {
      final data = experiences[i].toJson();
      data['order'] = i + 1;
      batch.set(versionDoc.collection('experiences').doc(), data);
    }

    // Skills
    for (int i = 0; i < skills.length; i++) {
      final data = skills[i].toJson();
      data['order'] = i + 1;
      batch.set(versionDoc.collection('skills').doc(), data);
    }

    // Projects
    for (int i = 0; i < projects.length; i++) {
      final data = projects[i].toJson();
      data['order'] = i + 1;
      batch.set(versionDoc.collection('projects').doc(), data);
    }

    await batch.commit();
  }
}
