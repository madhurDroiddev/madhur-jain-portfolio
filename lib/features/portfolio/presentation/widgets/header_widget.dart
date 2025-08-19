import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:portfolio_app/generated/assets.dart';
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
      child: Column(
        children: [
          if (isDesktop)
            Stack(
              children: [
                Stack(
                  children: [
                    SvgPicture.asset(
                      Assets.svgsForegroundBanner,
                      width: 300,
                      height: 300,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          contactInfo['name'] ?? '',
                          style: GoogleFonts.rubikDoodleShadow(
                            fontSize: 40,
                            fontWeight: FontWeight.w900,
                            color: Colors.black,
                          ),
                        ),
                        Text(
                          contactInfo['title'] ?? '',
                          style: GoogleFonts.rubikDoodleShadow(
                            fontSize: 40,
                            fontWeight: FontWeight.w500,
                            color: Colors.black,
                          ),
                        ),
                        const SizedBox(height: 8),
                        Text(
                          contactInfo['subtitle'] ?? '',
                          style: GoogleFonts.rubikDoodleShadow(
                            fontSize: 40,
                            fontWeight: FontWeight.w500,
                            color: Colors.black,
                          ),
                        ),
                        const SizedBox(height: 32),
                        Text(
                          "I'm Evren Shah Lorem Ipsum is simply dummy text of the printing and typesetting industry.\nLorem Ipsum has been the industry's standard dummy text ever since the 1500s,\nwhen an unknown printer took a galley of type and scrambled it to specimen book.",
                          style: GoogleFonts.rubik(color: Colors.grey),
                        ),
                        const SizedBox(height: 32),
                        Row(
                          children: [
                            _buildContactButton(
                              context,
                              Assets.svgsGithubIcon,
                              'GitHub',
                              contactInfo['github'] ?? AppConstants.githubUrl,
                            ),
                            const SizedBox(width: 16),
                            _buildContactButton(
                              context,
                              Assets.svgsLinkedinIcon,
                              'LinkedIn',
                              contactInfo['linkedin'] ??
                                  AppConstants.linkedinUrl,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
                Positioned(
                  right: 0,
                  child: Container(
                    width: 400,
                    height: 400,
                    child: SvgPicture.asset(Assets.svgsBanner),
                  ),
                ),
              ],
            )
          else
            Container(
              child: Stack(
                children: [
                  SvgPicture.asset(
                    Assets.svgsForegroundBanner,
                    width: 300,
                    height: 300,
                  ),
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
                        style: GoogleFonts.rubikDoodleShadow(
                          fontSize: 32,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(height: 12),
                      Text(
                        contactInfo['title'] ?? AppConstants.title,
                        style: GoogleFonts.rubikDoodleShadow(
                          fontSize: 18,
                          fontWeight: FontWeight.w500,
                          color: Colors.black,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(height: 8),
                      Text(
                        contactInfo['subtitle'] ?? AppConstants.subtitle,
                        style: GoogleFonts.rubikDoodleShadow(
                          fontSize: 16,
                          color: Colors.black,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(height: 32),
                      Wrap(
                        spacing: 12,
                        runSpacing: 12,
                        alignment: WrapAlignment.center,
                        children: [
                          /*_buildContactButton(
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
                          ),*/
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
        ],
      ),
    );
  }

  Widget _buildContactButton(
    BuildContext context,
    String icon,
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
          borderRadius: BorderRadius.circular(2),
          border: Border.all(
            color: Colors.black,
            width: 1,
          ),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            SvgPicture.asset(
              icon,
              width: 30,
              height: 30,
            ),
            const SizedBox(width: 8),
            Text(
              label,
              style: const TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w500,
                color: Colors.black,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
