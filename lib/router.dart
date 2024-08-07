import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '/pages/home_page.dart';


enum AppRoute {
  home(name: 'home');

  const AppRoute({required this.name});

  final String name;
}

final GoRouter router = GoRouter(
  routes: <RouteBase>[
    GoRoute(
      name: AppRoute.home.name,
      path: '/',
      builder: (BuildContext context, GoRouterState state) {
        return const SafeArea(
          child: HomePage(),
        );
      },
      routes: const <RouteBase>[],
    ),
  ],
);
