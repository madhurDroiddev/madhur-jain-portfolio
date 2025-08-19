// Run with: dart run scripts/seed_firestore.dart
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import '../lib/firebase_options.dart';

Future<void> main() async {
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  final firestore = FirebaseFirestore.instance;

  final batch = firestore.batch();
  final root = firestore.collection('portfolio').doc('v1');

  // Meta: about
  batch.set(root.collection('meta').doc('about'), {
    'summary':
        'Results-driven Senior Mobile App Developer with expertise in Native Android and Flutter...'
  });

  // Meta: contact
  batch.set(root.collection('meta').doc('contact'), {
    'name': 'Madhur Jain',
    'title': 'Mobile Application Developer',
    'subtitle': 'Native Android & Flutter Developer',
    'phone': '+91-8287567816',
    'email': 'madhur.jain1394@gmail.com',
    'github': 'https://github.com/madhurDroiddev',
    'linkedin': 'https://linkedin.com/in/madhur-jain',
  });

  // Experiences (order is ascending)
  final experiences = [
    {
      'order': 1,
      'company': 'Cognizant',
      'position': 'Sr. Software Engineer',
      'duration': 'March 2025 - Present',
      'description':
          'Developing and maintaining scalable mobile applications using Native Android development and Flutter for enterprise and banking solutions.',
    },
    {
      'order': 2,
      'company': 'Alternative Tech Lab Pvt Ltd',
      'position': 'Senior Mobile App Developer',
      'duration': 'July 2024 - March 2025',
      'description':
          'Leading the development of product-based mobile applications, including e-commerce and booking platforms.',
    },
    {
      'order': 3,
      'company': 'Cognizant',
      'position': 'Associate Project',
      'duration': 'Aug 2021 - July 2024',
      'description':
          'Developed features for Personal Banking Application including remote cheque scanning and global search functionality.',
    },
    {
      'order': 4,
      'company': 'DLT Labs',
      'position': 'Mobile Application Developer',
      'duration': 'March 2021 - July 2021',
      'description':
          'Developed and maintained custom plugins to enhance application functionality and managed production code.',
    },
    {
      'order': 5,
      'company': 'Ongraph Technology',
      'position': 'Mobile Application Developer',
      'duration': 'Nov 2017 - Feb 2021',
      'description':
          'Developed IoT-based applications and enterprise expense management applications using Native Android and Flutter.',
    },
  ];
  for (final exp in experiences) {
    final doc = root.collection('experiences').doc();
    batch.set(doc, exp);
  }

  // Skills
  final skills = [
    {
      'order': 1,
      'name': 'Native Android Development',
      'category': 'Languages & Frameworks',
      'description': 'Java, Kotlin, Android SDK',
    },
    {
      'order': 2,
      'name': 'Flutter',
      'category': 'Languages & Frameworks',
      'description': 'Cross-platform development',
    },
    {
      'order': 3,
      'name': 'Clean Architecture',
      'category': 'Architecture',
      'description': 'MVVM, SOLID principles',
    },
    {
      'order': 4,
      'name': 'Testing',
      'category': 'Testing',
      'description': 'Unit Testing, Widget Testing, Integration Testing',
    },
    {
      'order': 5,
      'name': 'APIs & Databases',
      'category': 'Backend',
      'description': 'REST APIs, Firebase, SQLite, GraphQL',
    },
    {
      'order': 6,
      'name': 'Version Control',
      'category': 'Tools',
      'description': 'Git, GitHub, Bitbucket',
    },
    {
      'order': 7,
      'name': 'Payment Integration',
      'category': 'Other Skills',
      'description': 'Razorpay, Stripe, In-App Purchases',
    },
    {
      'order': 8,
      'name': 'IoT Integration',
      'category': 'Other Skills',
      'description': 'Bluetooth Device Integration',
    },
  ];
  for (final s in skills) {
    final doc = root.collection('skills').doc();
    batch.set(doc, s);
  }

  // Projects
  final projects = [
    {
      'order': 1,
      'name': 'Personal Banking Application',
      'description':
          'Developed features including remote cheque scanning, global search functionality, and multi-account management.',
      'technologies': 'Native Android, Java, Kotlin',
    },
    {
      'order': 2,
      'name': 'Corporate Banking Application',
      'description':
          'Feature development and task distribution across the team with code reviews and compliance standards.',
      'technologies': 'Native Android, Clean Architecture',
    },
    {
      'order': 3,
      'name': 'IoT-Based Application',
      'description':
          'Bluetooth-enabled application for device locking/unlocking functionality.',
      'technologies': 'Native Android, Bluetooth SDK',
    },
    {
      'order': 4,
      'name': 'Enterprise Expense Management',
      'description':
          'Expense and report management application with GPS trip monitoring.',
      'technologies': 'Flutter, GPS, Local Storage',
    },
  ];
  for (final p in projects) {
    final doc = root.collection('projects').doc();
    batch.set(doc, p);
  }

  await batch.commit();
  // ignore: avoid_print
  print('Seeded Firestore with portfolio data under portfolio/v1');
}
