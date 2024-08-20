import 'package:flutter/material.dart';

import '/sections/projects_section.dart';
import '/sections/about_me_section.dart';
import '/sections/connect_section.dart';


class SectionsManager extends StatelessWidget {
  final List<GlobalKey> keys;

  const SectionsManager({required this.keys, super.key});

  @override
  Widget build(BuildContext context) {
    final List<Widget> sections = [
      AboutMeSection(key: keys[0]),
      ProjectsSection(key: keys[1]),
      ConnectSection(key: keys[3]),
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
