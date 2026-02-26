// ignore_for_file: deprecated_member_use
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

// ─── Brand Tokens ─────────────────────────────────────────────────────────────
/// Centralised design tokens — import this anywhere you need brand colours.
class AppColors {
  AppColors._();

  // Accent
  static const accent = Color(0xFF4F46E5); // indigo
  static const accentCyan = Color(0xFF06B6D4); // cyan
  static const accentGlow = Color(0xFF06B6D4); // cyan soft glow

  // Dark surface palette
  static const bgBase = Color(0xFF060A12); // deep space base
  static const bgSurface = Color(0xFF0B0F19); // slightly lighter surface
  static const bgCard = Color(0xFF111827); // card background
  static const bgCardHover = Color(0xFF1F2937); // card on hover
  static const border = Color(0xFF1F2937); // subtle border

  // Text
  static const textPrimary = Color(0xFFF9FAFB);
  static const textSecondary = Color(0xFF9CA3AF);
  static const textMuted = Color(0xFF6B7280);

  // Light mode equivalents
  static const lBgBase = Color(0xFFF5F6FA);
  static const lBgSurface = Color(0xFFFFFFFF);
  static const lBgCard = Color(0xFFFFFFFF);
  static const lBorder = Color(0xFFE3E5F0);
  static const lTextPrimary = Color(0xFF0F1022);
  static const lTextSecondary = Color(0xFF50536F);
  static const lTextMuted = Color(0xFF9295B0);
}
// ──────────────────────────────────────────────────────────────────────────────

class ThemeProvider extends ChangeNotifier {
  static const String _themeKey = 'theme_mode';
  late SharedPreferences _prefs;
  bool _isDarkMode = true; // default to dark

  bool get isDarkMode => _isDarkMode;

  ThemeProvider() {
    _loadThemeMode();
  }

  Future<void> _loadThemeMode() async {
    _prefs = await SharedPreferences.getInstance();
    _isDarkMode = _prefs.getBool(_themeKey) ?? true;
    notifyListeners();
  }

  Future<void> toggleTheme() async {
    _isDarkMode = !_isDarkMode;
    await _prefs.setBool(_themeKey, _isDarkMode);
    notifyListeners();
  }

  // ── Dark Theme ──────────────────────────────────────────────────────────────
  ThemeData get darkTheme {
    return ThemeData(
      useMaterial3: true,
      brightness: Brightness.dark,
      colorScheme: const ColorScheme.dark(
        primary: AppColors.accent,
        secondary: AppColors.accentCyan,
        tertiary: AppColors.accentGlow,
        surface: AppColors.bgSurface,
        background: AppColors.bgBase,
        onPrimary: Colors.white,
        onSecondary: Colors.white,
        onSurface: AppColors.textPrimary,
        onBackground: AppColors.textPrimary,
        outline: AppColors.border,
        error: Color(0xFFFF6B6B),
      ),
      scaffoldBackgroundColor: AppColors.bgBase,
      fontFamily: 'Inter',
      appBarTheme: const AppBarTheme(
        elevation: 0,
        scrolledUnderElevation: 0,
        backgroundColor: Colors.transparent,
        foregroundColor: AppColors.textPrimary,
        surfaceTintColor: Colors.transparent,
        titleTextStyle: TextStyle(
          color: AppColors.textPrimary,
          fontSize: 18,
          fontWeight: FontWeight.w600,
          letterSpacing: 0.2,
        ),
        iconTheme: IconThemeData(color: AppColors.textSecondary),
      ),
      // ignore: prefer_const_constructors
      cardTheme: CardThemeData(
        elevation: 0,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(16)),
          side: BorderSide(color: AppColors.border, width: 1),
        ),
        color: AppColors.bgCard,
        surfaceTintColor: Colors.transparent,
        clipBehavior: Clip.antiAlias,
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.accent,
          foregroundColor: Colors.white,
          elevation: 0,
          shadowColor: Colors.transparent,
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(10)),
          ),
          padding: const EdgeInsets.symmetric(horizontal: 28, vertical: 14),
          textStyle: const TextStyle(
            fontWeight: FontWeight.w600,
            fontSize: 15,
            letterSpacing: 0.3,
          ),
        ),
      ),
      outlinedButtonTheme: OutlinedButtonThemeData(
        style: OutlinedButton.styleFrom(
          foregroundColor: AppColors.accent,
          side: const BorderSide(color: AppColors.accent, width: 1.5),
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(10)),
          ),
          padding: const EdgeInsets.symmetric(horizontal: 28, vertical: 14),
          textStyle: const TextStyle(
            fontWeight: FontWeight.w600,
            fontSize: 15,
            letterSpacing: 0.3,
          ),
        ),
      ),
      textTheme: const TextTheme(
        displayLarge: TextStyle(
          color: AppColors.textPrimary,
          fontWeight: FontWeight.w800,
          letterSpacing: -1,
        ),
        displayMedium: TextStyle(
          color: AppColors.textPrimary,
          fontWeight: FontWeight.w800,
          letterSpacing: -0.5,
        ),
        headlineLarge: TextStyle(
          color: AppColors.textPrimary,
          fontWeight: FontWeight.w700,
          letterSpacing: -0.3,
        ),
        headlineMedium: TextStyle(
          color: AppColors.textPrimary,
          fontWeight: FontWeight.w700,
        ),
        titleLarge: TextStyle(
          color: AppColors.textPrimary,
          fontWeight: FontWeight.w600,
        ),
        titleMedium: TextStyle(
          color: AppColors.textPrimary,
          fontWeight: FontWeight.w500,
        ),
        bodyLarge: TextStyle(
          color: AppColors.textSecondary,
          height: 1.7,
        ),
        bodyMedium: TextStyle(
          color: AppColors.textMuted,
          height: 1.6,
        ),
        labelLarge: TextStyle(
          color: AppColors.accent,
          fontWeight: FontWeight.w600,
          letterSpacing: 0.5,
        ),
      ),
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: AppColors.bgSurface,
        labelStyle: const TextStyle(color: AppColors.textSecondary),
        hintStyle: const TextStyle(color: AppColors.textMuted),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(color: AppColors.border),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(color: AppColors.border),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(color: AppColors.accent, width: 2),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(color: Color(0xFFFF6B6B)),
        ),
        prefixIconColor: AppColors.textSecondary,
      ),
      dividerTheme: const DividerThemeData(
        color: AppColors.border,
        thickness: 1,
      ),
      extensions: const [
        AppContainerTheme(
          backgroundColor: AppColors.bgCard,
          borderColor: AppColors.border,
          accentColor: AppColors.accent,
          textPrimary: AppColors.textPrimary,
          textSecondary: AppColors.textSecondary,
        ),
      ],
    );
  }

  // ── Light Theme ─────────────────────────────────────────────────────────────
  ThemeData get lightTheme {
    return ThemeData(
      useMaterial3: true,
      brightness: Brightness.light,
      colorScheme: const ColorScheme.light(
        primary: AppColors.accent,
        secondary: AppColors.accentCyan,
        tertiary: AppColors.accentGlow,
        surface: AppColors.lBgSurface,
        background: AppColors.lBgBase,
        onPrimary: Colors.white,
        onSecondary: Colors.white,
        onSurface: AppColors.lTextPrimary,
        onBackground: AppColors.lTextPrimary,
        outline: AppColors.lBorder,
        error: Color(0xFFEF4444),
      ),
      scaffoldBackgroundColor: AppColors.lBgBase,
      fontFamily: 'Inter',
      appBarTheme: const AppBarTheme(
        elevation: 0,
        scrolledUnderElevation: 0,
        backgroundColor: Colors.transparent,
        foregroundColor: AppColors.lTextPrimary,
        surfaceTintColor: Colors.transparent,
        titleTextStyle: TextStyle(
          color: AppColors.lTextPrimary,
          fontSize: 18,
          fontWeight: FontWeight.w600,
          letterSpacing: 0.2,
        ),
        iconTheme: IconThemeData(color: AppColors.lTextSecondary),
      ),
      cardTheme: const CardThemeData(
        elevation: 0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(16)),
          side: BorderSide(color: AppColors.lBorder, width: 1),
        ),
        color: AppColors.lBgCard,
        surfaceTintColor: Colors.transparent,
        clipBehavior: Clip.antiAlias,
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.accent,
          foregroundColor: Colors.white,
          elevation: 0,
          shadowColor: Colors.transparent,
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(10)),
          ),
          padding: const EdgeInsets.symmetric(horizontal: 28, vertical: 14),
          textStyle: const TextStyle(
            fontWeight: FontWeight.w600,
            fontSize: 15,
            letterSpacing: 0.3,
          ),
        ),
      ),
      outlinedButtonTheme: OutlinedButtonThemeData(
        style: OutlinedButton.styleFrom(
          foregroundColor: AppColors.accent,
          side: const BorderSide(color: AppColors.accent, width: 1.5),
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(10)),
          ),
          padding: const EdgeInsets.symmetric(horizontal: 28, vertical: 14),
          textStyle: const TextStyle(
            fontWeight: FontWeight.w600,
            fontSize: 15,
            letterSpacing: 0.3,
          ),
        ),
      ),
      textTheme: const TextTheme(
        displayLarge: TextStyle(
          color: AppColors.lTextPrimary,
          fontWeight: FontWeight.w800,
          letterSpacing: -1,
        ),
        displayMedium: TextStyle(
          color: AppColors.lTextPrimary,
          fontWeight: FontWeight.w800,
          letterSpacing: -0.5,
        ),
        headlineLarge: TextStyle(
          color: AppColors.lTextPrimary,
          fontWeight: FontWeight.w700,
          letterSpacing: -0.3,
        ),
        headlineMedium: TextStyle(
          color: AppColors.lTextPrimary,
          fontWeight: FontWeight.w700,
        ),
        titleLarge: TextStyle(
          color: AppColors.lTextPrimary,
          fontWeight: FontWeight.w600,
        ),
        bodyLarge: TextStyle(
          color: AppColors.lTextSecondary,
          height: 1.7,
        ),
        bodyMedium: TextStyle(
          color: AppColors.lTextMuted,
          height: 1.6,
        ),
        labelLarge: TextStyle(
          color: AppColors.accent,
          fontWeight: FontWeight.w600,
          letterSpacing: 0.5,
        ),
      ),
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: AppColors.lBgSurface,
        labelStyle: const TextStyle(color: AppColors.lTextSecondary),
        hintStyle: const TextStyle(color: AppColors.lTextMuted),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(color: AppColors.lBorder),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(color: AppColors.lBorder),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(color: AppColors.accent, width: 2),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(color: Color(0xFFEF4444)),
        ),
        prefixIconColor: AppColors.lTextMuted,
      ),
      dividerTheme: const DividerThemeData(
        color: AppColors.lBorder,
        thickness: 1,
      ),
      extensions: const [
        AppContainerTheme(
          backgroundColor: AppColors.lBgCard,
          borderColor: AppColors.lBorder,
          accentColor: AppColors.accent,
          textPrimary: AppColors.lTextPrimary,
          textSecondary: AppColors.lTextSecondary,
        ),
      ],
    );
  }
}

// ─── Theme Extension ───────────────────────────────────────────────────────────
@immutable
class AppContainerTheme extends ThemeExtension<AppContainerTheme> {
  final Color backgroundColor;
  final Color borderColor;
  final Color accentColor;
  final Color textPrimary;
  final Color textSecondary;

  const AppContainerTheme({
    required this.backgroundColor,
    required this.borderColor,
    required this.accentColor,
    required this.textPrimary,
    required this.textSecondary,
  });

  @override
  AppContainerTheme copyWith({
    Color? backgroundColor,
    Color? borderColor,
    Color? accentColor,
    Color? textPrimary,
    Color? textSecondary,
  }) {
    return AppContainerTheme(
      backgroundColor: backgroundColor ?? this.backgroundColor,
      borderColor: borderColor ?? this.borderColor,
      accentColor: accentColor ?? this.accentColor,
      textPrimary: textPrimary ?? this.textPrimary,
      textSecondary: textSecondary ?? this.textSecondary,
    );
  }

  @override
  AppContainerTheme lerp(ThemeExtension<AppContainerTheme>? other, double t) {
    if (other is! AppContainerTheme) return this;
    return AppContainerTheme(
      backgroundColor: Color.lerp(backgroundColor, other.backgroundColor, t)!,
      borderColor: Color.lerp(borderColor, other.borderColor, t)!,
      accentColor: Color.lerp(accentColor, other.accentColor, t)!,
      textPrimary: Color.lerp(textPrimary, other.textPrimary, t)!,
      textSecondary: Color.lerp(textSecondary, other.textSecondary, t)!,
    );
  }
}
