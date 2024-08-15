import 'package:flutter/material.dart';


Widget textButtonIcon(BuildContext context, IconData icon, Text text, void Function() onPressed) {
  return TextButton.icon(
    onPressed: onPressed,
    icon: Icon(icon),
    label: text,
    style: ElevatedButton.styleFrom(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      backgroundColor: Colors.transparent,
      shadowColor: Colors.transparent,
    ),
  );
}
