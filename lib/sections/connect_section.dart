import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';


class ConnectSection extends StatelessWidget {
  const ConnectSection({super.key});

  void _launchUrl(String url) async {
    final Uri uri = Uri.parse(url);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri, mode: LaunchMode.externalApplication);
    } else {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    final List<Map<String, dynamic>> socialLinks = [
      {
        'icon': FontAwesomeIcons.github,
        'color': const Color(0xFF24292E),
        'url': 'https://github.com/bobis33',
        'label': 'GitHub'
      },
      {
        'icon': FontAwesomeIcons.linkedin,
        'color': const Color(0xFF0E76A8),
        'url': 'https://www.linkedin.com/in/elliot-masina/',
        'label': 'LinkedIn'
      },
      {
        'icon': FontAwesomeIcons.envelope,
        'color': Colors.redAccent,
        'url': 'mailto:masina.elliot@hotmail.fr',
        'label': 'Email'
      },
      {
        'icon': FontAwesomeIcons.discord,
        'color': const Color(0xFF7289DA),
        'url': 'https://discordapp.com/users/689538114468839571',
        'label': 'Discord'
      },
    ];

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 50.0, horizontal: 20.0),
      child: Column(
        children: [
          const Text('Connect with Me',),
          const SizedBox(height: 20),
          Wrap(
            spacing: 240,
            runSpacing: 20,
            children: socialLinks.map((link) {
              return GestureDetector(
                onTap: () => _launchUrl(link['url']),
                child: MouseRegion(
                  cursor: SystemMouseCursors.click,
                  child: Column(
                    children: [
                      FaIcon(link['icon'], color: link['color']),
                      const SizedBox(width: 10),
                      Text(link['label']),
                    ],
                  ),
                ),
              );
            }).toList(),
          ),
        ],
      ),
    );
  }
}
