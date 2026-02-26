// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import '../providers/theme_provider.dart';
import '../widgets/animated_section.dart';
import '../widgets/app_icons.dart';

class WelcomeSection extends StatefulWidget {
  const WelcomeSection({super.key, this.onViewWork, this.onContactMe});
  final VoidCallback? onViewWork;
  final VoidCallback? onContactMe;

  @override
  State<WelcomeSection> createState() => _WelcomeSectionState();
}

class _WelcomeSectionState extends State<WelcomeSection>
    with TickerProviderStateMixin {
  // Cursor blink for the typewriter effect
  late AnimationController _blinkController;

  @override
  void initState() {
    super.initState();

    _blinkController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 800),
    )..repeat(reverse: true);
  }

  @override
  void dispose() {
    _blinkController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final isMobile = size.width < 768;
    final brightness = Theme.of(context).brightness;
    final isDark = brightness == Brightness.dark;

    return Container(
      width: double.infinity,
      // Ensure the section fills the full viewport height minus the navbar
      constraints: BoxConstraints(minHeight: size.height),
      color: Colors.transparent,
      child: Stack(
        alignment: Alignment.center,
        children: [
          // ── Subtle radial center glow ────────────────────────────────────
          Positioned.fill(
            child: Center(
              child: Container(
                width: 600,
                height: 600,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  gradient: RadialGradient(
                    colors: [
                      AppColors.accentCyan.withOpacity(0.12),
                      Colors.transparent,
                    ],
                  ),
                ),
              ),
            ),
          ),
          // ── Main content ─────────────────────────────────────────────────
          Center(
            child: SingleChildScrollView(
              padding: EdgeInsets.fromLTRB(
                  24, isMobile ? 80 : 96, 24, isMobile ? 48 : 64),
              child: ConstrainedBox(
                constraints: const BoxConstraints(maxWidth: 640),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    // ── Name ────────────────────────────────────────────────
                    AnimatedSection(
                      delay: const Duration(milliseconds: 350),
                      child: RichText(
                        textAlign: TextAlign.center,
                        text: TextSpan(
                          style: TextStyle(
                            fontFamily: 'Inter',
                            fontSize: isMobile ? 48 : 72,
                            fontWeight: FontWeight.w800,
                            color: isDark
                                ? AppColors.textPrimary
                                : AppColors.lTextPrimary,
                            height: 1.15,
                            letterSpacing: -1.0,
                          ),
                          children: [
                            const TextSpan(text: 'Jaspinder Kaur '),
                            TextSpan(
                              text: 'Bahara',
                              style: TextStyle(
                                foreground: Paint()
                                  ..shader = const LinearGradient(
                                    colors: [
                                      AppColors.accentCyan,
                                      AppColors.accent
                                    ],
                                    begin: Alignment.topLeft,
                                    end: Alignment.bottomRight,
                                  ).createShader(
                                    const Rect.fromLTWH(0.0, 0.0, 200.0, 70.0),
                                  ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),

                    const SizedBox(height: 16),

                    // ── Role ────────────────────────────────────────────────
                    AnimatedSection(
                      delay: const Duration(milliseconds: 450),
                      child: Column(
                        children: [
                          Text(
                            'Flutter Developer',
                            style: TextStyle(
                              fontSize: isMobile ? 22 : 28,
                              fontWeight: FontWeight.w500,
                              color: isDark
                                  ? AppColors.textSecondary
                                  : AppColors.lTextSecondary,
                              letterSpacing: 0.5,
                            ),
                          ),
                          const SizedBox(height: 16),
                          Container(
                            height: 1,
                            width: 60,
                            decoration: BoxDecoration(
                              gradient: LinearGradient(
                                colors: [
                                  Colors.transparent,
                                  isDark
                                      ? AppColors.textSecondary
                                      : AppColors.lTextSecondary,
                                  Colors.transparent,
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),

                    const SizedBox(height: 20),

                    // ── Bio snippet ─────────────────────────────────────────
                    AnimatedSection(
                      delay: const Duration(milliseconds: 550),
                      child: Text(
                        'I build beautiful, scalable mobile applications with 3+ years of experience in Flutter, UI/UX design, and cross-platform native development.',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: isMobile ? 16 : 18,
                          color: isDark
                              ? AppColors.textSecondary
                              : AppColors.lTextMuted,
                          height: 1.7,
                        ),
                      ),
                    ),

                    const SizedBox(height: 40),

                    // ── CTA buttons ─────────────────────────────────────────
                    AnimatedSection(
                      delay: const Duration(milliseconds: 650),
                      child: Wrap(
                        alignment: WrapAlignment.center,
                        spacing: 16,
                        runSpacing: 16,
                        children: [
                          _GlowButton(
                            label: 'View My Work',
                            onTap: widget.onViewWork,
                            isMobile: isMobile,
                          ),
                          _OutlineButton(
                            label: 'Contact Me',
                            onTap: widget.onContactMe,
                            isMobile: isMobile,
                            isDark: isDark,
                          ),
                        ],
                      ),
                    ),

                    const SizedBox(height: 56),

                    // ── Quick stats ─────────────────────────────────────────
                    // AnimatedSection(
                    //   delay: const Duration(milliseconds: 750),
                    //   child: Container(
                    //     padding: const EdgeInsets.symmetric(
                    //         vertical: 24, horizontal: 32),
                    //     decoration: BoxDecoration(
                    //       color: isDark ? AppColors.bgCard : AppColors.lBgCard,
                    //       borderRadius: BorderRadius.circular(20),
                    //       boxShadow: isDark
                    //           ? [
                    //               BoxShadow(
                    //                 color: Colors.black.withOpacity(0.3),
                    //                 blurRadius: 30,
                    //                 offset: const Offset(0, 10),
                    //               )
                    //             ]
                    //           : [],
                    //     ),
                    //     child: Row(
                    //       mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    //       children: [
                    //         _StatItem(
                    //             icon: AppIcons.workHistory,
                    //             value: '3+',
                    //             label: 'Years\nExp.',
                    //             isDark: isDark),
                    //         _Divider(isDark: isDark),
                    //         _StatItem(
                    //             icon: AppIcons.projectMap,
                    //             value: '10+',
                    //             label: 'Projects\nShipped',
                    //             isDark: isDark),
                    //         _Divider(isDark: isDark),
                    //         _StatItem(
                    //             icon: AppIcons.coffee,
                    //             value: '∞',
                    //             label: 'Cups of\nChai',
                    //             isDark: isDark),
                    //       ],
                    //     ),
                    //   ),
                    // ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// ─── Glow Button ───────────────────────────────────────────────────────────────
class _GlowButton extends StatefulWidget {
  const _GlowButton({required this.label, this.onTap, required this.isMobile});
  final String label;
  final VoidCallback? onTap;
  final bool isMobile;

  @override
  State<_GlowButton> createState() => _GlowButtonState();
}

class _GlowButtonState extends State<_GlowButton> {
  bool _hovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _hovered = true),
      onExit: (_) => setState(() => _hovered = false),
      child: GestureDetector(
        onTap: widget.onTap,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          padding: EdgeInsets.symmetric(
            horizontal: widget.isMobile ? 28 : 36,
            vertical: widget.isMobile ? 14 : 16,
          ),
          decoration: BoxDecoration(
            gradient: const LinearGradient(
              colors: [AppColors.accent, AppColors.accentCyan],
            ),
            borderRadius: BorderRadius.circular(50),
            boxShadow: [
              BoxShadow(
                color: AppColors.accent.withOpacity(_hovered ? 0.55 : 0.3),
                blurRadius: _hovered ? 28 : 16,
                offset: const Offset(0, 6),
              ),
            ],
          ),
          child: Text(
            widget.label,
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.w700,
              fontSize: widget.isMobile ? 14 : 16,
              letterSpacing: 0.3,
            ),
          ),
        ),
      ),
    );
  }
}

// ─── Outline Button ────────────────────────────────────────────────────────────
class _OutlineButton extends StatefulWidget {
  const _OutlineButton({
    required this.label,
    this.onTap,
    required this.isMobile,
    required this.isDark,
  });
  final String label;
  final VoidCallback? onTap;
  final bool isMobile;
  final bool isDark;

  @override
  State<_OutlineButton> createState() => _OutlineButtonState();
}

class _OutlineButtonState extends State<_OutlineButton> {
  bool _hovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _hovered = true),
      onExit: (_) => setState(() => _hovered = false),
      child: GestureDetector(
        onTap: widget.onTap,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          padding: EdgeInsets.symmetric(
            horizontal: widget.isMobile ? 28 : 36,
            vertical: widget.isMobile ? 14 : 16,
          ),
          decoration: BoxDecoration(
            color: _hovered
                ? AppColors.accent.withOpacity(0.1)
                : Colors.transparent,
            border: Border.all(
              color: _hovered
                  ? AppColors.accent
                  : (widget.isDark ? AppColors.border : AppColors.lBorder),
              width: 1.5,
            ),
            borderRadius: BorderRadius.circular(50),
          ),
          child: Text(
            widget.label,
            style: TextStyle(
              color: _hovered
                  ? AppColors.accent
                  : (widget.isDark
                      ? AppColors.textSecondary
                      : AppColors.lTextSecondary),
              fontWeight: FontWeight.w600,
              fontSize: widget.isMobile ? 14 : 16,
              letterSpacing: 0.3,
            ),
          ),
        ),
      ),
    );
  }
}

// ─── Stat item ─────────────────────────────────────────────────────────────────
class _StatItem extends StatelessWidget {
  const _StatItem(
      {required this.icon,
      required this.value,
      required this.label,
      required this.isDark});
  final IconData icon;
  final String value;
  final String label;
  final bool isDark;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        AppIconContainer(
          icon: icon,
          size: 44,
          iconSize: 22,
        ),
        const SizedBox(height: 12),
        ShaderMask(
          shaderCallback: (bounds) => const LinearGradient(
            colors: [AppColors.accent, AppColors.accentCyan],
          ).createShader(bounds),
          child: Text(
            value,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 26,
              fontWeight: FontWeight.w800,
            ),
          ),
        ),
        const SizedBox(height: 4),
        Text(
          label,
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 11,
            color: isDark ? AppColors.textMuted : AppColors.lTextMuted,
            height: 1.5,
            fontWeight: FontWeight.w500,
          ),
        ),
      ],
    );
  }
}

class _Divider extends StatelessWidget {
  const _Divider({required this.isDark});
  final bool isDark;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 1,
      height: 48,
      color: isDark ? AppColors.border : AppColors.lBorder,
    );
  }
}
