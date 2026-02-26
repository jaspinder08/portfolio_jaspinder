// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import '../models/testimonial_model.dart';
import '../providers/theme_provider.dart';
import '../widgets/animated_section.dart';
import '../widgets/app_icons.dart';

class TestimonialsSection extends StatefulWidget {
  const TestimonialsSection({super.key});

  @override
  State<TestimonialsSection> createState() => _TestimonialsSectionState();
}

class _TestimonialsSectionState extends State<TestimonialsSection>
    with SingleTickerProviderStateMixin {
  final PageController _pageController = PageController(viewportFraction: 0.88);
  int _currentPage = 0;
  late AnimationController _quoteController;
  late Animation<double> _quoteAnim;

  static const _testimonials = [
    TestimonialModel(
      id: '1',
      quote:
          'An exceptional developer who consistently delivers high-quality code. Her attention to detail and problem-solving skills are outstanding — working with Jaspinder has been a pleasure.',
      authorName: 'Sarah Johnson',
      authorTitle: 'Senior Project Manager',
      authorCompany: 'TechCorp',
    ),
    TestimonialModel(
      id: '2',
      quote:
          'Technical expertise combined with excellent communication makes Jaspinder an invaluable member of any team. She navigates complex requirements with ease.',
      authorName: 'Michael Chen',
      authorTitle: 'Lead Developer',
      authorCompany: 'StartupXYZ',
    ),
    TestimonialModel(
      id: '3',
      quote:
          'Her ability to translate complex requirements into elegant Flutter solutions is remarkable. Projects are consistently delivered on time and above expectations.',
      authorName: 'Emily Rodriguez',
      authorTitle: 'Product Owner',
      authorCompany: 'Innovation Labs',
    ),
    TestimonialModel(
      id: '4',
      quote:
          'Working with Jaspinder was a game-changer. Her Flutter expertise helped us ship a beautiful, responsive app that our users genuinely love.',
      authorName: 'David Thompson',
      authorTitle: 'CEO',
      authorCompany: 'MobileFirst',
    ),
    TestimonialModel(
      id: '5',
      quote:
          'Technical skill matched only by professionalism and dedication. She always goes the extra mile to ensure project success and is a joy to collaborate with.',
      authorName: 'Lisa Wang',
      authorTitle: 'CTO',
      authorCompany: 'Digital Solutions',
    ),
  ];

  @override
  void initState() {
    super.initState();
    _quoteController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 4),
    )..repeat(reverse: true);
    _quoteAnim = Tween<double>(begin: 0.6, end: 1.0).animate(
        CurvedAnimation(parent: _quoteController, curve: Curves.easeInOut));
  }

  @override
  void dispose() {
    _pageController.dispose();
    _quoteController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final isMobile = size.width < 768;
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final bg = isDark ? AppColors.bgBase : AppColors.lBgBase;

    return Container(
      color: bg,
      width: double.infinity,
      constraints: BoxConstraints(minHeight: size.height),
      child: SingleChildScrollView(
        physics: const NeverScrollableScrollPhysics(),
        padding: EdgeInsets.fromLTRB(
          isMobile ? 0 : 0,
          isMobile ? 88 : 100,
          0,
          32,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // ── Header ─────────────────────────────────────────────
            AnimatedSection(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: isMobile ? 20 : 48),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      '// WHAT OTHERS SAY',
                      style: TextStyle(
                        color: AppColors.accentCyan,
                        fontSize: 12,
                        fontWeight: FontWeight.w700,
                        letterSpacing: 2,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      'Testimonials',
                      style: TextStyle(
                        fontSize: 36,
                        fontWeight: FontWeight.w800,
                        letterSpacing: -0.5,
                        color: isDark
                            ? AppColors.textPrimary
                            : AppColors.lTextPrimary,
                      ),
                    ),
                    const SizedBox(height: 6),
                    Text(
                      'Words from people I\'ve worked with',
                      style: TextStyle(
                        fontSize: 15,
                        color:
                            isDark ? AppColors.textMuted : AppColors.lTextMuted,
                      ),
                    ),
                    const SizedBox(height: 16),
                    Container(
                      width: 48,
                      height: 3,
                      decoration: BoxDecoration(
                        gradient: const LinearGradient(
                          colors: [AppColors.accent, AppColors.accentCyan],
                        ),
                        borderRadius: BorderRadius.circular(4),
                      ),
                    ),
                  ],
                ),
              ),
            ),

            const SizedBox(height: 40),

            // ── Carousel ────────────────────────────────────────────
            AnimatedSection(
              delay: const Duration(milliseconds: 200),
              child: SizedBox(
                height: isMobile ? 340 : 300,
                child: PageView.builder(
                  controller: _pageController,
                  onPageChanged: (i) => setState(() => _currentPage = i),
                  itemCount: _testimonials.length,
                  itemBuilder: (context, i) => _TestimonialCard(
                    testimonial: _testimonials[i],
                    isDark: isDark,
                    quoteAnim: _quoteAnim,
                    isActive: _currentPage == i,
                  ),
                ),
              ),
            ),

            const SizedBox(height: 28),

            // ── Indicators ────────────────────────────────────────
            AnimatedSection(
              delay: const Duration(milliseconds: 300),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // Prev
                  _NavArrow(
                    icon: AppIcons.arrowBack,
                    isDark: isDark,
                    onTap: _currentPage > 0
                        ? () => _pageController.previousPage(
                              duration: const Duration(milliseconds: 400),
                              curve: Curves.easeInOutCubic,
                            )
                        : null,
                  ),
                  const SizedBox(width: 16),
                  // Dots
                  ...List.generate(_testimonials.length, (i) {
                    final active = _currentPage == i;
                    return GestureDetector(
                      onTap: () => _pageController.animateToPage(
                        i,
                        duration: const Duration(milliseconds: 400),
                        curve: Curves.easeInOutCubic,
                      ),
                      child: AnimatedContainer(
                        duration: const Duration(milliseconds: 250),
                        width: active ? 24 : 8,
                        height: 8,
                        margin: const EdgeInsets.symmetric(horizontal: 3),
                        decoration: BoxDecoration(
                          color: active
                              ? AppColors.accent
                              : (isDark ? AppColors.border : AppColors.lBorder),
                          borderRadius: BorderRadius.circular(50),
                        ),
                      ),
                    );
                  }),
                  const SizedBox(width: 16),
                  // Next
                  _NavArrow(
                    icon: AppIcons.arrowForward,
                    isDark: isDark,
                    onTap: _currentPage < _testimonials.length - 1
                        ? () => _pageController.nextPage(
                              duration: const Duration(milliseconds: 400),
                              curve: Curves.easeInOutCubic,
                            )
                        : null,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// ─── Testimonial Card ──────────────────────────────────────────────────────────

class _TestimonialCard extends StatelessWidget {
  const _TestimonialCard({
    required this.testimonial,
    required this.isDark,
    required this.quoteAnim,
    required this.isActive,
  });
  final TestimonialModel testimonial;
  final bool isDark;
  final Animation<double> quoteAnim;
  final bool isActive;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        transform: Matrix4.identity()..scale(isActive ? 1.0 : 0.98),
        transformAlignment: Alignment.center,
        decoration: BoxDecoration(
          color: isDark ? AppColors.bgSurface : AppColors.lBgCard,
          borderRadius: BorderRadius.circular(24),
          border: Border.all(
            color: isActive
                ? (isDark
                    ? AppColors.border.withOpacity(0.8)
                    : AppColors.lBorder)
                : (isDark
                    ? AppColors.border.withOpacity(0.3)
                    : AppColors.lBorder.withOpacity(0.5)),
            width: 1,
          ),
          boxShadow: isActive
              ? [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.2),
                    blurRadius: 20,
                    offset: const Offset(0, 8),
                  )
                ]
              : [],
        ),
        child: Padding(
          padding: const EdgeInsets.all(28),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Quote icon row
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  AnimatedBuilder(
                    animation: quoteAnim,
                    builder: (_, __) => Opacity(
                      opacity: isActive ? quoteAnim.value : 0.4,
                      child: const AppIconContainer(
                        icon: AppIcons.quote,
                        size: 48,
                        iconSize: 28,
                        color: AppColors.accentCyan,
                      ),
                    ),
                  ),
                  // Star rating
                  Row(
                    children: List.generate(
                      5,
                      (_) => const Icon(
                        AppIcons.star,
                        color: Color(0xFFEAB308), // softer yellow
                        size: 16,
                      ),
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 14),

              // Quote text
              Expanded(
                child: Text(
                  testimonial.quote,
                  style: TextStyle(
                    fontSize: 14,
                    height: 1.7,
                    color: isDark
                        ? AppColors.textSecondary
                        : AppColors.lTextSecondary,
                    fontStyle: FontStyle.italic,
                  ),
                  maxLines: 5,
                  overflow: TextOverflow.ellipsis,
                ),
              ),

              const SizedBox(height: 20),

              // Divider
              Container(
                height: 1,
                color: isDark ? AppColors.border : AppColors.lBorder,
              ),

              const SizedBox(height: 16),

              // Author
              Row(
                children: [
                  // Avatar
                  Container(
                    width: 44,
                    height: 44,
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      gradient: LinearGradient(
                        colors: [AppColors.accent, AppColors.accentCyan],
                      ),
                    ),
                    child: Center(
                      child: Text(
                        testimonial.authorName.isNotEmpty
                            ? testimonial.authorName[0]
                            : '?',
                        style: const TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w700,
                          fontSize: 18,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          testimonial.authorName,
                          style: TextStyle(
                            fontWeight: FontWeight.w700,
                            fontSize: 14,
                            color: isDark
                                ? AppColors.textPrimary
                                : AppColors.lTextPrimary,
                          ),
                        ),
                        Text(
                          '${testimonial.authorTitle}${testimonial.authorCompany != null ? ' · ${testimonial.authorCompany}' : ''}',
                          style: const TextStyle(
                            fontSize: 12,
                            color: AppColors.accentCyan,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// ─── Arrow Button ──────────────────────────────────────────────────────────────

class _NavArrow extends StatelessWidget {
  const _NavArrow(
      {required this.icon, required this.isDark, required this.onTap});
  final IconData icon;
  final bool isDark;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    final enabled = onTap != null;
    return GestureDetector(
      onTap: onTap,
      child: AppIconContainer(
        icon: icon,
        size: 36,
        iconSize: 14,
        enabled: enabled,
      ),
    );
  }
}
