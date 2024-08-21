import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:portfolio/widgets/text_button_icon.dart';
import 'package:carousel_slider/carousel_slider.dart';

import '/models/project.dart';
import '/utils/on_pressed_launch_url.dart';
import '/widgets/card.dart';


Widget projectContainer(BuildContext context, Project project, int index) {
  final Size contextSize = MediaQuery.of(context).size;

  return card(
    context,
    contextSize.width,
    contextSize.height * 6 / 10,
    Container(
      width: contextSize.width,
      margin: const EdgeInsets.symmetric(horizontal: 5.0),
      child: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(top: 50),
            child: Text(
              project.name,
              style: const TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 400),
            child: Padding(
              padding: const EdgeInsets.only(top: 20),
              child: Text(
                project.description,
                style: const TextStyle(fontSize: 16.0),
                textAlign: TextAlign.center,
              ),
            ),
          ),
          const Spacer(),
          Padding(
            padding: const EdgeInsets.only(bottom: 20),
            child: textButtonIcon(context, const FaIcon(FontAwesomeIcons.github), const Text('Source code'), () { onPressedLaunchUrl(project.projectUrl, context); }),
          ),
        ],
      ),
    ),
  );
}

class ProjectsSection extends StatelessWidget {
  ProjectsSection({super.key});

  final List<Project> projects = getProjects();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: MediaQuery.of(context).size.height / 4),
      child: Column(
        children: <Widget>[
          const Text('Projects Section'),
          CarouselSlider(
            options: CarouselOptions(
              height: MediaQuery.of(context).size.height * 6 / 10,
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
                  return projectContainer(context, project, projects.indexOf(project));
                },
              );
            }).toList(),
          ),
        ],
      ),
    );
  }
}
