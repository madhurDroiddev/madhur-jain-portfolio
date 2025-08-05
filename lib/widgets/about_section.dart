import 'package:flutter/material.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../models/portfolio_data.dart';

class AboutSection extends StatelessWidget {
  const AboutSection({super.key});

  @override
  Widget build(BuildContext context) {
    final isDesktop = ResponsiveWrapper.of(context).isDesktop;
    final isTablet = ResponsiveWrapper.of(context).isTablet;

    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(
        horizontal: isDesktop ? 80 : isTablet ? 40 : 20,
        vertical: 60,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Section Title
          Row(
            children: [
              Icon(
                Icons.person,
                color: Theme.of(context).colorScheme.primary,
                size: 32,
              ),
              const SizedBox(width: 16),
              Text(
                'About Me',
                style: TextStyle(
                  fontSize: isDesktop ? 36 : 28,
                  fontWeight: FontWeight.bold,
                  color: Theme.of(context).colorScheme.onSurface,
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
                // Summary
                Expanded(
                  flex: 2,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Summary',
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: Theme.of(context).colorScheme.onSurface,
                        ),
                      ),
                      const SizedBox(height: 16),
                      Text(
                        PortfolioData.summary,
                        style: TextStyle(
                          fontSize: 16,
                          height: 1.6,
                          color: Theme.of(context).colorScheme.onSurface.withOpacity(0.8),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(width: 60),
                // Education
                Expanded(
                  flex: 1,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Education',
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: Theme.of(context).colorScheme.onSurface,
                        ),
                      ),
                      const SizedBox(height: 16),
                      ...PortfolioData.education.map((education) => Padding(
                        padding: const EdgeInsets.only(bottom: 12),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            FaIcon(
                              FontAwesomeIcons.graduationCap,
                              color: Theme.of(context).colorScheme.primary,
                              size: 20,
                            ),
                            const SizedBox(width: 12),
                            Expanded(
                              child: Text(
                                education,
                                style: TextStyle(
                                  fontSize: 14,
                                  color: Theme.of(context).colorScheme.onSurface.withOpacity(0.8),
                                ),
                              ),
                            ),
                          ],
                        ),
                      )),
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
                // Summary
                Text(
                  'Summary',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Theme.of(context).colorScheme.onSurface,
                  ),
                ),
                const SizedBox(height: 16),
                Text(
                  PortfolioData.summary,
                  style: TextStyle(
                    fontSize: 16,
                    height: 1.6,
                    color: Theme.of(context).colorScheme.onSurface.withOpacity(0.8),
                  ),
                ),
                const SizedBox(height: 40),
                // Education
                Text(
                  'Education',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Theme.of(context).colorScheme.onSurface,
                  ),
                ),
                const SizedBox(height: 16),
                ...PortfolioData.education.map((education) => Padding(
                  padding: const EdgeInsets.only(bottom: 12),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      FaIcon(
                        FontAwesomeIcons.graduationCap,
                        color: Theme.of(context).colorScheme.primary,
                        size: 20,
                      ),
                      const SizedBox(width: 12),
                      Expanded(
                        child: Text(
                          education,
                          style: TextStyle(
                            fontSize: 14,
                            color: Theme.of(context).colorScheme.onSurface.withOpacity(0.8),
                          ),
                        ),
                      ),
                    ],
                  ),
                )),
              ],
            ),
        ],
      ),
    );
  }
}