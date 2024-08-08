import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'widgets/main_layout.dart';
import '/pages/home_page.dart';
import '/pages/projects_page.dart';


enum AppRoute {
  projects(name: 'projects'),
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
          child: MainLayout(child: HomePage()),
        );
      },
    ),
    GoRoute(
      name: AppRoute.projects.name,
      path: '/projects',
      builder: (BuildContext context, GoRouterState state) {
        return const SafeArea(
          child: MainLayout(child: ProjectsPage()),
        );
      },
    ),
  ],
);
