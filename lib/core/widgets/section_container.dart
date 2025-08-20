import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:responsive_framework/responsive_framework.dart';

class SectionContainer extends StatelessWidget {
  final Widget child;
  final String? title;
  final String? titleIcon;
  final TextStyle? titleTextStyle;
  final Gradient? gradient;
  final Color? backgroundColor;
  final EdgeInsets? padding;

  const SectionContainer({
    super.key,
    required this.child,
    this.title,
    this.titleIcon,
    this.titleTextStyle,
    this.gradient,
    this.backgroundColor,
    this.padding,
  });

  @override
  Widget build(BuildContext context) {
    final isDesktop = ResponsiveBreakpoints.of(context).isDesktop;
    final isTablet = ResponsiveBreakpoints.of(context).isTablet;

    final effectivePadding = padding ??
        EdgeInsets.symmetric(
          horizontal: isDesktop
              ? 80
              : isTablet
                  ? 40
                  : 20,
          vertical: 60,
        );

    final defaultTitleStyle = TextStyle(
      fontSize: isDesktop ? 36 : 28,
      fontWeight: FontWeight.bold,
      color: Theme.of(context).colorScheme.onSurface,
    );

    return Container(
      width: double.infinity,
      padding: effectivePadding,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (title != null)
            Row(
              children: [
                if (titleIcon != null)
                  SvgPicture.asset(
                    titleIcon!,
                    color: (titleTextStyle?.color) ??
                        (gradient != null
                            ? Colors.white
                            : Theme.of(context).colorScheme.primary),
                    width: 35,
                    height: 35,
                  ),
                const SizedBox(width: 16),
                Text(
                  title!,
                  style: titleTextStyle ?? defaultTitleStyle,
                ),
              ],
            ),
          if (title != null) const SizedBox(height: 40),
          child,
        ],
      ),
    );
  }
}
