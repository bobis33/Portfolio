import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';


void onPressedLaunchUrl(String url, BuildContext context) async {
  final uri = Uri.parse(url);
  if (await canLaunchUrl(uri)) {
    await launchUrl(uri, mode: LaunchMode.externalApplication);
  } else if (context.mounted) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Could not launch $url')));
  }
}
