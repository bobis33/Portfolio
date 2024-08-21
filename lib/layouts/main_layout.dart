import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '/models/social.dart';
import '/sections/sections_manager.dart';
import '/utils/on_pressed_launch_url.dart';
import '/utils/scroll.dart';
import '/widgets/text_button_icon.dart';


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
          duration: const Duration(milliseconds: 800),
          curve: Curves.ease,
        );
      },
      child: const Text('Elliot Masina'),
    ),
    actions: <Widget>[
      navbarTextButton(context, 'About Me', () { scrollToSection(scrollController, keys[1]); }),
      navbarTextButton(context, 'Projects', () { scrollToSection(scrollController, keys[2]); }),
    ],
  );
}

Widget footer(BuildContext context) {
  return Container(
    padding: const EdgeInsets.only(bottom: 5),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text('Made with Flutter.', style: TextStyle(fontSize: 16)),
        const SizedBox(height: 10),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: getSocialLinks().map((socialLink) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                textButtonIcon(
                    context,
                    FaIcon(socialLink.icon, color: socialLink.color, size: 15),
                    Text(socialLink.label, style: const TextStyle(fontSize: 10)),
                        () { onPressedLaunchUrl(socialLink.url, context); }
                ),
              ],
            );
          }).toList(),
        ),
      ],
    ),
  );
}

class MainLayout extends StatefulWidget {
  const MainLayout({super.key});

  @override
  MainLayoutState createState() => MainLayoutState();
}

class MainLayoutState extends State<MainLayout> with SingleTickerProviderStateMixin {
  final ScrollController _scrollController = ScrollController();

  final GlobalKey _aboutMeSectionKey = GlobalKey();
  final GlobalKey _projectsSectionKey = GlobalKey();
  final GlobalKey _connectSectionKey = GlobalKey();

  late AnimationController _animationController;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      duration: const Duration(seconds: 3),
      vsync: this,
    )..repeat(reverse: true);

    _animation = Tween<double>(begin: 0, end: 1).animate(
      CurvedAnimation(parent: _animationController, curve: Curves.easeInOut),
    );
  }

  @override
  void dispose() {
    _animationController.dispose();
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final List<GlobalKey> keys = [_aboutMeSectionKey, _projectsSectionKey, _connectSectionKey];

    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: header(context, _scrollController, keys),
      body: Stack(
        children: [
          Positioned.fill(
            child: Opacity(
              opacity: 0.6,
              child: Container(
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    colors: [Colors.blueAccent, Colors.purpleAccent],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                ),
              ),
            ),
          ),
          Positioned.fill(
            child: AnimatedBuilder(
              animation: _animation,
              builder: (context, child) {
                return Opacity(
                  opacity: 0.2,
                  child: CustomPaint(
                    painter: BackgroundPainter(animationValue: _animation.value),
                  ),
                );
              },
            ),
          ),
          SingleChildScrollView(
            controller: _scrollController,
            child: Column(
              children: <Widget>[
                SectionsManager(keys: [_aboutMeSectionKey, _projectsSectionKey, _connectSectionKey]),
                footer(context),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class BackgroundPainter extends CustomPainter {
  final double animationValue;
  final double spacing = 50;

  BackgroundPainter({required this.animationValue});

  @override
  void paint(Canvas canvas, Size size) {
    final Paint paint = Paint()
      ..color = Colors.white.withOpacity(0.5)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 2.0;

    final Path path = Path();
    for (double i = 0; i < size.width; i += spacing) {
      path.moveTo(i, 0);
      path.lineTo(i, size.height + spacing);
    }

    for (double i = 0; i < size.height + spacing; i += spacing) {
      path.moveTo(0, i);
      path.lineTo(size.width, i);
    }

    canvas.save();
    canvas.translate(0, (animationValue * 20) - spacing);
    canvas.drawPath(path, paint);
    canvas.restore();
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}