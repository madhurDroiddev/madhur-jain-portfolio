import 'package:flutter/material.dart';
import '../models/portfolio_data.dart';

class SkillsSection extends StatelessWidget {
  const SkillsSection({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final isDesktop = screenWidth > 1200;
    final isTablet = screenWidth > 768 && screenWidth <= 1200;

    // Group skills by category
    final skillCategories = <String, List<dynamic>>{};
    for (final skill in PortfolioData.skills) {
      skillCategories.putIfAbsent(skill.category, () => []).add(skill);
    }

    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(
        horizontal: isDesktop ? 80 : isTablet ? 40 : 20,
        vertical: 60,
      ),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.surface,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Section Title
          Row(
            children: [
              Icon(
                Icons.code,
                color: Theme.of(context).colorScheme.primary,
                size: 32,
              ),
              const SizedBox(width: 16),
              Text(
                'Technical Skills',
                style: TextStyle(
                  fontSize: isDesktop ? 36 : 28,
                  fontWeight: FontWeight.bold,
                  color: Theme.of(context).colorScheme.onSurface,
                ),
              ),
            ],
          ),
          const SizedBox(height: 40),
          
          // Skills Grid
          if (isDesktop)
            // Desktop Layout - Categories side by side
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: skillCategories.entries.map((entry) {
                final category = entry.key;
                final skills = entry.value;
                
                return Expanded(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: _buildSkillCategory(context, category, skills),
                  ),
                );
              }).toList(),
            )
          else
            // Mobile/Tablet Layout - Stacked categories
            Column(
              children: skillCategories.entries.map((entry) {
                final category = entry.key;
                final skills = entry.value;
                
                return Padding(
                  padding: const EdgeInsets.only(bottom: 40),
                  child: _buildSkillCategory(context, category, skills),
                );
              }).toList(),
            ),
        ],
      ),
    );
  }

  Widget _buildSkillCategory(BuildContext context, String category, List<dynamic> skills) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Category Title
        Text(
          category,
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Theme.of(context).colorScheme.primary,
          ),
        ),
        const SizedBox(height: 20),
        // Skills List
        ...skills.map((skill) => Padding(
          padding: const EdgeInsets.only(bottom: 16),
          child: _buildSkillItem(context, skill),
        )),
      ],
    );
  }

  Widget _buildSkillItem(BuildContext context, dynamic skill) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Skill Name and Percentage
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              skill.name,
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w600,
                color: Theme.of(context).colorScheme.onSurface,
              ),
            ),
            Text(
              '${(skill.proficiency * 100).toInt()}%',
              style: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w500,
                color: Theme.of(context).colorScheme.primary,
              ),
            ),
          ],
        ),
        const SizedBox(height: 8),
        // Progress Bar
        Container(
          height: 8,
          decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.outline.withOpacity(0.2),
            borderRadius: BorderRadius.circular(4),
          ),
          child: FractionallySizedBox(
            alignment: Alignment.centerLeft,
            widthFactor: skill.proficiency,
            child: Container(
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.primary,
                borderRadius: BorderRadius.circular(4),
              ),
            ),
          ),
        ),
      ],
    );
  }
}