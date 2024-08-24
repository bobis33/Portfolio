import 'package:flutter/material.dart';
import 'package:flutter_translate/flutter_translate.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:portfolio/widgets/text_button_icon.dart';
import 'package:carousel_slider/carousel_slider.dart';

import '/models/project.dart';
import '/utils/on_pressed_launch_url.dart';
import '/widgets/card.dart';


Widget projectContainer(BuildContext context, Project project, Size contextSize) {
  return card(
    contextSize.width / 2.4,
    contextSize.height / 1.8,
    Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child:     Column(
        children: <Widget>[
          const SizedBox(height: 20),
          Text(
            project.name,
            style: Theme.of(context).textTheme.titleLarge,
          ),
          SizedBox(height: contextSize.height / 20),
          Expanded(
              child: SingleChildScrollView(
                child: ConstrainedBox(
                  constraints: const BoxConstraints(maxWidth: 400),
                  child: Text(
                    project.description,
                    style: Theme.of(context).textTheme.bodyLarge,
                    textAlign: TextAlign.center,
                  ),
                ),
              )
          ),
          const SizedBox(height: 20),
          textButtonIcon(
              context,
              const FaIcon(FontAwesomeIcons.github, color: Color(0xFF24292E)),
              Text(translate('sourceCode'), style: Theme.of(context).textTheme.labelLarge),
                  () { onPressedLaunchUrl(project.projectUrl, context); }
          ),
          const SizedBox(height: 5),
        ],
      ),
    )
  );
}

class ProjectsSection extends StatelessWidget {
  ProjectsSection({super.key});

  final List<Project> projects = getProjects();

  @override
  Widget build(BuildContext context) {
    final Size contextSize = MediaQuery.of(context).size;

    return Padding(
      padding: EdgeInsets.only(bottom: contextSize.height / 4),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Text(translate('myProjects'), style: Theme.of(context).textTheme.headlineLarge),
          const SizedBox(height: 10),
          Text(translate('myProjects.subtitle'), style: Theme.of(context).textTheme.bodyLarge),
          const SizedBox(height: 30),
          CarouselSlider(
            options: CarouselOptions(
              height: contextSize.height * 6 / 10,
              aspectRatio: 16 / 9,
              viewportFraction: 0.6,
              initialPage: 0,
              enableInfiniteScroll: true,
              reverse: false,
              autoPlay: true,
              autoPlayInterval: const Duration(seconds: 6),
              autoPlayAnimationDuration: const Duration(milliseconds: 1200),
              autoPlayCurve: Curves.fastOutSlowIn,
              enlargeCenterPage: true,
              scrollDirection: Axis.horizontal,
            ),
            items: projects.map((project) {
              return Builder(
                builder: (BuildContext context) {
                  return projectContainer(context, project, contextSize);
                },
              );
            }).toList(),
          ),
        ],
      ),
    );
  }
}
