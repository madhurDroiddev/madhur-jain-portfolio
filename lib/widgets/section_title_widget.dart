import 'package:flutter/material.dart';

class SectionTitleWidget extends StatelessWidget {
  final String firstText;
  final String lastText;
  final TextStyle? firstTextStyle;
  final TextStyle? lastTextStyle;

  const SectionTitleWidget(
      {super.key,
      required this.firstText,
      required this.lastText,
      this.firstTextStyle,
      this.lastTextStyle});

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        text: '$firstText ',
        style: firstTextStyle ??
            TextStyle(
              fontWeight: FontWeight.w500,
              fontSize: 25,
              color: Theme.of(context).colorScheme.onSurface,
            ),
        children: [
          TextSpan(
            text: lastText,
            style: lastTextStyle ??
                TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 25,
                  color: Theme.of(context).colorScheme.onSurface,
                ),
          ),
        ],
      ),
    );
  }
}
