import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:portfolio_app/generated/assets.dart';
import 'package:portfolio_app/widgets/section_title_widget.dart';
import 'package:responsive_framework/responsive_framework.dart';

class AboutSection extends StatelessWidget {
  final String summary;

  const AboutSection({super.key, required this.summary});

  @override
  Widget build(BuildContext context) {
    final isDesktop = ResponsiveBreakpoints.of(context).isDesktop;

    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: isDesktop ? 80 : 20,
        vertical: isDesktop ? 60 : 40,
      ),
      child: Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
        SvgPicture.asset(
          Assets.svgsAboutMePerson,
          width: 200,
          height: 200,
        ),
        const SizedBox(
          width: 30,
        ),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SectionTitleWidget(
                firstText: "About",
                lastText: "Me",
              ),
              SizedBox(
                height: 15,
              ),
              Text(
                summary,
                style: TextStyle(
                  fontSize: isDesktop ? 18 : 16,
                  height: 1.6,
                  color: Theme.of(context).colorScheme.onSurface,
                ),
              ),
            ],
          ),
        ),
      ]),
    );
  }
}
