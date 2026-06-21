import 'package:flutter/material.dart';

class AppColors {
  AppColors._();

  // Base
  static const Color bgBase = Color(0xFF0A0B0F);
  static const Color bgSurface = Color(0xFF12141A);
  static const Color bgElevated = Color(0xFF1A1D26);

  // Glass
  static const Color glassTint = Color(0x0AFFFFFF);
  static const Color glassStroke = Color(0x14FFFFFF);
  static const double glassBlur = 24.0;

  // Accent
  static const Color accent = Color(0xFF00E5FF);
  static const Color accentDim = Color(0xFF008B9E);

  // Text
  static const Color textPrimary = Color(0xFFF5F7FA);
  static const Color textSecondary = Color(0xFF8A91A0);
  static const Color textMuted = Color(0xFF4A5060);

  // States
  static const Color success = Color(0xFF00FF94);
  static const Color warning = Color(0xFFFFB800);
  static const Color danger = Color(0xFFFF2D55);
  static const Color lock = Color(0xFF4A5060);

  // Glow effect
  static Color accentGlow = accent.withValues(alpha: 0.35);
}