import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';

import 'core/theme/app_colors.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness.light,
      systemNavigationBarColor: AppColors.bgBase,
      systemNavigationBarIconBrightness: Brightness.light,
    ),
  );
  runApp(const ProviderScope(child: KenjiApp()));
}

class KenjiApp extends StatelessWidget {
  const KenjiApp({super.key});

  @override
  Widget build(BuildContext context) {
    final base = ThemeData.dark(useMaterial3: true);
    return MaterialApp(
      title: 'Kenji DNS',
      debugShowCheckedModeBanner: false,
      theme: base.copyWith(
        scaffoldBackgroundColor: AppColors.bgBase,
        colorScheme: base.colorScheme.copyWith(
          primary: AppColors.accent,
          secondary: AppColors.accent,
          surface: AppColors.bgSurface,
        ),
        textTheme: GoogleFonts.spaceGroteskTextTheme(base.textTheme).apply(
          bodyColor: AppColors.textPrimary,
          displayColor: AppColors.textPrimary,
        ),
      ),
      home: const _BootScreen(),
    );
  }
}

class _BootScreen extends StatelessWidget {
  const _BootScreen();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.bgBase,
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              'KENJI DNS',
              style: GoogleFonts.spaceGrotesk(
                fontSize: 42,
                fontWeight: FontWeight.w700,
                letterSpacing: -1.6,
                color: AppColors.accent,
              ),
            ),
            const SizedBox(height: 12),
            const Text(
              'Initializing',
              style: TextStyle(color: AppColors.textSecondary, fontSize: 14),
            ),
          ],
        ),
      ),
    );
  }
}