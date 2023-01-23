import 'package:go_router/go_router.dart';
import 'package:nvtours/features/3.%20Tourist%20Guide/GuideView.dart';

import '../features/1. SplashScreen/SplashScreen.dart';
import '../features/2. Home/HomeView.dart';

class Routes{
  final GoRouter router = GoRouter(
    initialLocation: "/Splash",
    routes: [
      GoRoute(
        path: '/Splash',
        builder: (context, state) => const SplashScreen(),
      ),
      GoRoute(
        path: '/',
        builder: (context, state) => const HomeView(),
      ),
      GoRoute(
        path: '/Guide',
        builder: (context, state) => const GuideView(),
      ),
    ],
  );
}