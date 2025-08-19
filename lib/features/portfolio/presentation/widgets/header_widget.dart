import 'package:flutter/material.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../../../core/constants/app_constants.dart';
import '../../../../core/theme/retro_theme.dart';

class HeaderWidget extends StatelessWidget {
  final Map<String, String> contactInfo;

  const HeaderWidget({super.key, required this.contactInfo});

  @override
  Widget build(BuildContext context) {
    final isDesktop = ResponsiveBreakpoints.of(context).isDesktop;
    final isTablet = ResponsiveBreakpoints.of(context).isTablet;
    final retro = Theme.of(context).extension<RetroThemeExtension>();

    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(
        horizontal: isDesktop
            ? 80
            : isTablet
                ? 40
                : 20,
        vertical: isDesktop ? 60 : 40,
      ),
      decoration: BoxDecoration(
        gradient: retro != null
            ? LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: retro.headerGradient,
                stops: const [0.0, 0.5, 1.0],
              )
            : const LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
                  Color(AppConstants.primaryColor),
                  Color(AppConstants.secondaryColor),
                  Color(AppConstants.accentColor),
                ],
                stops: [0.0, 0.5, 1.0],
              ),
        image: retro?.useImages == true && retro?.headerOverlayImage != null
            ? DecorationImage(
                image: AssetImage(retro!.headerOverlayImage!),
                fit: BoxFit.cover,
                opacity: 0.2,
              )
            : null,
      ),
      child: Column(
        children: [
          if (isDesktop)
            Row(
              children: [
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
                  child: CircleAvatar(
                    backgroundImage: const AssetImage(
                      "assets/images/profile_pic.jpg",
                    ),
                    backgroundColor: Colors.transparent,
                  ),
                ),
                const SizedBox(width: 60),
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
            Column(
              children: [
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
