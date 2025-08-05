import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../../../core/constants/app_constants.dart';

class ContactSection extends StatelessWidget {
  final Map<String, String> contactInfo;

  const ContactSection({super.key, required this.contactInfo});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final isDesktop = screenWidth > AppConstants.desktopBreakpoint;
    final isTablet = screenWidth > AppConstants.mobileBreakpoint && screenWidth <= AppConstants.tabletBreakpoint;

    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(
        horizontal: isDesktop ? 80 : isTablet ? 40 : 20,
        vertical: 60,
      ),
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            Color(AppConstants.primaryColor),
            Color(AppConstants.secondaryColor),
          ],
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Section Title
          Row(
            children: [
              const Icon(
                Icons.contact_mail,
                color: Colors.white,
                size: 32,
              ),
              const SizedBox(width: 16),
              Text(
                'Get In Touch',
                style: TextStyle(
                  fontSize: isDesktop ? 36 : 28,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ],
          ),
          const SizedBox(height: 40),
          
          // Content
          if (isDesktop)
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Contact Information
                Expanded(
                  flex: 1,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Contact Information',
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                      const SizedBox(height: 24),
                      _buildContactItem(
                        context,
                        Icons.phone,
                        'Phone',
                        contactInfo['phone'] ?? AppConstants.phone,
                        'tel:${contactInfo['phone'] ?? AppConstants.phone}',
                      ),
                      const SizedBox(height: 16),
                      _buildContactItem(
                        context,
                        Icons.email,
                        'Email',
                        contactInfo['email'] ?? AppConstants.email,
                        'mailto:${contactInfo['email'] ?? AppConstants.email}',
                      ),
                    ],
                  ),
                ),
                const SizedBox(width: 60),
                // Social Links
                Expanded(
                  flex: 1,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Social Links',
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                      const SizedBox(height: 24),
                      _buildContactItem(
                        context,
                        Icons.code,
                        'GitHub',
                        'github.com/madhurDroiddev',
                        contactInfo['github'] ?? AppConstants.githubUrl,
                      ),
                      const SizedBox(height: 16),
                      _buildContactItem(
                        context,
                        Icons.work,
                        'LinkedIn',
                        'linkedin.com/in/madhur-jain',
                        contactInfo['linkedin'] ?? AppConstants.linkedinUrl,
                      ),
                    ],
                  ),
                ),
              ],
            )
          else
            // Mobile/Tablet Layout
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Contact Information',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(height: 24),
                _buildContactItem(
                  context,
                  Icons.phone,
                  'Phone',
                  contactInfo['phone'] ?? AppConstants.phone,
                  'tel:${contactInfo['phone'] ?? AppConstants.phone}',
                ),
                const SizedBox(height: 16),
                _buildContactItem(
                  context,
                  Icons.email,
                  'Email',
                  contactInfo['email'] ?? AppConstants.email,
                  'mailto:${contactInfo['email'] ?? AppConstants.email}',
                ),
                const SizedBox(height: 32),
                const Text(
                  'Social Links',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(height: 24),
                _buildContactItem(
                  context,
                  Icons.code,
                  'GitHub',
                  'github.com/madhurDroiddev',
                  contactInfo['github'] ?? AppConstants.githubUrl,
                ),
                const SizedBox(height: 16),
                _buildContactItem(
                  context,
                  Icons.work,
                  'LinkedIn',
                  'linkedin.com/in/madhur-jain',
                  contactInfo['linkedin'] ?? AppConstants.linkedinUrl,
                ),
              ],
            ),
        ],
      ),
    );
  }

  Widget _buildContactItem(
    BuildContext context,
    IconData icon,
    String label,
    String value,
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
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Colors.white.withOpacity(0.1),
          borderRadius: BorderRadius.circular(12),
          border: Border.all(
            color: Colors.white.withOpacity(0.2),
            width: 1,
          ),
        ),
        child: Row(
          children: [
            Icon(
              icon,
              color: Colors.white,
              size: 24,
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    label,
                    style: const TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                      color: Colors.white70,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    value,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}