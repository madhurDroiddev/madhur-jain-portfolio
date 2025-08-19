import 'package:flutter/material.dart';
import 'package:responsive_framework/responsive_framework.dart';
import '../../domain/entities/skill.dart';
import '../../../../core/widgets/app_card.dart';

class SkillsSection extends StatelessWidget {
  final List<Skill> skills;

  const SkillsSection({super.key, required this.skills});

  @override
  Widget build(BuildContext context) {
    final isDesktop = ResponsiveBreakpoints.of(context).isDesktop;
    final isTablet = ResponsiveBreakpoints.of(context).isTablet;

    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: isDesktop
            ? 80
            : isTablet
                ? 40
                : 20,
      ),
      child: Column(children: [
        Text(
          "My Skills",
          style: TextStyle(
              color: Colors.black, fontSize: 30, fontWeight: FontWeight.w900),
        ),
        SizedBox(
          height: 20,
        ),
        GridView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: isDesktop
                ? 3
                : isTablet
                    ? 2
                    : 1,
            crossAxisSpacing: 20,
            mainAxisSpacing: 20,
            childAspectRatio: isDesktop ? 1.5 : 1.2,
          ),
          itemCount: skills.length,
          itemBuilder: (context, index) {
            return _buildSkillCard(context, skills[index]);
          },
        ),
        SizedBox(
          height: 20,
        ),
      ]),
    );
  }

  Widget _buildSkillCard(BuildContext context, Skill skill) {
    return AppCard(
      padding: const EdgeInsets.all(20),
      color: Colors.white,
      border: Border.all(color: Colors.black54),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            skill.name,
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
          const SizedBox(height: 8),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
            decoration: BoxDecoration(
              color: Colors.white,
              border: Border.all(color: Colors.black87),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Text(
              skill.category,
              style: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w500,
                color: Colors.black,
              ),
            ),
          ),
          const SizedBox(height: 12),
          Text(
            skill.description,
            style: TextStyle(
              fontSize: 14,
              height: 1.4,
              color: Colors.black,
            ),
          ),
        ],
      ),
    );
  }
}
