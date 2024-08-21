import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:portfolio/models/social.dart';
import 'package:portfolio/widgets/text_button_icon.dart';
import 'dart:html' as html;

import '/models/profile.dart';
import '/utils/on_pressed_launch_url.dart';

Widget keyFactWidget(BuildContext context, IconData icon, String label, String value) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      Icon(icon, color: Colors.blueAccent),
      const SizedBox(width: 10),
      Text(
        '$label: ',
        style: const TextStyle(
          fontSize: 20,
          color: Colors.white,
        ),
      ),
      Text(
        value,
        style: const TextStyle(
          fontSize: 20,
          color: Colors.white,
        ),
      ),
    ],
  );
}

class AboutMeSection extends StatelessWidget {
  AboutMeSection({super.key});

  final Profile profile = getProfile();

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.symmetric(vertical: MediaQuery.of(context).size.height / 4),
        child: Column(
          children: [
            Row(
              children: [
                Expanded(
                  flex: 5,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        profile.introduction,
                        style: const TextStyle(
                          fontSize: 24,
                          color: Colors.white,
                        ),
                      ),
                      const SizedBox(height: 40),
                      Text(
                        profile.description,
                        style: const TextStyle(
                          fontSize: 20,
                          color: Colors.white,
                        ),
                      ),
                      const SizedBox(height: 40),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          textButtonIcon(
                            context,
                            const FaIcon(FontAwesomeIcons.file),
                            const Text('View My CV'),
                                () {
                              html.window.open(profile.cvUrl, '_blank');
                            },
                          ),
                          textButtonIcon(
                            context,
                            const FaIcon(FontAwesomeIcons.download),
                            const Text('Download My CV'),
                                () {
                              html.AnchorElement(href: profile.cvUrl)
                                ..setAttribute('download', 'CV_ELLIOT_MASINA.pdf')
                                ..click();
                            },
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                const SizedBox(width: 30),
                Expanded(
                  flex: 2,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      CircleAvatar(
                        backgroundImage: AssetImage(profile.imageUrl),
                        radius: 60,
                        minRadius: 40,
                        maxRadius: 60,
                      ),
                      const SizedBox(height: 50),
                      Wrap(
                        runSpacing: 20,
                        children: getSocialLinks().map((socialLink) {
                          return Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(right: 20),
                                child: textButtonIcon(
                                    context,
                                    FaIcon(socialLink.icon, color: socialLink.color),
                                    Text(socialLink.label),
                                        () {onPressedLaunchUrl(socialLink.url, context);}
                                ),
                              ),
                            ],
                          );
                        }).toList(),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
    );
  }
}
