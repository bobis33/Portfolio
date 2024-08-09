import 'package:flutter/material.dart';

import '/sections/projects_section.dart';
import '/sections/main_section.dart';


class SectionsManager extends StatelessWidget {
  const SectionsManager({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        SizedBox(
          height: MediaQuery.of(context).size.height * 9 / 10,
          child: const MainSection(),
        ),
        SizedBox(
          height: MediaQuery.of(context).size.height * 9 / 10,
          child: const ProjectsSection(),
        ),
      ],
    );
  }
}