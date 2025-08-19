import 'package:flutter/material.dart';
import 'package:responsive_framework/responsive_framework.dart';
import '../../domain/entities/experience.dart';
import '../../../../core/widgets/section_container.dart';
import '../../../../core/widgets/app_card.dart';

class ExperienceSection extends StatelessWidget {
  final List<Experience> experiences;

  const ExperienceSection({super.key, required this.experiences});

  @override
  Widget build(BuildContext context) {
    final isDesktop = ResponsiveBreakpoints.of(context).isDesktop;

    return SectionContainer(
      title: 'Professional Experience',
      titleIcon: Icons.work,
      child: Column(
        children: [
          if (isDesktop)
            Column(
              children: experiences.asMap().entries.map((entry) {
                final index = entry.key;
                final experience = entry.value;
                final isEven = index.isEven;

                return Padding(
                  padding: const EdgeInsets.only(bottom: 40),
                  child: Row(
                    children: [
                      if (isEven) ...[
                        Expanded(
                          flex: 1,
                          child: _buildExperienceCard(context, experience),
                        ),
                        const SizedBox(width: 40),
                        const Expanded(flex: 1, child: SizedBox.shrink()),
                      ] else ...[
                        const Expanded(flex: 1, child: SizedBox.shrink()),
                        const SizedBox(width: 40),
                        Expanded(
                          flex: 1,
                          child: _buildExperienceCard(context, experience),
                        ),
                      ],
                    ],
                  ),
                );
              }).toList(),
            )
          else
            Column(
              children: experiences
                  .map((experience) => Padding(
                        padding: const EdgeInsets.only(bottom: 30),
                        child: _buildExperienceCard(context, experience),
                      ))
                  .toList(),
            ),
        ],
      ),
      backgroundColor: Theme.of(context).colorScheme.surface,
    );
  }

  Widget _buildExperienceCard(BuildContext context, Experience experience) {
    return AppCard(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Text(
                  experience.company,
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Theme.of(context).colorScheme.primary,
                  ),
                ),
              ),
              Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                decoration: BoxDecoration(
                  color: Theme.of(context)
                      .colorScheme
                      .primary
                      .withValues(alpha: 0.1),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Text(
                  experience.duration,
                  style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w500,
                    color: Theme.of(context).colorScheme.primary,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 8),
          Text(
            experience.position,
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w600,
              color: Theme.of(context).colorScheme.onSurface,
            ),
          ),
          const SizedBox(height: 16),
          Text(
            experience.description,
            style: TextStyle(
              fontSize: 14,
              height: 1.5,
              color: Theme.of(context)
                  .colorScheme
                  .onSurface
                  .withValues(alpha: 0.8),
            ),
          ),
        ],
      ),
    );
  }
}
