import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../../../core/constants/app_constants.dart';

class HeaderWidget extends StatelessWidget {
  final Map<String, String> contactInfo;

  const HeaderWidget({super.key, required this.contactInfo});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final isDesktop = screenWidth > AppConstants.desktopBreakpoint;
    final isTablet = screenWidth > AppConstants.mobileBreakpoint && screenWidth <= AppConstants.tabletBreakpoint;
    final isMobile = screenWidth <= AppConstants.mobileBreakpoint;

    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(
        horizontal: isDesktop ? 80 : isTablet ? 40 : 20,
        vertical: isDesktop ? 60 : 40,
      ),
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            Color(AppConstants.primaryColor),
            Color(AppConstants.secondaryColor),
            Color(AppConstants.accentColor),
          ],
          stops: [0.0, 0.5, 1.0],
        ),
      ),
      child: Column(
        children: [
          // Profile Image and Name
          if (isDesktop)
            Row(
              children: [
                // Profile Image
                Container(
                  width: 200,
                  height: 200,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.1),
                        blurRadius: 20,
                        offset: const Offset(0, 10),
                      ),
                    ],
                  ),
                  child: const Center(
                    child: Text(
                      'MJ',
                      style: TextStyle(
                        fontSize: 80,
                        fontWeight: FontWeight.bold,
                        color: Color(AppConstants.primaryColor),
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 60),
                // Name and Title
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        contactInfo['name'] ?? AppConstants.name,
                        style: const TextStyle(
                          fontSize: 48,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                      const SizedBox(height: 16),
                      Text(
                        contactInfo['title'] ?? AppConstants.title,
                        style: const TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.w500,
                          color: Colors.white,
                        ),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        contactInfo['subtitle'] ?? AppConstants.subtitle,
                        style: const TextStyle(
                          fontSize: 18,
                          color: Colors.white70,
                        ),
                      ),
                      const SizedBox(height: 32),
                      // Contact Buttons
                      Row(
                        children: [
                          _buildContactButton(
                            context,
                            Icons.phone,
                            'Call',
                            'tel:${contactInfo['phone'] ?? AppConstants.phone}',
                          ),
                          const SizedBox(width: 16),
                          _buildContactButton(
                            context,
                            Icons.email,
                            'Email',
                            'mailto:${contactInfo['email'] ?? AppConstants.email}',
                          ),
                          const SizedBox(width: 16),
                          _buildContactButton(
                            context,
                            Icons.code,
                            'GitHub',
                            contactInfo['github'] ?? AppConstants.githubUrl,
                          ),
                          const SizedBox(width: 16),
                          _buildContactButton(
                            context,
                            Icons.work,
                            'LinkedIn',
                            contactInfo['linkedin'] ?? AppConstants.linkedinUrl,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            )
          else
            // Mobile/Tablet Layout
            Column(
              children: [
                // Profile Image
                Container(
                  width: 120,
                  height: 120,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.1),
                        blurRadius: 15,
                        offset: const Offset(0, 8),
                      ),
                    ],
                  ),
                  child: const Center(
                    child: Text(
                      'MJ',
                      style: TextStyle(
                        fontSize: 48,
                        fontWeight: FontWeight.bold,
                        color: Color(AppConstants.primaryColor),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 24),
                // Name and Title
                Text(
                  contactInfo['name'] ?? AppConstants.name,
                  style: const TextStyle(
                    fontSize: 32,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 12),
                Text(
                  contactInfo['title'] ?? AppConstants.title,
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                    color: Colors.white,
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 8),
                Text(
                  contactInfo['subtitle'] ?? AppConstants.subtitle,
                  style: const TextStyle(
                    fontSize: 16,
                    color: Colors.white70,
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 32),
                // Contact Buttons
                Wrap(
                  spacing: 12,
                  runSpacing: 12,
                  alignment: WrapAlignment.center,
                  children: [
                    _buildContactButton(
                      context,
                      Icons.phone,
                      'Call',
                      'tel:${contactInfo['phone'] ?? AppConstants.phone}',
                    ),
                    _buildContactButton(
                      context,
                      Icons.email,
                      'Email',
                      'mailto:${contactInfo['email'] ?? AppConstants.email}',
                    ),
                    _buildContactButton(
                      context,
                      Icons.code,
                      'GitHub',
                      contactInfo['github'] ?? AppConstants.githubUrl,
                    ),
                    _buildContactButton(
                      context,
                      Icons.work,
                      'LinkedIn',
                      contactInfo['linkedin'] ?? AppConstants.linkedinUrl,
                    ),
                  ],
                ),
              ],
            ),
        ],
      ),
    );
  }

  Widget _buildContactButton(
    BuildContext context,
    IconData icon,
    String label,
    String url,
  ) {
    return InkWell(
      onTap: () async {
        final Uri uri = Uri.parse(url);
        if (await canLaunchUrl(uri)) {
          await launchUrl(uri, mode: LaunchMode.externalApplication);
        }
      },
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        decoration: BoxDecoration(
          color: Colors.white.withOpacity(0.2),
          borderRadius: BorderRadius.circular(25),
          border: Border.all(
            color: Colors.white.withOpacity(0.3),
            width: 1,
          ),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              icon,
              color: Colors.white,
              size: 20,
            ),
            const SizedBox(width: 8),
            Text(
              label,
              style: const TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w500,
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }
}