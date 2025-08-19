import 'package:cloud_firestore/cloud_firestore.dart';
import '../models/experience_model.dart';
import '../models/skill_model.dart';
import '../models/project_model.dart';

abstract class PortfolioRemoteDataSource {
  Future<List<ExperienceModel>> getExperiences();
  Future<List<SkillModel>> getSkills();
  Future<List<ProjectModel>> getProjects();
  Future<String> getSummary();
  Future<Map<String, String>> getContactInfo();
}

class PortfolioRemoteDataSourceImpl implements PortfolioRemoteDataSource {
  final FirebaseFirestore firestore;

  PortfolioRemoteDataSourceImpl({FirebaseFirestore? firestore})
      : firestore = firestore ?? FirebaseFirestore.instance;

  @override
  Future<List<ExperienceModel>> getExperiences() async {
    final query = await firestore
        .collection('portfolio')
        .doc('v1')
        .collection('experiences')
        .orderBy('order', descending: false)
        .get();
    return query.docs
        .map((d) => ExperienceModel.fromJson(d.data()))
        .toList(growable: false);
  }

  @override
  Future<List<SkillModel>> getSkills() async {
    final query = await firestore
        .collection('portfolio')
        .doc('v1')
        .collection('skills')
        .orderBy('order', descending: false)
        .get();
    return query.docs
        .map((d) => SkillModel.fromJson(d.data()))
        .toList(growable: false);
  }

  @override
  Future<List<ProjectModel>> getProjects() async {
    final query = await firestore
        .collection('portfolio')
        .doc('v1')
        .collection('projects')
        .orderBy('order', descending: false)
        .get();
    return query.docs
        .map((d) => ProjectModel.fromJson(d.data()))
        .toList(growable: false);
  }

  @override
  Future<String> getSummary() async {
    final doc = await firestore
        .collection('portfolio')
        .doc('v1')
        .collection('meta')
        .doc('about')
        .get();
    final data = doc.data();
    return (data?['summary'] as String?) ?? '';
  }

  @override
  Future<Map<String, String>> getContactInfo() async {
    final doc = await firestore
        .collection('portfolio')
        .doc('v1')
        .collection('meta')
        .doc('contact')
        .get();
    final data = doc.data() ?? {};
    return {
      'name': (data['name'] as String?) ?? '',
      'title': (data['title'] as String?) ?? '',
      'subtitle': (data['subtitle'] as String?) ?? '',
      'phone': (data['phone'] as String?) ?? '',
      'email': (data['email'] as String?) ?? '',
      'github': (data['github'] as String?) ?? '',
      'linkedin': (data['linkedin'] as String?) ?? '',
    };
  }
}
