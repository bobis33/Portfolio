import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:portfolio/models/social.dart';

import '/utils/on_pressed_launch_url.dart';


class ConnectSection extends StatelessWidget {
  const ConnectSection({super.key});

  @override
  Widget build(BuildContext context) {

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 50.0, horizontal: 20.0),
      child: Column(
        children: [
          const Text('Connect with Me',),
          const SizedBox(height: 20),
          Wrap(
            spacing: 240,
            runSpacing: 20,
            children: getSocialLinks().map((socialLink) {
              return GestureDetector(
                onTap: () => onPressedLaunchUrl(socialLink.url, context),
                child: MouseRegion(
                  cursor: SystemMouseCursors.click,
                  child: Column(
                    children: [
                      FaIcon(socialLink.icon, color: socialLink.color),
                      const SizedBox(width: 10),
                      Text(socialLink.label),
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
