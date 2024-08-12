import 'package:flutter/material.dart';

import '/widgets/navbar_text_button.dart';
import '/sections/sections_manager.dart';
import '/utils/scroll.dart';


AppBar header(BuildContext context, ScrollController scrollController, List<GlobalKey> keys) {
  return AppBar(
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
      navbarTextButton(context, 'About Me', () {scrollToSection(scrollController, keys[0]);}),
      navbarTextButton(context, 'Projects', () {scrollToSection(scrollController, keys[1]);}),
      navbarTextButton(context, 'CV', () {scrollToSection(scrollController, keys[2]);}),
      navbarTextButton(context, 'Connect', () {scrollToSection(scrollController, keys[3]);}),
    ],
  );
}

Widget footer(BuildContext context) {
  return Container(
    color: Theme.of(context).colorScheme.surfaceTint.withOpacity(0.1),
    padding: const EdgeInsets.all(20.0),
    child: const Row(
      children: [
        Text('© 2024 My Portfolio', style: TextStyle(fontSize: 16)),
        SizedBox(height: 10),
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
      body: SingleChildScrollView(
        controller: _scrollController,
        child: Column(
          children: <Widget>[
            SectionsManager(keys: [_mainSectionKey, _projectsSectionKey, _cvSectionKey, _connectSectionKey]),
            footer(context),
          ],
        )
      ),
    );
  }
}
