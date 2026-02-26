import 'package:flutter/material.dart';
import '../providers/theme_provider.dart';

class AppIcons {
  // Hero Section
  static const IconData coffee = Icons.coffee_outlined;

  // About Section
  static const IconData bolt = Icons.bolt_outlined;
  static const IconData location = Icons.location_on_outlined;
  static const IconData workHistory = Icons.work_history_outlined;
  static const IconData language = Icons.language_outlined;
  static const IconData school = Icons.school_outlined;
  static const IconData work = Icons.work_outline;

  // Experience Section
  static const IconData business = Icons.business_outlined;
  static const IconData date = Icons.date_range_outlined;

  // Projects Section
  static const IconData projectMap = Icons.map_outlined;
  static const IconData projectIoT = Icons.memory;
  static const IconData projectShop = Icons.shopping_cart;
  static const IconData projectWallet = Icons.account_balance_wallet;
  static const IconData projectClock = Icons.access_time;
  static const IconData projectCode = Icons.code;
  static const IconData projectWeb = Icons.language;
  static const IconData storeApple =
      Icons.apple; // Note: No outlined version of apple
  static const IconData storePlay = Icons.play_arrow_outlined;

  // Skills Section
  static const IconData skillCode = Icons.code;
  static const IconData skillArchitecture = Icons.account_tree_outlined;
  static const IconData skillDatabase = Icons.storage_outlined;
  static const IconData skillOffline = Icons.wifi_off_outlined;
  static const IconData skillDesign = Icons.design_services_outlined;
  static const IconData skillDevOps = Icons.rocket_launch_outlined;

  // Testimonials Section
  static const IconData quote = Icons.format_quote_outlined;
  static const IconData star = Icons.star_outline;
  static const IconData arrowBack = Icons.arrow_back_ios_new_outlined;
  static const IconData arrowForward = Icons.arrow_forward_ios_outlined;

  // Contact Section
  static const IconData email = Icons.mail_outline;
  static const IconData phone = Icons.phone_outlined;
  static const IconData link = Icons.link; // Link usually doesn't have outline
}

class AppIconContainer extends StatefulWidget {
  final IconData icon;
  final double size;
  final double iconSize;
  final bool enabled;
  final bool forceHover;
  final Color? color;

  const AppIconContainer({
    super.key,
    required this.icon,
    this.size = 42,
    this.iconSize = 20,
    this.enabled = true,
    this.forceHover = false,
    this.color,
  });

  @override
  State<AppIconContainer> createState() => _AppIconContainerState();
}

class _AppIconContainerState extends State<AppIconContainer> {
  bool _hovered = false;

  @override
  Widget build(BuildContext context) {
    const bgColor = Color(0xFF0F1629);
    final borderColor = AppColors.border.withOpacity(0.5);
    const accent = AppColors.accentCyan;
    const defaultIconColor = Color(0xFF9CA3AF); // muted gray

    final isHovered = (widget.forceHover || _hovered) && widget.enabled;

    return MouseRegion(
      onEnter: (_) => setState(() => _hovered = true),
      onExit: (_) => setState(() => _hovered = false),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 250),
        width: widget.size,
        height: widget.size,
        decoration: BoxDecoration(
          color: widget.enabled ? bgColor : bgColor.withOpacity(0.5),
          shape: BoxShape.circle,
          border: Border.all(
            color: isHovered
                ? accent.withOpacity(0.4)
                : (widget.enabled ? borderColor : borderColor.withOpacity(0.2)),
            width: 1.5,
          ),
          boxShadow: isHovered
              ? [
                  BoxShadow(
                    color: accent.withOpacity(0.15),
                    blurRadius: 12,
                    spreadRadius: 1,
                  )
                ]
              : [],
        ),
        child: Center(
          child: Icon(
            widget.icon,
            size: widget.iconSize,
            color: isHovered
                ? accent
                : (widget.enabled
                    ? (widget.color ?? defaultIconColor)
                    : defaultIconColor.withOpacity(0.3)),
          ),
        ),
      ),
    );
  }
}
