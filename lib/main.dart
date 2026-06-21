import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';

import 'core/router/app_router.dart';
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
    return MaterialApp.router(
      title: 'Kenji DNS',
      debugShowCheckedModeBanner: false,
      routerConfig: appRouter,
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
    );
  }
}