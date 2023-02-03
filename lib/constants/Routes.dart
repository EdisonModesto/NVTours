import 'package:go_router/go_router.dart';
import 'package:nvtours/features/3.%20Tourist%20Guide/GuideView.dart';
import 'package:nvtours/features/4.%20More%20Info/MoreView.dart';
import 'package:nvtours/features/5.%20Map/MapView.dart';
import 'package:nvtours/model/MunicipalityModel.dart';

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
        builder: (context, state) => GuideView(spot: state.extra as Spot),
      ),
      GoRoute(
        path: '/Info',
        builder: (context, state) => MoreView(spot: state.extra as Spot),
      ),
      GoRoute(
        path: '/Map',
        builder: (context, state) => MapView(),
      ),
    ],
  );
}