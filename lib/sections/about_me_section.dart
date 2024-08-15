import 'package:flutter/material.dart';


Widget keyFactWidget(BuildContext context, IconData icon, String label, String value) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      Icon(icon, color: Colors.blueAccent),
      const SizedBox(width: 10),
      Text(
        '$label: ',
      ),
      Text(
        value,
      ),
    ],
  );
}

class AboutMeSection extends StatefulWidget {
  const AboutMeSection({super.key});

  @override
  AboutMeSectionState createState() => AboutMeSectionState();
}

class AboutMeSectionState extends State<AboutMeSection> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _fadeAnimation;
  late Animation<Offset> _slideAnimation;
  late Animation<double> _scaleAnimation;
  late Animation<double> _rotationAnimation;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      duration: const Duration(seconds: 2),
      vsync: this,
    );

    _fadeAnimation = CurvedAnimation(
      parent: _controller,
      curve: Curves.easeIn,
    );

    _slideAnimation = Tween<Offset>(
      begin: const Offset(0, 0.5),
      end: Offset.zero,
    ).animate(CurvedAnimation(
      parent: _controller,
      curve: Curves.easeOut,
    ));

    _scaleAnimation = Tween<double>(
      begin: 0.8,
      end: 1.0,
    ).animate(CurvedAnimation(
      parent: _controller,
      curve: Curves.easeOut,
    ));

    _rotationAnimation = Tween<double>(
      begin: -0.05,
      end: 0.0,
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
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const SizedBox(height: 50),
          FadeTransition(
            opacity: _fadeAnimation,
            child: SlideTransition(
              position: _slideAnimation,
              child: const Text(
                'Hello, I\'m Elliot Masina / Bobis33 👋',
                textAlign: TextAlign.center,
              ),
            ),
          ),
          const SizedBox(height: 20),
          ScaleTransition(
            scale: _scaleAnimation,
            child: RotationTransition(
              turns: _rotationAnimation,
              child: const CircleAvatar(
                radius: 60,
                backgroundImage: AssetImage('assets/images/profile.png'),
              ),
            ),
          ),
          const SizedBox(height: 20),
          FadeTransition(
            opacity: _fadeAnimation,
            child: SlideTransition(
              position: _slideAnimation,
              child: const Text(
                'I am currently in my third year at Efrei engineering school, working in an apprenticeship. '
                    'I specialize in software development and have a passion for low-level programming languages like C and C++. '
                    'I love creating intuitive and dynamic applications, transforming complex ideas into simple, user-friendly solutions.\n\n'
                    'When I\'m not coding, I enjoy [mention hobbies or interests]. '
                    'My work is driven by deep curiosity and a desire to push the boundaries of what is possible in the digital world.',
                textAlign: TextAlign.center,
              ),
            ),
          ),
          const SizedBox(height: 20),
          FadeTransition(
            opacity: _fadeAnimation,
            child: SlideTransition(
              position: _slideAnimation,
              child: Column(
                children: [
                  keyFactWidget(context, Icons.code, 'Experience', '3 years'),
                  const SizedBox(height: 10),
                  keyFactWidget(context, Icons.star, 'Hobbies', '[Hobby 1, Hobby 2]'),
                  const SizedBox(height: 10),
                  keyFactWidget(context, Icons.build, 'Favorite Tool', '[e.g., "VS Code"]'),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
