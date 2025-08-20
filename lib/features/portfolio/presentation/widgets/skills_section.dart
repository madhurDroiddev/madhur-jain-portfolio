import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:portfolio_app/generated/assets.dart';
import 'package:portfolio_app/widgets/section_title_widget.dart';
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

    return Stack(
      children: [
        Positioned(
          top: 0,
          right: -60,
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
        Padding(
          padding: EdgeInsets.symmetric(
            horizontal: isDesktop
                ? 80
                : isTablet
                    ? 40
                    : 20,
          ),
          child: Column(children: [
            SizedBox(
              height: 20,
            ),
            SectionTitleWidget(
              firstText: "My",
              lastText: "Skills",
              firstTextStyle: TextStyle(
                  fontSize: 30, color: Theme.of(context).colorScheme.onSurface),
              lastTextStyle: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.w900,
                  color: Theme.of(context).colorScheme.onSurface),
            ),
            SizedBox(
              height: 20,
            ),
            GridView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: isDesktop
                    ? 4
                    : isTablet
                        ? 2
                        : 1,
                crossAxisSpacing: 20,
                mainAxisSpacing: 20,
                childAspectRatio: isDesktop ? 1.5 : 0.8,
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
        ),
      ],
    );
  }

  Widget _buildSkillCard(BuildContext context, Skill skill) {
    return AppCard(
      padding: const EdgeInsets.all(20),
      color: Theme.of(context).colorScheme.surface,
      border: Border.all(color: Theme.of(context).dividerColor),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            skill.name,
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Theme.of(context).colorScheme.onSurface,
            ),
          ),
          const SizedBox(height: 8),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.secondaryContainer,
              border: Border.all(color: Theme.of(context).dividerColor),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Text(
              skill.category,
              style: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w500,
                color: Theme.of(context).colorScheme.onSecondaryContainer,
              ),
            ),
          ),
          const SizedBox(height: 12),
          Text(
            skill.description,
            style: TextStyle(
              fontSize: 14,
              height: 1.4,
              color: Theme.of(context).colorScheme.onSurface.withOpacity(0.9),
            ),
          ),
        ],
      ),
    );
  }
}
