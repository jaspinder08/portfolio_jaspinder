import 'package:flutter/material.dart';
import '../providers/theme_provider.dart';
import '../widgets/animated_section.dart';
import '../widgets/app_icons.dart';

class ProjectsSection extends StatelessWidget {
  const ProjectsSection({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final isMobile = size.width < 900;
    final isTablet = size.width >= 900 && size.width < 1200;

    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(
        horizontal: isMobile ? 24 : 64,
        vertical: 100,
      ),
      child: ConstrainedBox(
        constraints: const BoxConstraints(maxWidth: 1200),
        child: Column(
          children: [
            const AnimatedSection(
              child: Column(
                children: [
                  Text(
                    'Featured Projects',
                    style: TextStyle(
                      fontSize: 40,
                      fontWeight: FontWeight.w800,
                      color: AppColors.textPrimary,
                      letterSpacing: -1,
                    ),
                  ),
                  SizedBox(height: 8),
                  Text(
                    'Showcasing real-world applications built with Flutter, delivering exceptional user\nexperiences',
                    style: TextStyle(
                      fontSize: 16,
                      color: AppColors.textSecondary,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: 64),
                ],
              ),
            ),
            _buildGrid(isMobile, isTablet),
          ],
        ),
      ),
    );
  }

  Widget _buildGrid(bool isMobile, bool isTablet) {
    final projects = [
      {
        'title': 'Astha – B2B Jewellery Marketplace',
        'desc':
            'B2B e-commerce application for silver and gold jewellery businesses. Implemented cart management, secure payment gateway integration, and order workflows with scalable Flutter architecture and optimized UI performance.',
        'icon': AppIcons.projectShop,
        'tags': ['Flutter', 'Payment Gateway', 'B2B', 'REST APIs'],
        'delay': 300,
      },
      {
        'title': 'XpenceAI – Smart Expense Manager',
        'desc':
            'AI-powered expense management app with automated categorization, financial analytics dashboards, and structured data visualization. Integrated intelligent backend APIs with clean and maintainable UI architecture.',
        'icon': AppIcons.projectWallet,
        'tags': ['Flutter', 'AI', 'Analytics', 'Clean Arch'],
        'delay': 400,
      },
      {
        'title': 'ItsOnlySaara',
        'desc':
            'Designed and developed a jewellery e-commerce website using WordPress, handling product listings, layout customization, and iterative UI improvements in collaboration with stakeholders.',
        'icon': AppIcons.projectShop,
        'tags': ['WordPress', 'E-Commerce', 'UI/UX', 'Design'],
        'delay': 350,
      },
      {
        'title': 'Time Logger – Employee App',
        'desc':
            'Workforce time tracking solution featuring attendance logging, role-based workflows, and productivity monitoring. Designed intuitive UI flows and integrated backend services for real-time data handling.',
        'icon': AppIcons.projectClock,
        'tags': [
          'Flutter',
          'Workforce',
          'Real-time',
          'Design',
          'REST APIs',
        ],
        'delay': 500,
      },
      {
        'title': 'Inckt – IoT Platform',
        'desc':
            'IoT-based mobile application enabling real-time device monitoring and control. Built dashboard interfaces, integrated APIs, and currently leading a full UI/UX redesign using Figma.',
        'icon': AppIcons.projectIoT,
        'tags': ['Flutter', 'IoT', 'REST APIs', 'UI/UX'],
        'delay': 200,
      },
      // {
      //   'title': 'Codeckt – Learning & Code Platform',
      //   'desc':
      //       'Educational mobile platform providing categorized study materials and structured coding resources. Focused on clean UI implementation and scalable content architecture with interactive learning modules.',
      //   'icon': AppIcons.projectCode,
      //   'tags': ['Flutter', 'Education', 'Code Resource', 'Content Arch'],
      //   'delay': 600,
      // },
      {
        'title': 'Personal Portfolio & Design System',
        'desc':
            'Modern developer portfolio built with Flutter Web, emphasizing reusable components, design tokens, responsive layouts, and refined UI interactions. Currently preparing for deployment.',
        'icon': AppIcons.projectWeb,
        'tags': ['Flutter Web', 'Design System', 'Responsive', 'Tokens'],
        'delay': 700,
      },
    ];

    final double widthFactor = isMobile ? 1 : (isTablet ? 0.48 : 0.31);

    return Wrap(
      spacing: 24,
      runSpacing: 24,
      children: projects.map((p) {
        return FractionallySizedBox(
          widthFactor: widthFactor,
          child: AnimatedSection(
            delay: Duration(milliseconds: p['delay'] as int),
            child: _ProjectCard(
              title: p['title'] as String,
              description: p['desc'] as String,
              iconData: p['icon'] as IconData,
              tags: p['tags'] as List<String>,
            ),
          ),
        );
      }).toList(),
    );
  }
}

class _ProjectCard extends StatefulWidget {
  final String title;
  final String description;
  final IconData iconData;
  final List<String> tags;

  const _ProjectCard({
    required this.title,
    required this.description,
    required this.iconData,
    required this.tags,
  });

  @override
  State<_ProjectCard> createState() => _ProjectCardState();
}

class _ProjectCardState extends State<_ProjectCard> {
  bool _hovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _hovered = true),
      onExit: (_) => setState(() => _hovered = false),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        transform: Matrix4.identity()..translate(0.0, _hovered ? -8.0 : 0.0),
        padding: const EdgeInsets.all(32),
        decoration: BoxDecoration(
          color: AppColors.bgSurface.withOpacity(0.5),
          borderRadius: BorderRadius.circular(24),
          border: Border.all(
            color: _hovered
                ? AppColors.accentCyan.withOpacity(0.4)
                : AppColors.border.withOpacity(0.5),
            width: _hovered ? 1.5 : 1.0,
          ),
          boxShadow: _hovered
              ? [
                  BoxShadow(
                    color: AppColors.accentCyan.withOpacity(0.12),
                    blurRadius: 24,
                    offset: const Offset(0, 8),
                  )
                ]
              : [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.2),
                    blurRadius: 20,
                    offset: const Offset(0, 10),
                  )
                ],
        ),
        child: Column(
          children: [
            // Icon Placeholder
            AppIconContainer(
              icon: widget.iconData,
              size: 56,
              iconSize: 26,
            ),
            const SizedBox(height: 24),
            Text(
              widget.title,
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w700,
                color: AppColors.textPrimary,
              ),
            ),
            const SizedBox(height: 16),
            Text(
              widget.description,
              textAlign: TextAlign.center,
              maxLines: 4,
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(
                fontSize: 14,
                height: 1.6,
                color: AppColors.textSecondary,
              ),
            ),
            const SizedBox(height: 24),
            Wrap(
              alignment: WrapAlignment.center,
              spacing: 8,
              runSpacing: 8,
              children: widget.tags.map((tag) => _TechTag(label: tag)).toList(),
            ),
          ],
        ),
      ),
    );
  }
}

class _TechTag extends StatefulWidget {
  final String label;
  const _TechTag({required this.label});

  @override
  State<_TechTag> createState() => _TechTagState();
}

class _TechTagState extends State<_TechTag> {
  bool _hovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _hovered = true),
      onExit: (_) => setState(() => _hovered = false),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
        decoration: BoxDecoration(
          color: _hovered
              ? AppColors.accentCyan.withOpacity(0.15)
              : AppColors.bgCard.withOpacity(0.3),
          borderRadius: BorderRadius.circular(50),
          border: Border.all(
            color: _hovered
                ? AppColors.accentCyan.withOpacity(0.4)
                : AppColors.border.withOpacity(0.2),
            width: 1,
          ),
          boxShadow: _hovered
              ? [
                  BoxShadow(
                    color: AppColors.accentCyan.withOpacity(0.1),
                    blurRadius: 8,
                    spreadRadius: 1,
                  )
                ]
              : [],
        ),
        child: Text(
          widget.label,
          style: TextStyle(
            color: _hovered ? AppColors.accentCyan : AppColors.textSecondary,
            fontSize: 11,
            fontWeight: FontWeight.w500,
            letterSpacing: 0.2,
          ),
        ),
      ),
    );
  }
}

class _StoreButton extends StatefulWidget {
  final IconData icon;
  final String label;

  const _StoreButton({
    required this.icon,
    required this.label,
  });

  @override
  State<_StoreButton> createState() => _StoreButtonState();
}

class _StoreButtonState extends State<_StoreButton> {
  bool _hovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _hovered = true),
      onExit: (_) => setState(() => _hovered = false),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        decoration: BoxDecoration(
          color: _hovered ? AppColors.bgSurface : AppColors.bgCard,
          borderRadius: BorderRadius.circular(50),
          border: Border.all(
            color:
                _hovered ? AppColors.border : AppColors.border.withOpacity(0.5),
          ),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(widget.icon, color: AppColors.accentCyan, size: 16),
            const SizedBox(width: 6),
            Text(
              widget.label,
              style: TextStyle(
                color:
                    _hovered ? AppColors.textPrimary : AppColors.textSecondary,
                fontSize: 12,
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
