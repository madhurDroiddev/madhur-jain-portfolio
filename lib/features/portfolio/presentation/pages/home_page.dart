import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../../../core/constants/app_constants.dart';
import '../bloc/portfolio_bloc.dart';
import '../../../../features/theme/presentation/bloc/theme_bloc.dart';
import '../widgets/header_widget.dart';
import '../widgets/about_section.dart';
import '../widgets/experience_section.dart';
import '../widgets/skills_section.dart';
import '../widgets/projects_section.dart';
import '../widgets/contact_section.dart';
import '../widgets/footer_widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final ScrollController _scrollController = ScrollController();
  int _currentIndex = 0;

  final List<GlobalKey> _sectionKeys = [
    GlobalKey(),
    GlobalKey(),
    GlobalKey(),
    GlobalKey(),
    GlobalKey(),
  ];

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  void _scrollToSection(int index) {
    if (index < _sectionKeys.length && _sectionKeys[index].currentContext != null) {
      final RenderBox renderBox = _sectionKeys[index].currentContext!.findRenderObject() as RenderBox;
      final position = renderBox.localToGlobal(Offset.zero);
      final screenHeight = MediaQuery.of(context).size.height;
      final offset = position.dy - (screenHeight * 0.15); // 15% from top
      
      if (_scrollController.hasClients) {
        _scrollController.animateTo(
          offset.clamp(0.0, _scrollController.position.maxScrollExtent),
          duration: AppConstants.longAnimation,
          curve: Curves.easeInOut,
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final isDesktop = ResponsiveWrapper.of(context).isDesktop;
    final isTablet = ResponsiveWrapper.of(context).isTablet;
    final isMobile = ResponsiveWrapper.of(context).isMobile;

    return Scaffold(
      appBar: isDesktop ? null : AppBar(
        title: const Text(AppConstants.name),
        backgroundColor: Theme.of(context).colorScheme.surface,
        elevation: 0,
        actions: [
          BlocBuilder<ThemeBloc, ThemeState>(
            builder: (context, state) {
              return IconButton(
                icon: Icon(
                  state is ThemeLoaded && state.theme.isDarkMode 
                      ? Icons.light_mode 
                      : Icons.dark_mode,
                ),
                onPressed: () {
                  context.read<ThemeBloc>().add(ToggleTheme());
                },
              );
            },
          ),
        ],
      ),
      drawer: isDesktop ? null : _buildDrawer(),
      body: Row(
        children: [
          // Desktop Navigation
          if (isDesktop) _buildDesktopNavigation(),
          
          // Main Content
          Expanded(
            child: BlocBuilder<PortfolioBloc, PortfolioState>(
              builder: (context, state) {
                if (state is PortfolioLoading) {
                  return const Center(child: CircularProgressIndicator());
                } else if (state is PortfolioLoaded) {
                  return _buildMainContent(state);
                } else if (state is PortfolioError) {
                  return Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Icon(Icons.error, size: 64, color: Colors.red),
                        const SizedBox(height: 16),
                        Text(
                          'Error: ${state.message}',
                          style: const TextStyle(fontSize: 16),
                        ),
                        const SizedBox(height: 16),
                        ElevatedButton(
                          onPressed: () {
                            context.read<PortfolioBloc>().add(LoadPortfolio());
                          },
                          child: const Text('Retry'),
                        ),
                      ],
                    ),
                  );
                }
                return const SizedBox.shrink();
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDrawer() {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          DrawerHeader(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [Color(AppConstants.primaryColor), Color(AppConstants.secondaryColor)],
              ),
            ),
            child: const Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CircleAvatar(
                  radius: 30,
                  backgroundColor: Colors.white,
                  child: Text(
                    'MJ',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Color(AppConstants.primaryColor),
                    ),
                  ),
                ),
                SizedBox(height: 12),
                Text(
                  AppConstants.name,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  AppConstants.title,
                  style: TextStyle(
                    color: Colors.white70,
                    fontSize: 14,
                  ),
                ),
              ],
            ),
          ),
          ListTile(
            leading: const Icon(Icons.person),
            title: const Text('About'),
            onTap: () => _scrollToSection(0),
          ),
          ListTile(
            leading: const Icon(Icons.work),
            title: const Text('Experience'),
            onTap: () => _scrollToSection(1),
          ),
          ListTile(
            leading: const Icon(Icons.code),
            title: const Text('Skills'),
            onTap: () => _scrollToSection(2),
          ),
          ListTile(
            leading: const Icon(Icons.folder),
            title: const Text('Projects'),
            onTap: () => _scrollToSection(3),
          ),
          ListTile(
            leading: const Icon(Icons.contact_mail),
            title: const Text('Contact'),
            onTap: () => _scrollToSection(4),
          ),
        ],
      ),
    );
  }

  Widget _buildDesktopNavigation() {
    return Container(
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
                  backgroundColor: const Color(AppConstants.primaryColor),
                  child: const Text(
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
                  AppConstants.name,
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 8),
                const Text(
                  AppConstants.title,
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
            child: BlocBuilder<ThemeBloc, ThemeState>(
              builder: (context, state) {
                return SwitchListTile(
                  title: const Text('Dark Mode'),
                  value: state is ThemeLoaded && state.theme.isDarkMode,
                  onChanged: (value) {
                    context.read<ThemeBloc>().add(ToggleTheme());
                  },
                );
              },
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

  Widget _buildMainContent(PortfolioLoaded state) {
    return SingleChildScrollView(
      controller: _scrollController,
      child: Column(
        children: [
          // Header Section
          HeaderWidget(contactInfo: state.contactInfo),
          
          // About Section
          Container(
            key: _sectionKeys[0],
            child: AboutSection(summary: state.summary),
          ),
          
          // Experience Section
          Container(
            key: _sectionKeys[1],
            child: ExperienceSection(experiences: state.experiences),
          ),
          
          // Skills Section
          Container(
            key: _sectionKeys[2],
            child: SkillsSection(skills: state.skills),
          ),
          
          // Projects Section
          Container(
            key: _sectionKeys[3],
            child: ProjectsSection(projects: state.projects),
          ),
          
          // Contact Section
          Container(
            key: _sectionKeys[4],
            child: ContactSection(contactInfo: state.contactInfo),
          ),
          
          // Footer
          FooterWidget(contactInfo: state.contactInfo),
        ],
      ),
    );
  }
}