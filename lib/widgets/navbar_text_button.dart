import 'package:flutter/material.dart';


Widget navbarTextButton(BuildContext context, String text, void Function() onPressed) {
  return TextButton(
    style: TextButton.styleFrom(
      foregroundColor: Theme.of(context).colorScheme.onSurface,
    ),
    onPressed: onPressed,
    child: Text(text),
  );
}