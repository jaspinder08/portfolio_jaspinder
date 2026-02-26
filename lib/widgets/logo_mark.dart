import 'package:flutter/material.dart';

class LogoMark extends StatelessWidget {
  final double fontSize;
  final bool showDot;

  const LogoMark({
    super.key,
    this.fontSize = 18,
    this.showDot = true,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final primaryColor = theme.colorScheme.primary;
    final textTheme = theme.textTheme;

    return Row(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.baseline,
      textBaseline: TextBaseline.alphabetic,
      children: [
        RichText(
          text: TextSpan(
            style: textTheme.titleLarge?.copyWith(
              letterSpacing: 0.5,
              fontSize: fontSize,
              fontFamily: 'Inter',
            ),
            children: [
              TextSpan(
                text: 'J',
                style: TextStyle(
                  fontWeight: FontWeight.w900,
                  color: theme.colorScheme.onSurface,
                ),
              ),
              TextSpan(
                text: 'aspinder Kaur Bahara',
                style: TextStyle(
                  fontWeight: FontWeight.w400,
                  color: theme.colorScheme.onSurface.withOpacity(0.9),
                ),
              ),
            ],
          ),
        ),
        if (showDot) ...[
          const SizedBox(width: 2),
          Container(
            width: fontSize * 0.22,
            height: fontSize * 0.22,
            decoration: BoxDecoration(
              color: primaryColor,
              shape: BoxShape.circle,
              boxShadow: [
                BoxShadow(
                  color: primaryColor.withOpacity(0.5),
                  blurRadius: fontSize * 0.3,
                  spreadRadius: 1,
                ),
              ],
            ),
          ),
        ],
      ],
    );
  }
}
