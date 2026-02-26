// ignore_for_file: deprecated_member_use

import 'dart:ui';
import 'package:flutter/material.dart';
import '../providers/theme_provider.dart';
import '../widgets/space_background.dart';
import 'about_section.dart';
import 'experience_section.dart';
import 'skills_section.dart';
import 'contact_section.dart';
import 'projects_section.dart';
import 'welcome_section.dart';
import '../widgets/logo_mark.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final ScrollController _scrollController = ScrollController();
  final List<GlobalKey> _sectionKeys = List.generate(6, (_) => GlobalKey());
  int _currentIndex = 0;
  bool _isAutoScrolling = false;

  late final List<Widget> _sections;

  final List<String> _sectionTitles = const [
    'Home',
    'About',
    'Experience',
    'Projects',
    'Skills',
    'Contact',
  ];

  @override
  void initState() {
    super.initState();
    _sections = [
      WelcomeSection(
        onViewWork: () => _scrollToSection(3), // 3 is Projects
        onContactMe: () => _scrollToSection(5), // 5 is Contact
      ),
      const AboutSection(),
      const ExperienceSection(),
      const ProjectsSection(),
      const SkillsSection(),
      const ContactSection(),
    ];
    _scrollController.addListener(_onScroll);
  }

  @override
  void dispose() {
    _scrollController.removeListener(_onScroll);
    _scrollController.dispose();
    super.dispose();
  }

  void _onScroll() {
    if (_isAutoScrolling) return;

    // Check if we are at the bottom of the page
    if (_scrollController.position.pixels >=
        _scrollController.position.maxScrollExtent - 100) {
      if (_currentIndex != _sectionKeys.length - 1) {
        setState(() => _currentIndex = _sectionKeys.length - 1);
      }
      return;
    }

    for (int i = _sectionKeys.length - 1; i >= 0; i--) {
      final keyContext = _sectionKeys[i].currentContext;
      if (keyContext != null) {
        final box = keyContext.findRenderObject() as RenderBox?;
        if (box != null) {
          final position = box.localToGlobal(Offset.zero).dy;
          if (position <= 200) {
            if (_currentIndex != i) {
              setState(() => _currentIndex = i);
            }
            break;
          }
        }
      }
    }
  }

  void _scrollToSection(int index) {
    if (_currentIndex == index) return;

    setState(() {
      _currentIndex = index;
      _isAutoScrolling = true;
    });

    final keyContext = _sectionKeys[index].currentContext;
    if (keyContext != null) {
      Scrollable.ensureVisible(
        keyContext,
        duration: const Duration(milliseconds: 800),
        curve: Curves.easeInOutCubic,
      ).then((_) {
        // Delay a bit to ensure potential inertia/overshoot doesn't trigger a reset
        Future.delayed(const Duration(milliseconds: 100), () {
          if (mounted) {
            setState(() => _isAutoScrolling = false);
          }
        });
      });
    } else {
      setState(() => _isAutoScrolling = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    final isMobile = MediaQuery.of(context).size.width < 768;

    // Navbar glass background
    final navBg = AppColors.bgSurface.withOpacity(0.85);
    const borderColor = AppColors.border;

    return Scaffold(
      backgroundColor: Colors.transparent,
      extendBodyBehindAppBar: true,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(64),
        child: _NavBar(
          navBg: navBg,
          borderColor: borderColor,
          isDark: true, // Force dark
          isMobile: isMobile,
          currentIndex: _currentIndex,
          sectionTitles: _sectionTitles,
          onNav: _scrollToSection,
        ),
      ),
      drawer: isMobile ? _buildDrawer(true) : null,
      body: SpaceBackground(
        child: SingleChildScrollView(
          controller: _scrollController,
          child: Column(
            children: List.generate(
              _sections.length,
              (index) => Container(
                key: _sectionKeys[index],
                child: _sections[index],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildDrawer(bool isDark) {
    final bg = isDark ? AppColors.bgSurface : Colors.white;
    final textPrimary = isDark ? AppColors.textPrimary : AppColors.lTextPrimary;
    const accent = AppColors.accent;

    return Drawer(
      backgroundColor: bg,
      child: Column(
        children: [
          // Drawer header
          Container(
            width: double.infinity,
            padding: const EdgeInsets.fromLTRB(24, 56, 24, 28),
            decoration: BoxDecoration(
              color: isDark ? AppColors.bgCard : AppColors.lBgBase,
              border: Border(
                bottom: BorderSide(
                  color: isDark ? AppColors.border : AppColors.lBorder,
                ),
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const LogoMark(fontSize: 24),
                const SizedBox(height: 14),
                Text(
                  'Jaspinder Kaur',
                  style: TextStyle(
                    color: textPrimary,
                    fontSize: 18,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                const SizedBox(height: 4),
                const Text(
                  'Flutter Developer',
                  style: TextStyle(
                    color: accent,
                    fontSize: 13,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          ),
          // Nav Items
          Expanded(
            child: ListView.separated(
              padding: const EdgeInsets.symmetric(vertical: 12),
              itemCount: _sectionTitles.length,
              separatorBuilder: (_, __) => const SizedBox(height: 2),
              itemBuilder: (context, i) {
                final selected = _currentIndex == i;
                return AnimatedContainer(
                  duration: const Duration(milliseconds: 200),
                  margin: const EdgeInsets.symmetric(horizontal: 12),
                  decoration: BoxDecoration(
                    color: selected
                        ? accent.withOpacity(0.12)
                        : Colors.transparent,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: ListTile(
                    dense: true,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    title: Text(
                      _sectionTitles[i],
                      style: TextStyle(
                        color: selected ? accent : textPrimary,
                        fontWeight:
                            selected ? FontWeight.w700 : FontWeight.w500,
                        fontSize: 15,
                      ),
                    ),
                    trailing: selected
                        ? Container(
                            width: 6,
                            height: 6,
                            decoration: const BoxDecoration(
                              color: AppColors.accent,
                              shape: BoxShape.circle,
                            ),
                          )
                        : null,
                    onTap: () {
                      _scrollToSection(i);
                      Navigator.pop(context);
                    },
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

// ─── Custom Glass Navbar ───────────────────────────────────────────────────────
class _NavBar extends StatelessWidget {
  const _NavBar({
    required this.navBg,
    required this.borderColor,
    required this.isDark,
    required this.isMobile,
    required this.currentIndex,
    required this.sectionTitles,
    required this.onNav,
  });

  final Color navBg;
  final Color borderColor;
  final bool isDark;
  final bool isMobile;
  final int currentIndex;
  final List<String> sectionTitles;
  final void Function(int) onNav;

  @override
  Widget build(BuildContext context) {
    return ClipRect(
        child: BackdropFilter(
      filter: ImageFilter.blur(sigmaX: 12, sigmaY: 12),
      child: Container(
        decoration: BoxDecoration(
          color: navBg.withOpacity(isDark ? 0.6 : 0.8),
          border: Border(
            bottom: BorderSide(color: borderColor.withOpacity(0.5), width: 1),
          ),
        ),
        child: SafeArea(
          bottom: false,
          child: SizedBox(
            height: 64,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                children: [
                  // Logo mark
                  _LogoMark(),
                  const Spacer(),
                  // Desktop nav links
                  if (!isMobile)
                    ...List.generate(sectionTitles.length, (i) {
                      final active = currentIndex == i;
                      return _NavLink(
                        label: sectionTitles[i],
                        active: active,
                        isDark: isDark,
                        onTap: () => onNav(i),
                      );
                    }),
                  const SizedBox(width: 8),
                  // Theme toggle - Removed as theme is hardcoded to dark
                  // _ThemeButton(
                  //   isDark: isDark,
                  //   onToggle: onThemeToggle,
                  // ),
                  // Hamburger
                  if (isMobile)
                    Builder(
                      builder: (ctx) => IconButton(
                        icon: Icon(
                          Icons.menu_rounded,
                          color: isDark
                              ? AppColors.textSecondary
                              : AppColors.lTextSecondary,
                        ),
                        onPressed: () => Scaffold.of(ctx).openDrawer(),
                      ),
                    ),
                ],
              ),
            ),
          ),
        ),
      ),
    ));
  }
}

class _LogoMark extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        child: LogoMark(fontSize: 18),
      ),
    );
  }
}

class _NavLink extends StatefulWidget {
  const _NavLink({
    required this.label,
    required this.active,
    required this.isDark,
    required this.onTap,
  });

  final String label;
  final bool active;
  final bool isDark;
  final VoidCallback onTap;

  @override
  State<_NavLink> createState() => _NavLinkState();
}

class _NavLinkState extends State<_NavLink> {
  bool _hovered = false;

  @override
  Widget build(BuildContext context) {
    final textColor = widget.active
        ? (widget.isDark ? Colors.white : AppColors.lTextPrimary)
        : (widget.isDark ? AppColors.textMuted : AppColors.lTextSecondary);

    final hoverColor =
        widget.isDark ? AppColors.textPrimary : AppColors.lTextPrimary;

    return MouseRegion(
      onEnter: (_) => setState(() => _hovered = true),
      onExit: (_) => setState(() => _hovered = false),
      child: GestureDetector(
        onTap: widget.onTap,
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 14),
          alignment: Alignment.center,
          child: Stack(
            alignment: Alignment.center,
            clipBehavior: Clip.none,
            children: [
              AnimatedDefaultTextStyle(
                duration: const Duration(milliseconds: 200),
                style: TextStyle(
                  fontFamily: 'Inter',
                  color: _hovered && !widget.active ? hoverColor : textColor,
                  fontWeight: widget.active ? FontWeight.w600 : FontWeight.w500,
                  fontSize: 14,
                ),
                child: Text(widget.label),
              ),
              Positioned(
                bottom: -8,
                child: AnimatedContainer(
                  duration: const Duration(milliseconds: 300),
                  curve: Curves.easeOutCubic,
                  width: widget.active ? widget.label.length * 8.0 : 0,
                  height: 2,
                  decoration: BoxDecoration(
                    color: AppColors.accentCyan,
                    borderRadius: BorderRadius.circular(2),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
