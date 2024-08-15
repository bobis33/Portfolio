import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '/utils/on_pressed_launch_url.dart';
import '/widgets/text_button_icon.dart';

class CvSection extends StatelessWidget {
  const CvSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Text(
            'My CV',
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 20),
          textButtonIcon(
            context,
            FontAwesomeIcons.file,
            const Text('View My CV'),
                () {
              onPressedLaunchUrl(
                'https://drive.google.com/file/d/1XOvKXOhw1RCmHDHXz86t7P172Ap2gyuI/view?usp=drive_link',
                context,
              );
            },
          ),
        ],
      ),
    );
  }
}
