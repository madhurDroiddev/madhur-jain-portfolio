import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:portfolio_app/generated/assets.dart';
import 'package:responsive_framework/responsive_framework.dart';
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
    if (index >= _sectionKeys.length) return;
    final contextForKey = _sectionKeys[index].currentContext;
    if (contextForKey == null) return;

    Scrollable.ensureVisible(
      contextForKey,
      duration: AppConstants.longAnimation,
      curve: Curves.easeInOut,
      alignment: 0.1,
    );
  }

  @override
  Widget build(BuildContext context) {
    final isDesktop = ResponsiveBreakpoints.of(context).isDesktop;

    return Scaffold(
      appBar: isDesktop
          ? null
          : AppBar(
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
                      crossAxisAlignment: CrossAxisAlignment.center,
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
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Theme.of(context).colorScheme.primary,
                  Theme.of(context).colorScheme.secondary,
                ],
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Theme.of(context).colorScheme.surface,
                    boxShadow: [
                      BoxShadow(
                        color: Theme.of(context).shadowColor.withOpacity(0.1),
                        blurRadius: 15,
                        offset: const Offset(0, 8),
                      ),
                    ],
                  ),
                  child: CircleAvatar(
                    radius: 30,
                    backgroundColor: Theme.of(context).colorScheme.surface,
                    backgroundImage: AssetImage(
                      "assets/images/profile_pic.jpg",
                    ),
                  ),
                ),
                const SizedBox(height: 12),
                Text(
                  AppConstants.name,
                  style: TextStyle(
                    color: Theme.of(context).colorScheme.onPrimary,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  AppConstants.title,
                  style: TextStyle(
                    color: Theme.of(context)
                        .colorScheme
                        .onPrimary
                        .withOpacity(0.8),
                    fontSize: 14,
                  ),
                ),
              ],
            ),
          ),
          ListTile(
            leading: SvgPicture.asset(
              Assets.svgsUser,
              width: 20,
              height: 20,
            ),
            title: const Text('About'),
            onTap: () {
              Navigator.of(context).pop();
              Future.delayed(
                  const Duration(milliseconds: 200), () => _scrollToSection(0));
            },
          ),
          ListTile(
            leading: SvgPicture.asset(
              Assets.svgsExp,
              width: 20,
              height: 20,
            ),
            title: const Text('Experience'),
            onTap: () {
              Navigator.of(context).pop();
              Future.delayed(
                  const Duration(milliseconds: 200), () => _scrollToSection(1));
            },
          ),
          ListTile(
            leading: SvgPicture.asset(
              Assets.svgsSkills,
              width: 20,
              height: 20,
            ),
            title: const Text('Skills'),
            onTap: () {
              Navigator.of(context).pop();
              Future.delayed(
                  const Duration(milliseconds: 200), () => _scrollToSection(2));
            },
          ),
          ListTile(
            leading: SvgPicture.asset(
              Assets.svgsProject,
              width: 20,
              height: 20,
            ),
            title: const Text('Projects'),
            onTap: () {
              Navigator.of(context).pop();
              Future.delayed(
                  const Duration(milliseconds: 200), () => _scrollToSection(3));
            },
          ),
          ListTile(
            leading: SvgPicture.asset(
              Assets.svgsContacts,
              width: 15,
              height: 15,
            ),
            title: const Text('Contact'),
            onTap: () {
              Navigator.of(context).pop();
              Future.delayed(
                  const Duration(milliseconds: 200), () => _scrollToSection(4));
            },
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
                Container(
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Theme.of(context).colorScheme.surface,
                    boxShadow: [
                      BoxShadow(
                        color: Theme.of(context).shadowColor.withOpacity(0.1),
                        blurRadius: 15,
                        offset: const Offset(0, 8),
                      ),
                    ],
                  ),
                  child: CircleAvatar(
                    radius: 50,
                    backgroundColor: const Color(AppConstants.primaryColor),
                    backgroundImage: AssetImage(
                      "assets/images/profile_pic.jpg",
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
                _buildNavItem('About', Assets.svgsUser, 0),
                _buildNavItem('Experience', Assets.svgsExp, 1),
                _buildNavItem('Skills', Assets.svgsSkills, 2),
                _buildNavItem('Projects', Assets.svgsProject, 3),
                _buildNavItem('Contact', Assets.svgsContacts, 4),
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

  Widget _buildNavItem(String title, String icon, int index) {
    return ListTile(
      leading: SvgPicture.asset(
        icon,
        width: 20,
        height: 20,
      ),
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
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
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
