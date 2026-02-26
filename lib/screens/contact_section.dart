import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import '../providers/theme_provider.dart';
import '../widgets/animated_section.dart';
import '../widgets/app_icons.dart';

class ContactSection extends StatelessWidget {
  const ContactSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 100),
      child: ConstrainedBox(
        constraints: const BoxConstraints(maxWidth: 1100),
        child: Column(
          children: [
            const AnimatedSection(
              child: Column(
                children: [
                  Text(
                    'Ready to Scale Your Vision?',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 40,
                      fontWeight: FontWeight.w800,
                      color: AppColors.textPrimary,
                      letterSpacing: -1,
                    ),
                  ),
                  SizedBox(height: 16),
                  Text(
                    'I partner with startups, founders, and businesses to build high-performance Flutter applications and resilient IoT ecosystems that drive real growth. Let’s discuss how I can help you scale.',
                    style: TextStyle(
                      fontSize: 18,
                      height: 1.5,
                      color: AppColors.textSecondary,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: 32),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.circle, color: Colors.green, size: 8),
                      SizedBox(width: 8),
                      Text(
                        'Available for new freelance projects',
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                          color: AppColors.accentCyan,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 56),
                ],
              ),
            ),
            AnimatedSection(
              delay: const Duration(milliseconds: 200),
              child: LayoutBuilder(builder: (context, constraints) {
                final width = constraints.maxWidth;
                double cardWidth;

                if (width > 1024) {
                  // Desktop: 3 cards
                  cardWidth = (width - 48) / 3;
                } else if (width > 700) {
                  // Tablet: 2 cards
                  cardWidth = (width - 24) / 2;
                } else {
                  // Mobile: 1 card
                  cardWidth = width;
                }

                return Wrap(
                  spacing: 24,
                  runSpacing: 24,
                  alignment: WrapAlignment.center,
                  children: _buildContactBlocks(cardWidth),
                );
              }),
            ),
          ],
        ),
      ),
    );
  }

  List<Widget> _buildContactBlocks(double width) {
    final contacts = [
      {
        'icon': AppIcons.email,
        'title': 'Email',
        'value': 'jaspinderkaurjk08@gmail.com',
        'url': 'mailto:jaspinderkaurjk08@gmail.com',
      },
      {
        'icon': AppIcons.phone,
        'title': 'Phone / WhatsApp',
        'value': '+91 9399931040',
        'url': 'https://wa.me/919399931040',
      },
      {
        'icon': AppIcons.link,
        'title': 'LinkedIn',
        'value': 'linkedin.com/in/jaspinderkaur',
        'url': 'https://www.linkedin.com/in/jaspinderkaur',
      },
    ];

    return contacts.map((c) {
      return SizedBox(
        width: width,
        child: IntrinsicHeight(
          child: _ContactBlock(
            icon: c['icon'] as IconData,
            title: c['title'] as String,
            value: c['value'] as String,
            url: c['url'] as String,
          ),
        ),
      );
    }).toList();
  }
}

class _ContactBlock extends StatefulWidget {
  final IconData icon;
  final String title;
  final String value;
  final String url;

  const _ContactBlock({
    required this.icon,
    required this.title,
    required this.value,
    required this.url,
  });

  @override
  State<_ContactBlock> createState() => _ContactBlockState();
}

class _ContactBlockState extends State<_ContactBlock> {
  bool _hovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      onEnter: (_) => setState(() => _hovered = true),
      onExit: (_) => setState(() => _hovered = false),
      child: GestureDetector(
        onTap: () async {
          final uri = Uri.parse(widget.url);
          if (await canLaunchUrl(uri)) {
            await launchUrl(uri);
          }
        },
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeOutCubic,
          height: double.infinity,
          width: double.infinity,
          transform: Matrix4.identity()
            ..translate(0.0, _hovered ? -4.0 : 0.0)
            ..scale(_hovered ? 1.02 : 1.0),
          transformAlignment: Alignment.center,
          padding: const EdgeInsets.symmetric(vertical: 40, horizontal: 24),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(22),
            border: Border.all(
              color: _hovered
                  ? AppColors.accentCyan.withOpacity(0.5)
                  : AppColors.border.withOpacity(0.15),
              width: 1.2,
            ),
            boxShadow: [
              BoxShadow(
                color: _hovered
                    ? AppColors.accentCyan.withOpacity(0.12)
                    : Colors.black.withOpacity(0.15),
                blurRadius: _hovered ? 30 : 15,
                spreadRadius: _hovered ? 10 : 0,
                offset: const Offset(0, 8),
              ),
            ],
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: _hovered
                  ? [
                      const Color(0xFF131B31),
                      const Color(0xFF1E293B),
                    ]
                  : [
                      const Color(0xFF0F1629).withOpacity(0.6),
                      const Color(0xFF131B31).withOpacity(0.4),
                    ],
            ),
          ),
          child: Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                AppIconContainer(
                  icon: widget.icon,
                  size: 56,
                  iconSize: 24,
                  forceHover: _hovered,
                ),
                const SizedBox(height: 24),
                Text(
                  widget.title.toUpperCase(),
                  style: const TextStyle(
                    color: AppColors.accentCyan,
                    fontSize: 12,
                    fontWeight: FontWeight.w800,
                    letterSpacing: 1.5,
                  ),
                ),
                const SizedBox(height: 12),
                Text(
                  widget.value,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    color: AppColors.textPrimary,
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                    height: 1.4,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
