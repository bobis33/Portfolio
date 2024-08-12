import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:carousel_slider/carousel_slider.dart';

import '/models/project.dart';
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
      decoration: BoxDecoration(
        image: DecorationImage(
          image: NetworkImage(project.imageUrl),
          fit: BoxFit.cover,
          colorFilter: ColorFilter.mode(
            Colors.transparent.withOpacity(0.2),
            BlendMode.dstATop,
          ),
        ),
      ),
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
            child: ElevatedButton.icon(
              onPressed: () async {
                final gitUrl = Uri.parse(project.projectUrl);
                if (await canLaunchUrl(gitUrl)) {
                  await launchUrl(gitUrl, mode: LaunchMode.externalApplication);
                } else if (context.mounted) {
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Could not launch ${project.projectUrl}')));
                }
              },
              icon: const FaIcon(FontAwesomeIcons.github),
              label: const Text('Source code'),
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                elevation: 10,
              ),
            ),
          )
        ],
      ),
    ),
  );
}

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
    );
  }
}
