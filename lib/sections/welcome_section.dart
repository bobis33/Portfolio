import 'package:flutter/material.dart';
import 'package:flutter_translate/flutter_translate.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';


class WelcomeSection extends StatefulWidget {
  final GlobalKey secondKey;

  const WelcomeSection({super.key, required this.secondKey});

  @override
  WelcomeSectionState createState() => WelcomeSectionState();
}

class WelcomeSectionState extends State<WelcomeSection> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _fadeInAnimation;
  late Animation<Offset> _slideUpAnimation;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      duration: const Duration(seconds: 2),
      vsync: this,
    );

    _fadeInAnimation = CurvedAnimation(
      parent: _controller,
      curve: Curves.easeIn,
    );

    _slideUpAnimation = Tween<Offset>(
      begin: const Offset(0, 0.5),
      end: Offset.zero,
    ).animate(CurvedAnimation(
      parent: _controller,
      curve: Curves.easeOut,
    ));

    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {

    TextTheme textTheme = Theme.of(context).textTheme;

    return SizedBox(
      width: double.infinity,
      height: MediaQuery.of(context).size.height,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Spacer(),
          FadeTransition(
            opacity: _fadeInAnimation,
            child: SlideTransition(
              position: _slideUpAnimation,
              child: Text(
                translate('helloAndWelcome'),
                style: textTheme.headlineLarge,
                textAlign: TextAlign.center,
              ),
            ),
          ),
          const Spacer(),
          FadeTransition(
            opacity: _fadeInAnimation,
            child: SlideTransition(
              position: _slideUpAnimation,
              child: IconButton(
                icon: const Icon(FontAwesomeIcons.arrowDown, color: Colors.white, size: 30),
                onPressed: () {
                  Scrollable.ensureVisible(widget.secondKey.currentContext!,
                      duration: const Duration(milliseconds: 800),
                      curve: Curves.ease);
                },
              ),
            ),
          ),
          const SizedBox(),
          FadeTransition(
            opacity: _fadeInAnimation,
            child: SlideTransition(
              position: _slideUpAnimation,
              child: Text(translate('scrollDown'),
                  style: textTheme.bodyLarge
              ),
            ),
          ),
          const SizedBox(height: 50),
        ],
      ),
    );
  }
}
