import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:portfolio_app/generated/assets.dart';
import 'package:portfolio_app/widgets/section_title_widget.dart';
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
      child: Stack(
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
          Positioned(
            bottom: 0,
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
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: isDesktop ? 80 : 20,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  height: 20,
                ),
                SectionTitleWidget(
                  firstText: "Professional",
                  lastText: "Experience",
                  firstTextStyle: TextStyle(
                      color: Theme.of(context).colorScheme.onSurface,
                      fontSize: 30),
                  lastTextStyle: TextStyle(
                      color: Theme.of(context).colorScheme.onSurface,
                      fontSize: 30,
                      fontWeight: FontWeight.w900),
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
                      color: Theme.of(context).colorScheme.onSurface,
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
                      color: Theme.of(context).colorScheme.onPrimaryContainer,
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
                color: Theme.of(context).colorScheme.onSurface.withOpacity(0.8),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
