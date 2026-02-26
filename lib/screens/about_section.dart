import 'package:flutter/material.dart';
import '../providers/theme_provider.dart';
import '../widgets/animated_section.dart';
import '../widgets/app_icons.dart';

class AboutSection extends StatelessWidget {
  const AboutSection({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final isMobile = size.width < 900;

    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(
        horizontal: isMobile ? 24 : 64,
        vertical: 100,
      ),
      child: ConstrainedBox(
        constraints: const BoxConstraints(maxWidth: 1100),
        child: Column(
          children: [
            // Header
            const AnimatedSection(
              child: Column(
                children: [
                  Text(
                    'About Me',
                    style: TextStyle(
                      fontSize: 40,
                      fontWeight: FontWeight.w800,
                      color: AppColors.textPrimary,
                      letterSpacing: -1,
                    ),
                  ),
                  SizedBox(height: 8),
                  Text(
                    'Crafting exceptional mobile experiences with passion and precision',
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

            // Content
            if (isMobile)
              Column(
                children: [
                  _buildBioBlocks(),
                  const SizedBox(height: 32),
                  _buildQuickFacts(),
                ],
              )
            else
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(flex: 3, child: _buildBioBlocks()),
                  const SizedBox(width: 48),
                  Expanded(flex: 2, child: _buildQuickFacts()),
                ],
              ),
          ],
        ),
      ),
    );
  }

  Widget _buildBioBlocks() {
    final bioTexts = [
      "I'm a Flutter-focused mobile engineer and UI/UX designer who builds refined, scalable mobile experiences. With 3+ years of hands-on experience, I transform complex product ideas into clean, high-performance applications that feel effortless to use.",
      'My strength lies in bridging design and engineering — from building structured design systems and pixel-precise interfaces to implementing maintainable architectures with Flutter, Firebase, and REST APIs. I focus on clean code, reusable components, and scalable state management that supports long-term product growth.',
      'Beyond features, I think in systems. I care deeply about performance, interaction details, spacing, and usability. I continuously explore modern tools and best practices to elevate both product quality and engineering standards.',
    ];

    return Column(
      children: bioTexts.map((text) {
        return AnimatedSection(
          child: Container(
            margin: const EdgeInsets.only(bottom: 24),
            padding: const EdgeInsets.all(28),
            decoration: BoxDecoration(
              color: AppColors.bgSurface.withOpacity(0.5),
              borderRadius: BorderRadius.circular(24),
              border: Border.all(
                color: AppColors.border.withOpacity(0.4),
              ),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.2),
                  blurRadius: 20,
                  offset: const Offset(0, 8),
                )
              ],
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: Text(
                    text,
                    style: const TextStyle(
                      color: AppColors.textSecondary,
                      fontSize: 15,
                      height: 1.8,
                    ),
                  ),
                ),
                const SizedBox(width: 16),
                Container(
                  width: 12,
                  height: 12,
                  decoration: BoxDecoration(
                    color: AppColors.bgSurface,
                    shape: BoxShape.circle,
                    border: Border.all(color: AppColors.accentCyan, width: 2),
                    boxShadow: [
                      BoxShadow(
                        color: AppColors.accentCyan.withOpacity(0.3),
                        blurRadius: 8,
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      }).toList(),
    );
  }

  Widget _buildQuickFacts() {
    return AnimatedSection(
      delay: const Duration(milliseconds: 200),
      child: Container(
        padding: const EdgeInsets.all(32),
        decoration: BoxDecoration(
          color: AppColors.bgCard,
          borderRadius: BorderRadius.circular(24),
          border: Border.all(
            color: AppColors.border.withOpacity(0.6),
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.25),
              blurRadius: 24,
              offset: const Offset(0, 10),
            )
          ],
        ),
        child: const Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                AppIconContainer(
                  icon: AppIcons.bolt,
                  size: 44,
                  iconSize: 22,
                ),
                SizedBox(width: 16),
                Text(
                  'Quick Facts',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w700,
                    color: AppColors.textPrimary,
                  ),
                ),
              ],
            ),
            SizedBox(height: 32),
            _FactItem(
              icon: AppIcons.location,
              title: 'LOCATION',
              value: 'Jaipur, India', // Changed default assuming
            ),
            _FactItem(
              icon: AppIcons.workHistory,
              title: 'EXPERIENCE',
              value: '3+ years',
            ),
            _FactItem(
              icon: AppIcons.language,
              title: 'LANGUAGES',
              value: 'English, Hindi, Punjabi',
            ),
            _FactItem(
              icon: AppIcons.school,
              title: 'EDUCATION',
              value: 'Master in Computer Application',
            ),
            _FactItem(
              icon: AppIcons.work,
              title: 'CURRENT ROLE',
              value: 'Flutter Developer',
            ),
          ],
        ),
      ),
    );
  }
}

class _FactItem extends StatelessWidget {
  final IconData icon;
  final String title;
  final String value;

  const _FactItem({
    required this.icon,
    required this.title,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 24),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AppIconContainer(
            icon: icon,
            size: 38,
            iconSize: 18,
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    color: AppColors.accentCyan,
                    fontSize: 11,
                    fontWeight: FontWeight.w700,
                    letterSpacing: 1.2,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  value,
                  style: const TextStyle(
                    color: AppColors.textPrimary,
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
