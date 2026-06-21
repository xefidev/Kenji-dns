import 'dart:ui';
import 'package:flutter/material.dart';

import '../core/theme/app_colors.dart';

class GlassCard extends StatelessWidget {
  const GlassCard({
    super.key,
    required this.child,
    this.padding = const EdgeInsets.all(20),
    this.radius = 20,
    this.glow = false,
    this.borderColor,
  });

  final Widget child;
  final EdgeInsetsGeometry padding;
  final double radius;
  final bool glow;
  final Color? borderColor;

  @override
  Widget build(BuildContext context) {
    final border = borderColor ?? AppColors.glassStroke;
    return DecoratedBox(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(radius),
        boxShadow: glow
            ? [
                BoxShadow(
                  color: AppColors.accent.withValues(alpha: 0.35),
                  blurRadius: 32,
                  spreadRadius: -4,
                ),
              ]
            : const [],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(radius),
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: AppColors.glassBlur, sigmaY: AppColors.glassBlur),
          child: Container(
            padding: padding,
            decoration: BoxDecoration(
              color: AppColors.glassTint,
              borderRadius: BorderRadius.circular(radius),
              border: Border.all(color: border, width: 1),
            ),
            child: child,
          ),
        ),
      ),
    );
  }
}