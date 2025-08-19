import 'package:flutter/material.dart';
import 'package:responsive_framework/responsive_framework.dart';
import '../../../../core/widgets/section_container.dart';

class AboutSection extends StatelessWidget {
  final String summary;

  const AboutSection({super.key, required this.summary});

  @override
  Widget build(BuildContext context) {
    final isDesktop = ResponsiveBreakpoints.of(context).isDesktop;

    return SectionContainer(
      title: 'About Me',
      titleIcon: Icons.person,
      child: Text(
        summary,
        style: TextStyle(
          fontSize: isDesktop ? 18 : 16,
          height: 1.6,
          color: Theme.of(context).colorScheme.onSurface,
        ),
      ),
      gradient: LinearGradient(
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
        colors: [
          Theme.of(context).colorScheme.surface,
          Theme.of(context).colorScheme.surface.withOpacity(0.8),
        ],
      ),
    );
  }
}
