import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:flutter_translate/flutter_translate.dart';
import 'package:portfolio/models/common.dart';

import '/models/social.dart';
import '/sections/sections_manager.dart';
import '/utils/on_pressed_launch_url.dart';
import '/utils/scroll.dart';
import '/widgets/text_button_icon.dart';


Widget gradientAlertDialog(BuildContext context, List<Widget> actions) {
  return Dialog(
    elevation: 0,
    child: Container(
      decoration: BoxDecoration(
        border: Border.all(color: Colors.transparent),
        gradient: const LinearGradient(
          colors: [Colors.blueAccent, Colors.purpleAccent],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            ...actions,
          ],
        ),
      ),
    ),
  );
}

Widget navbarTextButton(BuildContext context, String text, void Function() onPressed) {
  return TextButton(
    style: TextButton.styleFrom(
      foregroundColor: Colors.white,
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
      child: const Text('Elliot Masina', style: TextStyle(color: Colors.white)),
    ),
    actions: <Widget>[
      navbarTextButton(context, translate('aboutMe'), () { scrollToSection(scrollController, keys[1]); }),
      navbarTextButton(context, translate('projects'), () { scrollToSection(scrollController, keys[2]); }),
      Theme(
        data: Theme.of(context).copyWith(
          popupMenuTheme: PopupMenuThemeData(
            color: Theme.of(context).colorScheme.onPrimaryContainer.withOpacity(0.5),
          ),
        ),
        child: PopupMenuButton<String>(
          elevation: 0,
          offset: const Offset(0, 48),
          tooltip: '',
          icon: const Icon(Icons.settings),
          onSelected: (value) {
            if (value == 'language') {
              showDialog(
                context: context,
                builder: (BuildContext context) {
                  return gradientAlertDialog(
                    context,
                    <Widget>[
                      TextButton(
                        onPressed: () {
                          changeLocale(context, LangEnum.en_US.name);
                          Navigator.of(context).pop();
                        },
                        child: Text(translate('en')),
                      ),
                      TextButton(
                        onPressed: () {
                          changeLocale(context, LangEnum.fr_FR.name);
                          Navigator.of(context).pop();
                        },
                        child: Text(translate('fr')),
                      ),
                    ],
                  );
                },
              );
            }
          },
          itemBuilder: (BuildContext context) => <PopupMenuEntry<String>>[
            PopupMenuItem<String>(
              value: 'language',
              child: Text(translate('changeLanguage')),
            ),
          ],
        ),
      ),
    ],
  );
}

Widget footer(BuildContext context) {
  return Container(
    padding: const EdgeInsets.only(bottom: 5),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(translate('madeWithFlutter'), style: Theme.of(context).textTheme.labelLarge),
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
                    Text(socialLink.label, style: Theme.of(context).textTheme.labelMedium),
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