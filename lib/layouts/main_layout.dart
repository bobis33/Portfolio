import 'package:flutter/material.dart';

import '/widgets/navbar_text_button.dart';


class MainLayout extends StatefulWidget {
  final Widget child;

  const MainLayout({required this.child, super.key});

  @override
  MainLayoutState createState() => MainLayoutState();
}

class MainLayoutState extends State<MainLayout> {
  final ScrollController _scrollController = ScrollController();

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: GestureDetector(
          onTap: () {
            // Scrolling to the top
            _scrollController.animateTo(
              0,
              duration: const Duration(milliseconds: 500),
              curve: Curves.easeInOut,
            );
          },
          child: const Text('My Portfolio'),
        ),
        actions: <Widget>[
          navbarTextButton(context, 'Projects', () {}),
          navbarTextButton(context, 'CV', () {}),
          navbarTextButton(context, 'About Me', () {}),
          navbarTextButton(context, 'Connect', () {}),
        ],
      ),
      body: SingleChildScrollView(
        controller: _scrollController, // Attaching the ScrollController
        child: widget.child,
      ),
    );
  }
}
