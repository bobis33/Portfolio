import 'package:flutter/material.dart';

import 'package:carousel_slider/carousel_slider.dart';

import '/widgets/project_container.dart';
import '/models/project.dart';


class ProjectsSection extends StatelessWidget {
  const ProjectsSection({super.key});

  @override
  Widget build(BuildContext context) {
    List<Project> projects = getProjects();

    return Column(
      children: <Widget>[
        const Text('Projects Section'),
        CarouselSlider(
          options: CarouselOptions(
            height: MediaQuery.of(context).size.height * 6 / 10,
            aspectRatio: 16 / 9,
            viewportFraction: 0.8,
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
    );
  }
}
