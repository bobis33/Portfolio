import 'package:flutter/material.dart';

import '/sections/about_me_section.dart';
import '/sections/projects_section.dart';
import '/sections/welcome_section.dart';


class SectionsManager extends StatelessWidget {
  final List<GlobalKey> keys;

  const SectionsManager({required this.keys, super.key});

  @override
  Widget build(BuildContext context) {
    final List<Widget> sections = [
      WelcomeSection(key: keys[0], secondKey: keys[1]),
      AboutMeSection(key: keys[1]),
      ProjectsSection(key: keys[2]),
    ];

    return Column(
      children: sections.map((section) {
        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 50.0, horizontal: 20.0),
          child: section,
        );
      }).toList(),
    );
  }
}
