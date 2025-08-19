import 'package:flutter/material.dart';

class AppCard extends StatelessWidget {
  final Widget child;
  final EdgeInsets padding;
  final BorderRadius borderRadius;
  final Gradient? gradient;
  final Color? color;

  const AppCard({
    super.key,
    required this.child,
    this.padding = const EdgeInsets.all(24),
    BorderRadius? borderRadius,
    this.gradient,
    this.color,
  }) : borderRadius =
            borderRadius ?? const BorderRadius.all(Radius.circular(16));

  @override
  Widget build(BuildContext context) {
    final decoration = BoxDecoration(
      gradient: gradient ??
          LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              Theme.of(context).colorScheme.surface,
              Theme.of(context).colorScheme.surface.withValues(alpha: 0.8),
            ],
          ),
      color: gradient == null
          ? (color ?? Theme.of(context).colorScheme.surface)
          : null,
      borderRadius: borderRadius,
      border: Border.all(
        color: Theme.of(context).colorScheme.outline.withValues(alpha: 0.2),
      ),
      boxShadow: [
        BoxShadow(
          color: Colors.black.withValues(alpha: 0.1),
          blurRadius: 10,
          offset: const Offset(0, 5),
        ),
      ],
    );

    return Container(
      padding: padding,
      decoration: decoration,
      child: child,
    );
  }
}
