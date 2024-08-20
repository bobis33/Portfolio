import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';


class SocialLink {
  final String label;
  final String url;
  final Color color;
  final IconData icon;

  SocialLink({
    required this.label,
    required this.url,
    required this.color,
    required this.icon
  });
}

List<SocialLink> getSocialLinks() {
  return <SocialLink>[
    SocialLink(
        label: 'GitHub',
        url: 'https://github.com/bobis33',
        color: const Color(0xFF24292E),
        icon: FontAwesomeIcons.github
    ),
    SocialLink(
        label: 'LinkedIn',
        url: 'https://www.linkedin.com/in/elliot-masina/',
        color: const Color(0xFF0E76A8),
        icon: FontAwesomeIcons.linkedin
    ),
    SocialLink(
        label: 'Email',
        url: 'mailto:masina.elliot@hotmail.fr',
        color: Colors.redAccent,
        icon: FontAwesomeIcons.envelope
    ),
    SocialLink(
        label: 'Discord',
        url: 'https://discordapp.com/users/689538114468839571',
        color: const Color(0xFF7289DA),
        icon: FontAwesomeIcons.discord
    ),
  ];
}
