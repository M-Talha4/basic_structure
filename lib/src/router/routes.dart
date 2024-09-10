import 'package:basic_structure/src/features/home/pages/home_pages.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'error_route.dart';
import 'route_transition.dart';

class MyAppRouter {
  static final router = GoRouter(
    initialLocation: '/${AppRoute.home}',
    routes: [
      GoRoute(
        name: AppRoute.home,
        path: '/${AppRoute.home}',
        pageBuilder: (context, state) => buildPageWithFadeTransition<void>(
          context: context,
          state: state,
          child: const HomePage(),
        ),
      ),
    ],
    errorPageBuilder: (context, state) {
      return const MaterialPage(child: ErrorPage());
    },
  );

  static void clearAndNavigate(BuildContext context, String name) {
    while (context.canPop()) {
      context.pop();
    }
    context.pushReplacementNamed(name);
  }
}

class AppRoute {
  static const String errorPage = 'error-page';
  static const String home = 'home';
}
