import 'package:flutter/material.dart';
import 'package:flutter_translate/flutter_translate.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'dart:html' as html;

import '/models/profile.dart';
import '/models/social.dart';
import '/utils/on_pressed_launch_url.dart';
import '/widgets/text_button_icon.dart';


Widget leftSide(BuildContext context, Profile profile) {

  final TextTheme textTheme = Theme.of(context).textTheme;

  return Expanded(
    flex: 5,
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          profile.introduction,
          style: textTheme.displayLarge,
        ),
        const SizedBox(height: 20),
        Text(
          profile.description,
          style: textTheme.bodyLarge,
        ),
        const SizedBox(height: 40),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            textButtonIcon(
              context,
              const FaIcon(FontAwesomeIcons.file, color: Colors.white),
              Text(translate('viewCV'),
                style: textTheme.labelLarge,
              ),
                  () {
                onPressedLaunchUrl('https://bobis33.github.io/${profile.cvUrl}', context);
              },
            ),
            const SizedBox(width: 10),
            textButtonIcon(
              context,
              const FaIcon(FontAwesomeIcons.download, color: Colors.white),
              Text(translate('dlCV'),
                style: textTheme.labelLarge,
              ),
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
  );
}

Widget rightSide(BuildContext context, Profile profile) {
  return Expanded(
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
                      Text(socialLink.label,
                        style: Theme.of(context).textTheme.labelLarge,
                      ),
                          () {onPressedLaunchUrl(socialLink.url, context);}
                  ),
                ),
              ],
            );
          }).toList(),
        ),
      ],
    ),
  );
}

class AboutMeSection extends StatelessWidget {
  AboutMeSection({super.key});

  final Profile profile = getProfile();

  @override
  Widget build(BuildContext context) {

    final TextTheme textTheme = Theme.of(context).textTheme;

    return Padding(
      padding: EdgeInsets.symmetric(vertical: MediaQuery.of(context).size.height / 4),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              leftSide(context, profile),
              const SizedBox(width: 30),
              rightSide(context, profile),
            ],
          ),
          const SizedBox(height: 40),
          Text(
            translate('languages&tools'),
            style: textTheme.titleLarge,
          ),
          const SizedBox(height: 10),
          Wrap(
            spacing: 10,
            runSpacing: 10,
            children: profile.skills.map((skill) {
              return Chip(
                label: Text(
                  skill,
                  style: const TextStyle(
                    color: Colors.white,
                  ),
                ),
                backgroundColor: Colors.blueAccent,
                side: const BorderSide(
                  style: BorderStyle.none,
                ),
              );
            }).toList(),
          ),
        ],
      ),
    );
  }
}
