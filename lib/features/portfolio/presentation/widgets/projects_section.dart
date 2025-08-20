import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:portfolio_app/generated/assets.dart';
import 'package:portfolio_app/widgets/section_title_widget.dart';
import 'package:responsive_framework/responsive_framework.dart';
import '../../domain/entities/project.dart';
import '../../../../core/widgets/app_card.dart';

class ProjectsSection extends StatelessWidget {
  final List<Project> projects;

  const ProjectsSection({super.key, required this.projects});

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
        Positioned(
          bottom: 0,
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
            horizontal: isDesktop ? 80 : 20,
          ),
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SectionTitleWidget(
                  firstText: "My",
                  lastText: "Project",
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
                    crossAxisCount: isDesktop ? 2 : 1,
                    crossAxisSpacing: 20,
                    mainAxisSpacing: 20,
                    childAspectRatio: isDesktop ? 1.3 : 1.1,
                  ),
                  itemCount: projects.length,
                  itemBuilder: (context, index) {
                    return _buildProjectCard(context, projects[index]);
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

  Widget _buildProjectCard(BuildContext context, Project project) {
    return AppCard(
      border: Border.all(color: Theme.of(context).dividerColor),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            project.name,
            style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Theme.of(context).colorScheme.onSurface),
          ),
          const SizedBox(height: 12),
          Text(
            project.description,
            style: TextStyle(
                fontSize: 14,
                height: 1.5,
                color:
                    Theme.of(context).colorScheme.onSurface.withOpacity(0.9)),
          ),
          const SizedBox(height: 16),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.secondaryContainer,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Text(
              project.technologies,
              style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w500,
                  color: Theme.of(context).colorScheme.onSecondaryContainer),
            ),
          ),
        ],
      ),
    );
  }
}
