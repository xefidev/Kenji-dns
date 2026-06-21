import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../screens/home_screen.dart';
import '../../screens/tiers_screen.dart';

final appRouter = GoRouter(
  initialLocation: '/',
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => const HomeScreen(),
    ),
    GoRoute(
      path: '/tiers',
      builder: (context, state) => const TiersScreen(),
    ),
  ],
);