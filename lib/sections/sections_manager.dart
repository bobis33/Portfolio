import 'package:flutter/material.dart';

import '/sections/projects_section.dart';
import '/sections/main_section.dart';
import '/sections/cv_section.dart';
import '/sections/connect_section.dart';


class SectionsManager extends StatelessWidget {
  final List<GlobalKey> keys;

  const SectionsManager({required this.keys, super.key});

  @override
  Widget build(BuildContext context) {
    final List<Widget> sections = [
      MainSection(key: keys[0]),
      ProjectsSection(key: keys[1]),
      CvSection(key: keys[2]),
      ConnectSection(key: keys[3]),
    ];

    return Column(
      children: sections.map((section) {
        return SizedBox(
          height: MediaQuery.of(context).size.height,
          child: section,
        );
      }).toList(),
    );
  }
}
