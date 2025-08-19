import 'package:flutter/material.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../../../core/constants/app_constants.dart';
import '../../../../core/widgets/section_container.dart';
import '../../../../core/theme/retro_theme.dart';

class ContactSection extends StatelessWidget {
  final Map<String, String> contactInfo;

  const ContactSection({super.key, required this.contactInfo});

  @override
  Widget build(BuildContext context) {
    final isDesktop = ResponsiveBreakpoints.of(context).isDesktop;
    final retro = Theme.of(context).extension<RetroThemeExtension>();

    return SectionContainer(
      title: 'Get In Touch',
      titleIcon: Icons.contact_mail,
      titleTextStyle: TextStyle(
        fontSize: isDesktop ? 36 : 28,
        fontWeight: FontWeight.bold,
        color: Colors.white,
      ),
      gradient: const LinearGradient(
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
        colors: [
          Colors.black,
          Colors.black87,
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (isDesktop)
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  flex: 1,
                  child: _buildContactColumn(context),
                ),
                const SizedBox(width: 60),
                Expanded(
                  flex: 1,
                  child: _buildSocialColumn(context),
                ),
              ],
            )
          else
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildContactColumn(context),
                const SizedBox(height: 32),
                _buildSocialColumn(context),
              ],
            ),
          const SizedBox(height: 40),
          Center(
            child: Column(
              children: [
                const Text(
                  'Ready to work together?',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(height: 16),
                ElevatedButton.icon(
                  onPressed: () async {
                    final uri = Uri.parse(
                        'mailto:${contactInfo['email'] ?? AppConstants.email}?subject=Portfolio Inquiry');
                    if (await canLaunchUrl(uri)) {
                      await launchUrl(uri);
                    }
                  },
                  icon: const Icon(Icons.email, color: Colors.white),
                  label: const Text(
                    'Send Message',
                    style: TextStyle(color: Colors.white),
                  ),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.white.withOpacity(0.2),
                    foregroundColor: Colors.white,
                    padding: const EdgeInsets.symmetric(
                        horizontal: 32, vertical: 16),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(25),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildContactColumn(BuildContext context) {
    return Column(
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
    );
  }

  Widget _buildSocialColumn(BuildContext context) {
    return Column(
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
