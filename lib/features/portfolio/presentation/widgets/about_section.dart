import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:portfolio_app/generated/assets.dart';
import 'package:responsive_framework/responsive_framework.dart';
import '../../../../core/widgets/section_container.dart';

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
              RichText(
                  text: TextSpan(
                      text: "About ",
                      style:
                          TextStyle(fontWeight: FontWeight.w500, fontSize: 25),
                      children: [
                    TextSpan(
                        text: 'Me',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 25))
                  ])),
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
