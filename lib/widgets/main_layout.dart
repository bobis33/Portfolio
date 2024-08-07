import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:portfolio/router.dart';

class MainLayout extends StatelessWidget {
  final Widget child;

  const MainLayout({required this.child, super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: GestureDetector(
          onTap: () {
            context.goNamed(AppRoute.home.name);
          },
          child: const Text('My Portfolio'),
        ),        actions: <Widget>[
          TextButton(
            onPressed: () {
              context.goNamed(AppRoute.projects.name);
            },
            child: const Text(
              'Projects',
              style: TextStyle(color: Colors.white),
            ),
          ),
          TextButton(
            onPressed: () {
              context.goNamed('/cv');
            },
            child: const Text(
              'CV',
              style: TextStyle(color: Colors.white),
            ),
          ),
          TextButton(
            onPressed: () {
              context.goNamed('/about');
            },
            child: const Text(
              'About Me',
              style: TextStyle(color: Colors.white),
            ),
          ),
          TextButton(
            onPressed: () {
              context.goNamed('/connect');
            },
            child: const Text(
              'Connect',
              style: TextStyle(color: Colors.white),
            ),
          ),
        ],
      ),
      body: child,
    );
  }
}
