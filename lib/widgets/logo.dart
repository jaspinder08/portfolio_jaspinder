import 'package:flutter/material.dart';

class Logo extends StatelessWidget {
  final double? fontSize;

  const Logo({
    super.key,
    this.fontSize,
  });

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final width = MediaQuery.sizeOf(context).width;

    // Responsive sizing: smaller on mobile (<600)
    final double effectiveFontSize = fontSize ?? (width < 600 ? 18 : 22);

    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.baseline,
          textBaseline: TextBaseline.alphabetic,
          children: [
            RichText(
              text: TextSpan(
                style: TextStyle(
                  fontSize: effectiveFontSize,
                  fontFamily: 'Inter',
                  color: colorScheme.onSurface,
                  letterSpacing: -0.5,
                ),
                children: [
                  TextSpan(
                    text: 'J',
                    style: TextStyle(
                      fontWeight: FontWeight.w800, // Bold initial
                    ),
                  ),
                  TextSpan(
                    text: 'aspinder Kaur Bahara',
                    style: TextStyle(
                      fontWeight: FontWeight.w400, // Normal weight
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(width: 4),
            // Tiny primary accent dot
            Container(
              width: effectiveFontSize * 0.15,
              height: effectiveFontSize * 0.15,
              decoration: BoxDecoration(
                color: colorScheme.primary, // Primary accent dot
                shape: BoxShape.circle,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
