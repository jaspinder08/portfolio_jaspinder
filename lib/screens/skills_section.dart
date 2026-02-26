import 'package:flutter/material.dart';
import '../providers/theme_provider.dart';
import '../widgets/animated_section.dart';
import '../widgets/app_icons.dart';

class SkillsSection extends StatelessWidget {
  const SkillsSection({super.key});

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
                    'Skills & Expertise',
                    style: TextStyle(
                      fontSize: 40,
                      fontWeight: FontWeight.w800,
                      color: AppColors.textPrimary,
                      letterSpacing: -1,
                    ),
                  ),
                  SizedBox(height: 8),
                  Text(
                    'A comprehensive toolkit built through years of hands-on experience',
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
    final categories = [
      {
        'title': 'Core Logic',
        'icon': AppIcons.skillCode,
        'skills': ['Dart', 'Flutter', 'RESTful APIs', 'Git', 'OOP'],
        'delay': 200,
      },
      {
        'title': 'Architecture',
        'icon': AppIcons.skillArchitecture,
        'skills': ['Bloc', 'Provider', 'Clean Arch'],
        'delay': 300,
      },
      {
        'title': 'Backend',
        'icon': AppIcons.skillDatabase,
        'skills': [
          'Firebase',
          'PostgreSQL',
        ],
        'delay': 400,
      },
      {
        'title': 'Offline Mode',
        'icon': AppIcons.skillOffline,
        'skills': ['Hive', 'Shared Prefs', 'Secure Storage', 'Isar'],
        'delay': 500,
      },
      {
        'title': 'Design',
        'icon': AppIcons.skillDesign,
        'skills': [
          'Figma',
          'UI/UX',
        ],
        'delay': 600,
      },
      {
        'title': 'DevOps & Deployment',
        'icon': AppIcons.skillDevOps,
        'skills': ['CI/CD', 'GitHub Actions', 'Vercel'],
        'delay': 700,
      },
    ];

    return Wrap(
      spacing: 24,
      runSpacing: 24,
      children: categories.map((cat) {
        return FractionallySizedBox(
          widthFactor: isMobile ? 1 : (isTablet ? 0.48 : 0.31),
          child: AnimatedSection(
            delay: Duration(milliseconds: cat['delay'] as int),
            child: _SkillCategoryCard(
              title: cat['title'] as String,
              icon: cat['icon'] as IconData,
              skills: cat['skills'] as List<String>,
            ),
          ),
        );
      }).toList(),
    );
  }
}

class _SkillCategoryCard extends StatelessWidget {
  final String title;
  final IconData icon;
  final List<String> skills;

  const _SkillCategoryCard({
    required this.title,
    required this.icon,
    required this.skills,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(32),
      decoration: BoxDecoration(
        color: AppColors.bgSurface.withOpacity(0.5),
        borderRadius: BorderRadius.circular(24),
        border: Border.all(
          color: AppColors.border.withOpacity(0.5),
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.2),
            blurRadius: 20,
            offset: const Offset(0, 10),
          )
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              AppIconContainer(
                icon: icon,
                size: 40,
                iconSize: 20,
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Text(
                  title,
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w700,
                    color: AppColors.textPrimary,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 24),
          Wrap(
            spacing: 12,
            runSpacing: 12,
            children: skills.map((skill) => _SkillTag(skill: skill)).toList(),
          ),
        ],
      ),
    );
  }
}

class _SkillTag extends StatefulWidget {
  final String skill;

  const _SkillTag({required this.skill});

  @override
  State<_SkillTag> createState() => _SkillTagState();
}

class _SkillTagState extends State<_SkillTag> {
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
          color: _hovered
              ? AppColors.accentCyan.withOpacity(0.1)
              : AppColors.bgCard,
          borderRadius: BorderRadius.circular(50),
          border: Border.all(
            color: _hovered
                ? AppColors.accentCyan.withOpacity(0.4)
                : AppColors.border.withOpacity(0.3),
          ),
          boxShadow: _hovered
              ? [
                  BoxShadow(
                    color: AppColors.accentCyan.withOpacity(0.2),
                    blurRadius: 10,
                  )
                ]
              : [],
        ),
        child: Text(
          widget.skill,
          style: TextStyle(
            color: _hovered ? AppColors.accentCyan : AppColors.textSecondary,
            fontSize: 13,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    );
  }
}
