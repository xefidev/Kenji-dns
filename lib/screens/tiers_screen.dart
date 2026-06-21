import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../core/theme/app_colors.dart';
import '../widgets/glass_card.dart';

class TiersScreen extends StatelessWidget {
  const TiersScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.bgBase,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        iconTheme: const IconThemeData(color: AppColors.textPrimary),
        title: Text(
          'TIERS',
          style: GoogleFonts.spaceGrotesk(
            color: AppColors.accent,
            fontWeight: FontWeight.w700,
            letterSpacing: 2,
            fontSize: 18,
          ),
        ),
      ),
      body: ListView(
        padding: const EdgeInsets.all(20),
        children: const [
          _TierCard(name: 'FREE', price: 'TBD', color: AppColors.textSecondary, lines: ['Basic DNS', 'Limited speed']),
          SizedBox(height: 16),
          _TierCard(name: 'PRO', price: 'TBD', color: AppColors.accent, lines: ['Fast DNS', 'No throttle', 'Priority support']),
          SizedBox(height: 16),
          _TierCard(name: 'VIP', price: 'TBD', color: AppColors.success, lines: ['All Pro features', 'Dedicated nodes', 'Lowest latency']),
        ],
      ),
    );
  }
}

class _TierCard extends StatelessWidget {
  const _TierCard({required this.name, required this.price, required this.color, required this.lines});

  final String name;
  final String price;
  final Color color;
  final List<String> lines;

  @override
  Widget build(BuildContext context) {
    return GlassCard(
      borderColor: color.withValues(alpha: 0.4),
      glow: name == 'PRO',
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                name,
                style: GoogleFonts.spaceGrotesk(color: color, fontSize: 22, fontWeight: FontWeight.w700, letterSpacing: 1.5),
              ),
              Text(
                price,
                style: const TextStyle(color: AppColors.textPrimary, fontSize: 18, fontWeight: FontWeight.w600),
              ),
            ],
          ),
          const SizedBox(height: 12),
          ...lines.map((l) => Padding(
                padding: const EdgeInsets.only(top: 6),
                child: Row(
                  children: [
                    Container(width: 4, height: 4, decoration: BoxDecoration(color: color, shape: BoxShape.circle)),
                    const SizedBox(width: 10),
                    Text(l, style: const TextStyle(color: AppColors.textSecondary, fontSize: 14)),
                  ],
                ),
              )),
        ],
      ),
    );
  }
}