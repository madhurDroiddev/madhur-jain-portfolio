import 'package:flutter/material.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'package:provider/provider.dart';
import '../services/theme_service.dart';
import '../widgets/header_widget.dart';
import '../widgets/about_section.dart';
import '../widgets/experience_section.dart';
import '../widgets/skills_section.dart';
import '../widgets/projects_section.dart';
import '../widgets/contact_section.dart';
import '../widgets/footer_widget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final ScrollController _scrollController = ScrollController();
  int _currentIndex = 0;

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  void _scrollToSection(int index) {
    final sections = [
      _aboutKey,
      _experienceKey,
      _skillsKey,
      _projectsKey,
      _contactKey,
    ];
    
    if (index < sections.length && sections[index].currentContext != null) {
      final RenderBox renderBox = sections[index].currentContext!.findRenderObject() as RenderBox;
      final position = renderBox.localToGlobal(Offset.zero);
      _scrollController.animateTo(
        position.dy - 100,
        duration: const Duration(milliseconds: 800),
        curve: Curves.easeInOut,
      );
    }
  }

  final GlobalKey _aboutKey = GlobalKey();
  final GlobalKey _experienceKey = GlobalKey();
  final GlobalKey _skillsKey = GlobalKey();
  final GlobalKey _projectsKey = GlobalKey();
  final GlobalKey _contactKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    final isDesktop = ResponsiveWrapper.of(context).isDesktop;
    final isTablet = ResponsiveWrapper.of(context).isTablet;
    final isMobile = ResponsiveWrapper.of(context).isMobile;

    return Scaffold(
      appBar: isDesktop ? null : AppBar(
        title: const Text('Madhur Jain'),
        backgroundColor: Theme.of(context).colorScheme.surface,
        elevation: 0,
        actions: [
          IconButton(
            icon: Consumer<ThemeService>(
              builder: (context, themeService, child) {
                return Icon(
                  themeService.isDarkMode ? Icons.light_mode : Icons.dark_mode,
                );
              },
            ),
            onPressed: () {
              context.read<ThemeService>().toggleTheme();
            },
          ),
        ],
      ),
      drawer: isDesktop ? null : Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
              child: Text(
                'Madhur Jain',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                ),
              ),
            ),
            ListTile(
              title: const Text('About'),
              onTap: () => _scrollToSection(0),
            ),
            ListTile(
              title: const Text('Experience'),
              onTap: () => _scrollToSection(1),
            ),
            ListTile(
              title: const Text('Skills'),
              onTap: () => _scrollToSection(2),
            ),
            ListTile(
              title: const Text('Projects'),
              onTap: () => _scrollToSection(3),
            ),
            ListTile(
              title: const Text('Contact'),
              onTap: () => _scrollToSection(4),
            ),
          ],
        ),
      ),
      body: Row(
        children: [
          // Desktop Navigation
          if (isDesktop)
            Container(
              width: 250,
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.surface,
                border: Border(
                  right: BorderSide(
                    color: Theme.of(context).dividerColor,
                  ),
                ),
              ),
              child: Column(
                children: [
                  const SizedBox(height: 40),
                  // Profile Section
                  Container(
                    padding: const EdgeInsets.all(20),
                    child: Column(
                      children: [
                        CircleAvatar(
                          radius: 50,
                          backgroundColor: Colors.blue,
                          child: Text(
                            'MJ',
                            style: TextStyle(
                              fontSize: 32,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                        ),
                        const SizedBox(height: 16),
                        const Text(
                          'Madhur Jain',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 8),
                        const Text(
                          'Mobile App Developer',
                          style: TextStyle(
                            fontSize: 14,
                            color: Colors.grey,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const Divider(),
                  // Navigation Menu
                  Expanded(
                    child: ListView(
                      padding: const EdgeInsets.symmetric(vertical: 16),
                      children: [
                        _buildNavItem('About', Icons.person, 0),
                        _buildNavItem('Experience', Icons.work, 1),
                        _buildNavItem('Skills', Icons.code, 2),
                        _buildNavItem('Projects', Icons.folder, 3),
                        _buildNavItem('Contact', Icons.contact_mail, 4),
                      ],
                    ),
                  ),
                  // Theme Toggle
                  Padding(
                    padding: const EdgeInsets.all(16),
                    child: Consumer<ThemeService>(
                      builder: (context, themeService, child) {
                        return SwitchListTile(
                          title: const Text('Dark Mode'),
                          value: themeService.isDarkMode,
                          onChanged: (value) {
                            themeService.toggleTheme();
                          },
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          // Main Content
          Expanded(
            child: SingleChildScrollView(
              controller: _scrollController,
              child: Column(
                children: [
                  // Header Section
                  HeaderWidget(),
                  
                  // About Section
                  Container(key: _aboutKey, child: const AboutSection()),
                  
                  // Experience Section
                  Container(key: _experienceKey, child: const ExperienceSection()),
                  
                  // Skills Section
                  Container(key: _skillsKey, child: const SkillsSection()),
                  
                  // Projects Section
                  Container(key: _projectsKey, child: const ProjectsSection()),
                  
                  // Contact Section
                  Container(key: _contactKey, child: const ContactSection()),
                  
                  // Footer
                  const FooterWidget(),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildNavItem(String title, IconData icon, int index) {
    return ListTile(
      leading: Icon(icon),
      title: Text(title),
      selected: _currentIndex == index,
      onTap: () {
        setState(() {
          _currentIndex = index;
        });
        _scrollToSection(index);
      },
    );
  }
}