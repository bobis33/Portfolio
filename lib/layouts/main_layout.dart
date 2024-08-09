import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

import '/widgets/navbar_text_button.dart';
import '/sections/sections_manager.dart';


class MainLayout extends StatefulWidget {

  const MainLayout({super.key});

  @override
  MainLayoutState createState() => MainLayoutState();
}

class MainLayoutState extends State<MainLayout> {
  final ScrollController _scrollController = ScrollController();

  final GlobalKey _mainSectionKey = GlobalKey();
  final GlobalKey _projectsSectionKey = GlobalKey();

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  void _scrollToSection(GlobalKey key) {
    final RenderObject? renderObject = key.currentContext!.findRenderObject();
    final RenderAbstractViewport viewport = RenderAbstractViewport.of(renderObject!);
    final double targetOffset = viewport.getOffsetToReveal(renderObject, 0.0).offset;
    _scrollController.animateTo(targetOffset, duration: const Duration(milliseconds: 500), curve: Curves.ease);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        title: GestureDetector(
          onTap: () {_scrollToSection(_mainSectionKey);},
          child: const Text('My Portfolio'),
        ),
        actions: <Widget>[
          navbarTextButton(context, 'Projects', () {_scrollToSection(_projectsSectionKey);}),
          navbarTextButton(context, 'CV', () {}),
          navbarTextButton(context, 'About Me', () {}),
          navbarTextButton(context, 'Connect', () {}),
        ],
      ),
      body: SingleChildScrollView(
        controller: _scrollController,
        child: SectionsManager(keys: [_mainSectionKey, _projectsSectionKey]),
      ),
    );
  }
}
