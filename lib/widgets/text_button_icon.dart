import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';


Widget textButtonIcon(BuildContext context, FaIcon icon, Text text, void Function() onPressed) {
  return TextButton.icon(
    onPressed: onPressed,
    icon: icon,
    label: text,
    style: ElevatedButton.styleFrom(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      backgroundColor: Colors.transparent,
      shadowColor: Colors.transparent,
    ),
  );
}
