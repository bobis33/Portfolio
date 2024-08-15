import 'package:flutter/material.dart';

import '/sections/sections_manager.dart';
import '/utils/scroll.dart';


Widget navbarTextButton(BuildContext context, String text, void Function() onPressed) {
  return TextButton(
    style: TextButton.styleFrom(
      foregroundColor: Theme.of(context).colorScheme.onSurface,
    ),
    onPressed: onPressed,
    child: Text(text),
  );
}

AppBar header(BuildContext context, ScrollController scrollController, List<GlobalKey> keys) {
  return AppBar(
    backgroundColor: Theme.of(context).colorScheme.onPrimaryContainer.withOpacity(0.5),
    title: GestureDetector(
      onTap: () {
        scrollController.animateTo(
          0.0,
          duration: const Duration(milliseconds: 500),
          curve: Curves.ease,
        );
      },
      child: const Text('My Portfolio'),
    ),
    actions: <Widget>[
      navbarTextButton(context, 'About Me', () { scrollToSection(scrollController, keys[0]); }),
      navbarTextButton(context, 'Projects', () { scrollToSection(scrollController, keys[1]); }),
      navbarTextButton(context, 'CV', () { scrollToSection(scrollController, keys[2]); }),
      navbarTextButton(context, 'Connect', () { scrollToSection(scrollController, keys[3]); }),
    ],
  );
}

Widget footer(BuildContext context) {
  return Container(
    padding: const EdgeInsets.all(20.0),
    child: const Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text('Made with Flutter.', style: TextStyle(fontSize: 16)),
        SizedBox(height: 10),
        Text('This project is under the MIT licence.', style: TextStyle(fontSize: 12)),
      ],
    ),
  );
}

class MainLayout extends StatefulWidget {
  const MainLayout({super.key});

  @override
  MainLayoutState createState() => MainLayoutState();
}

class MainLayoutState extends State<MainLayout> {
  final ScrollController _scrollController = ScrollController();

  final GlobalKey _mainSectionKey = GlobalKey();
  final GlobalKey _projectsSectionKey = GlobalKey();
  final GlobalKey _cvSectionKey = GlobalKey();
  final GlobalKey _connectSectionKey = GlobalKey();

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final List<GlobalKey> keys = [_mainSectionKey, _projectsSectionKey, _cvSectionKey, _connectSectionKey];

    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: header(context, _scrollController, keys),
      body: Stack(
        children: [
          // Background Image
          Positioned.fill(
            child: Opacity(
              opacity: 0.05,
              child: Image.asset(
                'assets/images/bg.jpg',
                fit: BoxFit.cover,
              ),
            ),
          ),

          // Scrollable Content
          SingleChildScrollView(
            controller: _scrollController,
            child: Column(
              children: <Widget>[
                SectionsManager(keys: [_mainSectionKey, _projectsSectionKey, _cvSectionKey, _connectSectionKey]),
                footer(context),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
