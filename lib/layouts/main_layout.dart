import 'package:flutter/material.dart';

class MainLayout extends StatelessWidget {
  final Widget child;

  const MainLayout({required this.child, super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: GestureDetector(
          onTap: () {
            //
          },
          child: const Text('My Portfolio'),
        ),
        actions: <Widget>[
          TextButton(
            onPressed: () {
              //
            },
            child: const Text(
              'Projects',
              style: TextStyle(color: Colors.white),
            ),
          ),
          TextButton(
            onPressed: () {
              //
            },
            child: const Text(
              'CV',
              style: TextStyle(color: Colors.white),
            ),
          ),
          TextButton(
            onPressed: () {
              //
            },
            child: const Text(
              'About Me',
              style: TextStyle(color: Colors.white),
            ),
          ),
          TextButton(
            onPressed: () {
              //
            },
            child: const Text(
              'Connect',
              style: TextStyle(color: Colors.white),
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(child: child),
    );
  }
}
