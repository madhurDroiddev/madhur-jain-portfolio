import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:portfolio_app/generated/assets.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../../../core/constants/app_constants.dart';
import '../../../../core/widgets/section_container.dart';

class ContactSection extends StatelessWidget {
  final Map<String, String> contactInfo;

  const ContactSection({super.key, required this.contactInfo});

  @override
  Widget build(BuildContext context) {
    final isDesktop = ResponsiveBreakpoints.of(context).isDesktop;

    return Stack(
      children: [
        Positioned(
          top: 0,
          left: -60,
          child: SvgPicture.asset(
            Assets.svgsForegroundBanner,
            colorFilter: ColorFilter.mode(
              Theme.of(context).colorScheme.onSurface.withOpacity(0.2),
              BlendMode.srcIn,
            ),
            height: 350,
            width: 350,
          ),
        ),
        SectionContainer(
          title: 'Get In Touch',
          titleIcon: Assets.svgsGetInTouch,
          titleTextStyle: TextStyle(
            fontSize: isDesktop ? 36 : 28,
            fontWeight: FontWeight.bold,
            color: Theme.of(context).colorScheme.onSurface,
          ),
          backgroundColor: Theme.of(context).colorScheme.surface,
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
                    Text(
                      'Ready to work together?',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Theme.of(context).colorScheme.onSurface,
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
                      icon: Icon(Icons.email,
                          color: Theme.of(context).colorScheme.onPrimary),
                      label: Text(
                        'Send Message',
                        style: TextStyle(
                            color: Theme.of(context).colorScheme.onPrimary),
                      ),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Theme.of(context).colorScheme.primary,
                        foregroundColor: Theme.of(context).colorScheme.onPrimary,
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
        ),
      ],
    );
  }

  Widget _buildContactColumn(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Contact Information',
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: Theme.of(context).colorScheme.onSurface,
          ),
        ),
        const SizedBox(height: 24),
        _buildContactItem(
          context,
          Assets.svgsCallRound,
          'Phone',
          contactInfo['phone'] ?? AppConstants.phone,
          'tel:${contactInfo['phone'] ?? AppConstants.phone}',
        ),
        const SizedBox(height: 16),
        _buildContactItem(
          context,
          Assets.svgsEmailRound,
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
        Text(
          'Social Links',
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: Theme.of(context).colorScheme.onSurface,
          ),
        ),
        const SizedBox(height: 24),
        _buildContactItem(
          context,
          Assets.svgsGithubIcon,
          'GitHub',
          'github.com/madhurDroiddev',
          contactInfo['github'] ?? AppConstants.githubUrl,
        ),
        const SizedBox(height: 16),
        _buildContactItem(
          context,
          Assets.svgsLinkedinIcon,
          'LinkedIn',
          'https://www.linkedin.com/in/madhur-jain-726599118/',
          contactInfo['linkedin'] ?? AppConstants.linkedinUrl,
        ),
      ],
    );
  }

  Widget _buildContactItem(
    BuildContext context,
    String icon,
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
          color: Theme.of(context).colorScheme.surface,
          borderRadius: BorderRadius.circular(5),
          border: Border.all(
            color: Theme.of(context).dividerColor,
            width: 1,
          ),
        ),
        child: Row(
          children: [
            SvgPicture.asset(icon,width: 30,height: 30,),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    label,
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                      color: Theme.of(context)
                          .colorScheme
                          .onSurface
                          .withOpacity(0.7),
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    value,
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: Theme.of(context).colorScheme.onSurface,
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
