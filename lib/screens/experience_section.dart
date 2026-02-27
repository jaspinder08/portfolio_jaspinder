import 'package:flutter/material.dart';
import '../widgets/animated_section.dart';
import '../widgets/app_icons.dart';

class ExperienceSection extends StatelessWidget {
  const ExperienceSection({super.key});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final isMobile = width < 1024;

    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(
        horizontal: width < 600 ? 16 : 40,
        vertical: 100,
      ),
      child: ConstrainedBox(
        constraints: const BoxConstraints(maxWidth: 1000),
        child: Column(
          children: [
            AnimatedSection(
              child: Column(
                children: [
                  Text(
                    'Professional Experience',
                    style: TextStyle(
                      fontSize: 40,
                      fontWeight: FontWeight.w800,
                      color: Theme.of(context).colorScheme.onSurface,
                      letterSpacing: -1,
                    ),
                  ),
                  SizedBox(height: 8),
                  Text(
                    'My journey through innovative companies, building impactful mobile solutions',
                    style: TextStyle(
                      fontSize: 16,
                      color: Theme.of(context)
                          .colorScheme
                          .onSurface
                          .withOpacity(0.7),
                    ),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: 64),
                ],
              ),
            ),
            _Timeline(isMobile: isMobile),
          ],
        ),
      ),
    );
  }
}

class _Timeline extends StatelessWidget {
  final bool isMobile;
  const _Timeline({required this.isMobile});

  @override
  Widget build(BuildContext context) {
    final experiences = [
      {
        'role': 'Application Developer',
        'company': 'Exackt Techfleeters Pvt. Ltd.',
        'duration': 'Aug 2023 – Present',
        'description':
            'Played a cross-functional role spanning mobile development, web implementation, and design collaboration. Led Flutter-based UI development and API integrations while supporting WordPress web solutions and maintaining design consistency through Figma workflows.'
      },
      {
        'role': 'Flutter Developer Intern',
        'company': 'Exackt Techfleeters Pvt. Ltd.',
        'duration': 'January 2023 – July 2023',
        'description':
            'Joined as a Flutter intern and quickly contributed to live client projects, implementing UI modules, API integrations, and feature enhancements. Converted to full-time based on performance and technical contribution.'
      },
    ];

    return Stack(
      children: [
        Positioned(
          left: isMobile ? 24 : 0,
          right: 0,
          top: 0,
          bottom: 0,
          child: Align(
            alignment: isMobile ? Alignment.centerLeft : Alignment.center,
            child: Container(
              width: 2,
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.secondary.withOpacity(0.5),
                boxShadow: [
                  BoxShadow(
                    color: Theme.of(context)
                        .colorScheme
                        .secondary
                        .withOpacity(0.8),
                    blurRadius: 12,
                  )
                ],
              ),
            ),
          ),
        ),
        Column(
          children: List.generate(experiences.length, (index) {
            final isLeft = index.isEven;
            final exp = experiences[index];
            return AnimatedSection(
              delay: Duration(milliseconds: 200 * (index + 1)),
              child: _TimelineItem(
                isMobile: isMobile,
                isLeft: isLeft,
                role: exp['role']!,
                company: exp['company']!,
                duration: exp['duration']!,
                description: exp['description']!,
              ),
            );
          }),
        ),
      ],
    );
  }
}

class _TimelineItem extends StatelessWidget {
  final bool isMobile;
  final bool isLeft;
  final String role;
  final String company;
  final String duration;
  final String description;

  const _TimelineItem({
    required this.isMobile,
    required this.isLeft,
    required this.role,
    required this.company,
    required this.duration,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    if (isMobile) {
      return Padding(
        padding: const EdgeInsets.only(bottom: 32),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Node
            Container(
              margin: const EdgeInsets.only(top: 24, left: 18, right: 32),
              width: 14,
              height: 14,
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.background,
                shape: BoxShape.circle,
                border: Border.all(
                    color: Theme.of(context).colorScheme.secondary, width: 3),
                boxShadow: [
                  BoxShadow(
                    color: Theme.of(context).colorScheme.secondary,
                    blurRadius: 12,
                    spreadRadius: 2,
                  )
                ],
              ),
            ),
            Expanded(child: _buildCard(context)),
          ],
        ),
      );
    }

    // Desktop Alternating
    return Padding(
      padding: const EdgeInsets.only(bottom: 40),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            child: isLeft
                ? Align(
                    alignment: Alignment.centerRight,
                    child: Padding(
                      padding: const EdgeInsets.only(right: 48),
                      child: _buildCard(context),
                    ),
                  )
                : const SizedBox(),
          ),
          // Node
          Container(
            width: 14,
            height: 14,
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.background,
              shape: BoxShape.circle,
              border: Border.all(
                  color: Theme.of(context).colorScheme.secondary, width: 3),
              boxShadow: [
                BoxShadow(
                  color: Theme.of(context).colorScheme.secondary,
                  blurRadius: 12,
                  spreadRadius: 2,
                )
              ],
            ),
          ),
          Expanded(
            child: !isLeft
                ? Align(
                    alignment: Alignment.centerLeft,
                    child: Padding(
                      padding: const EdgeInsets.only(left: 48),
                      child: _buildCard(context),
                    ),
                  )
                : const SizedBox(),
          ),
        ],
      ),
    );
  }

  Widget _buildCard(BuildContext context) {
    return Container(
      width: double.infinity,
      constraints: BoxConstraints(
        maxWidth: isMobile ? double.infinity : 450,
      ),
      padding: const EdgeInsets.all(32),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.surface,
        borderRadius: BorderRadius.circular(24),
        border: Border.all(
          color: Theme.of(context).colorScheme.outline.withOpacity(0.4),
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
        crossAxisAlignment: isMobile || isLeft
            ? CrossAxisAlignment.start
            : CrossAxisAlignment.end,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              if (isMobile || isLeft) ...[
                const AppIconContainer(
                  icon: AppIcons.business,
                  size: 40,
                  iconSize: 20,
                ),
                const SizedBox(width: 16),
              ],
              Expanded(
                child: Column(
                  crossAxisAlignment: isMobile || isLeft
                      ? CrossAxisAlignment.start
                      : CrossAxisAlignment.end,
                  children: [
                    Text(
                      company,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Theme.of(context).colorScheme.onSurface,
                      ),
                    ),
                    Text(
                      role,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        fontSize: 14,
                        color: Theme.of(context).colorScheme.primary,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              ),
              if (!isMobile && !isLeft) ...[
                const SizedBox(width: 16),
                const AppIconContainer(
                  icon: AppIcons.business,
                  size: 40,
                  iconSize: 20,
                ),
              ],
            ],
          ),
          const SizedBox(height: 24),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.primary.withOpacity(0.1),
              borderRadius: BorderRadius.circular(50),
              border: Border.all(
                  color:
                      Theme.of(context).colorScheme.secondary.withOpacity(0.3)),
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(AppIcons.date,
                    size: 14, color: Theme.of(context).colorScheme.secondary),
                const SizedBox(width: 6),
                Text(
                  duration,
                  style: TextStyle(
                    color: Theme.of(context)
                        .colorScheme
                        .onSurface
                        .withOpacity(0.8),
                    fontSize: 12,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 16),
          Text(
            description,
            style: TextStyle(
              fontSize: 14,
              color: Theme.of(context).colorScheme.onSurface.withOpacity(0.6),
              height: 1.6,
            ),
            textAlign: isMobile || isLeft ? TextAlign.left : TextAlign.right,
          ),
        ],
      ),
    );
  }
}
