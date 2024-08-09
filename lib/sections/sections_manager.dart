import 'package:flutter/material.dart';

import '/sections/projects_section.dart';
import '/sections/main_section.dart';


class SectionsManager extends StatelessWidget {
  final List<GlobalKey> keys;

  const SectionsManager({required this.keys, super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        SizedBox(
          height: MediaQuery.of(context).size.height * 9 / 10,
          child: MainSection(key: keys[0]),
        ),
        SizedBox(
          height: MediaQuery.of(context).size.height * 9 / 10,
          child: ProjectsSection(key: keys[1]),
        ),
      ],
    );
  }
}