class Experience {
  final String company;
  final String position;
  final String duration;
  final String description;
  final List<String> achievements;

  Experience({
    required this.company,
    required this.position,
    required this.duration,
    required this.description,
    required this.achievements,
  });
}

class Skill {
  final String name;
  final String category;
  final double proficiency;

  Skill({
    required this.name,
    required this.category,
    required this.proficiency,
  });
}

class Project {
  final String name;
  final String description;
  final String technology;
  final String? link;

  Project({
    required this.name,
    required this.description,
    required this.technology,
    this.link,
  });
}

class PortfolioData {
  static const String name = "MADHUR JAIN";
  static const String title = "MOBILE APPLICATION DEVELOPER";
  static const String subtitle = "(NATIVE ANDROID DEVELOPER AND FLUTTER)";
  static const String phone = "+91-8287567816";
  static const String email = "madhur.jain1394@gmail.com";
  
  static const String summary = "Results-driven Senior Mobile App Developer with expertise in Native Android development and Flutter. Skilled in designing and developing scalable cross-platform apps, optimizing code, and building reusable components. Proven leadership in managing Flutter teams, maintaining production code, and delivering high-quality solutions across banking, food delivery, and enterprise domains. Passionate about problem-solving, team collaboration, and continuous learning to drive impactful results.";

  static const List<String> education = [
    "Master of Computer Application (2014-2017) - Aligarh College of Engineering and Technology",
    "Bachelor of Computer Application (2010-2013) - Institute of Information Management and Technology"
  ];

  static const List<String> achievements = [
    "Super Node of the team - Ongraph Technology (AUG 2019) - Recognition for leadership and impactful delivery",
    "Cognizant Cheers Award - Cognizant (July 2022) - Recognized for exceptional contributions to mobile app delivery"
  ];

  static const List<Experience> experiences = [
    Experience(
      company: "Cognizant",
      position: "Sr. Software Engineer",
      duration: "March 2025 - Present",
      description: "Developing and maintaining scalable mobile applications using Native Android development and Flutter skills for enterprise and banking solutions. Staying updated with Mobile advancements and contributing to internal knowledge sharing and technical discussions.",
      achievements: [
        "Leading mobile app development for enterprise solutions",
        "Contributing to technical discussions and knowledge sharing"
      ],
    ),
    Experience(
      company: "Alternative Tech Lab Pvt Ltd",
      position: "Senior Mobile App Developer",
      duration: "July 2024 - March 2025",
      description: "Leading the development of product-based mobile applications, including e-commerce and booking platforms. Advocating for clean architecture and test-driven development (TDD) principles, enhancing overall code quality.",
      achievements: [
        "Led development of e-commerce and booking platforms",
        "Implemented clean architecture and TDD principles"
      ],
    ),
    Experience(
      company: "Cognizant",
      position: "Associate Project",
      duration: "Aug 2021 - July 2024",
      description: "Project 1: Personal Banking Application - Developed features from scratch, including remote cheque scanning, global search functionality, and multi-account management. Project 2: Corp. Banking Application - Feature development and task distribution across the team.",
      achievements: [
        "Developed remote cheque scanning functionality",
        "Implemented global search and multi-account management",
        "Conducted code reviews and ensured compliance"
      ],
    ),
    Experience(
      company: "DLT Labs",
      position: "Mobile Application Developer",
      duration: "March 2021 - July 2021",
      description: "Developed and maintained custom plugins to enhance application functionality and managed production code through efficient debugging. Engaged in Mobile App development discussions to stay current with best practices.",
      achievements: [
        "Developed custom plugins for enhanced functionality",
        "Contributed to technical blogs and developer community"
      ],
    ),
    Experience(
      company: "Ongraph Technology",
      position: "Mobile Application Developer",
      duration: "Nov 2017 - Feb 2021",
      description: "Project 1: IoT-Based Application - Developed a Bluetooth-enabled application for device locking/unlocking functionality. Project 2: Enterprise Expense Management Application - Built an expense and report management application with GPS trip monitoring using Flutter.",
      achievements: [
        "Developed Bluetooth-enabled IoT application",
        "Built enterprise expense management app with GPS monitoring",
        "Designed reusable components for multiple projects"
      ],
    ),
  ];

  static const List<Skill> skills = [
    // Languages & Frameworks
    Skill(name: "Java", category: "Languages & Frameworks", proficiency: 0.95),
    Skill(name: "Kotlin", category: "Languages & Frameworks", proficiency: 0.90),
    Skill(name: "Flutter", category: "Languages & Frameworks", proficiency: 0.95),
    Skill(name: "Dart", category: "Languages & Frameworks", proficiency: 0.90),
    
    // Architecture
    Skill(name: "Clean Architecture", category: "Architecture", proficiency: 0.90),
    Skill(name: "MVVM", category: "Architecture", proficiency: 0.85),
    
    // Testing
    Skill(name: "Unit Testing", category: "Testing", proficiency: 0.80),
    Skill(name: "Widget Testing", category: "Testing", proficiency: 0.85),
    Skill(name: "Integration Testing", category: "Testing", proficiency: 0.75),
    
    // APIs & Databases
    Skill(name: "REST APIs", category: "APIs & Databases", proficiency: 0.90),
    Skill(name: "Firebase", category: "APIs & Databases", proficiency: 0.85),
    Skill(name: "SQLite", category: "APIs & Databases", proficiency: 0.80),
    Skill(name: "GraphQL", category: "APIs & Databases", proficiency: 0.70),
    
    // Version Control & CI/CD
    Skill(name: "Git", category: "Version Control & CI/CD", proficiency: 0.90),
    Skill(name: "GitHub", category: "Version Control & CI/CD", proficiency: 0.85),
    Skill(name: "Bitbucket", category: "Version Control & CI/CD", proficiency: 0.80),
    
    // Other Skills
    Skill(name: "Payment Gateway Integration", category: "Other Skills", proficiency: 0.85),
    Skill(name: "Bluetooth Device Integration", category: "Other Skills", proficiency: 0.80),
    Skill(name: "Agile/Scrum", category: "Other Skills", proficiency: 0.85),
  ];

  static const List<Project> projects = [
    Project(
      name: "Personal Banking Application",
      description: "Developed features including remote cheque scanning, global search functionality, and multi-account management using Native Android SDK.",
      technology: "Native Android, Java, Kotlin",
    ),
    Project(
      name: "Corp. Banking Application",
      description: "Feature development and task distribution across the team with code reviews and compliance standards.",
      technology: "Native Android, Clean Architecture",
    ),
    Project(
      name: "IoT-Based Application",
      description: "Developed a Bluetooth-enabled application for device locking/unlocking functionality using Native Android development.",
      technology: "Native Android, Bluetooth SDK, IoT",
    ),
    Project(
      name: "Enterprise Expense Management Application",
      description: "Built an expense and report management application with GPS trip monitoring using Flutter for Android and iOS.",
      technology: "Flutter, Dart, GPS, SQLite",
    ),
  ];
}