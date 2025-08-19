import 'package:flutter/material.dart';
import 'package:responsive_framework/responsive_framework.dart';
import '../../domain/entities/experience.dart';
import '../../../../core/widgets/app_card.dart';

class ExperienceSection extends StatelessWidget {
  final List<Experience> experiences;

  const ExperienceSection({super.key, required this.experiences});

  @override
  Widget build(BuildContext context) {
    final isDesktop = ResponsiveBreakpoints.of(context).isDesktop;

    return Container(
      margin: EdgeInsets.symmetric(
        horizontal: isDesktop ? 80 : 20,
        vertical: isDesktop ? 60 : 40,
      ),
      color: Colors.black,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            height: 20,
          ),
          Text(
            "Professional Experience",
            style: TextStyle(
                color: Colors.white, fontSize: 30, fontWeight: FontWeight.w900),
          ),
          SizedBox(
            height: 20,
          ),
          Column(
            children: experiences
                .map((experience) => Padding(
                      padding: const EdgeInsets.only(bottom: 15),
                      child: _buildExperienceCard(context, experience),
                    ))
                .toList(),
          ),
          SizedBox(
            height: 20,
          ),
        ],
      ),
    );
  }

  Widget _buildExperienceCard(BuildContext context, Experience experience) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15.0),
      child: AppCard(
        color: Colors.transparent,
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
                      color: Colors.white,
                    ),
                  ),
                ),
                Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                  decoration: BoxDecoration(
                    color:
                        Theme.of(context).colorScheme.primary.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Text(
                    experience.duration,
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w500,
                      color: Colors.white,
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
                color: Colors.white,
              ),
            ),
            const SizedBox(height: 16),
            Text(
              experience.description,
              style: TextStyle(
                fontSize: 14,
                height: 1.5,
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
