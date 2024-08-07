import 'package:flutter/material.dart';


class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final ColorScheme colorTheme = Theme.of(context).colorScheme;

    return Scaffold(
      extendBodyBehindAppBar: true,
      body: Stack(
        children: <Widget>[
          Container(
            padding: const EdgeInsets.all(16),
            child: Row(
              children: <Widget>[
                Switch(
                  inactiveTrackColor: Colors.grey,
                  value: true,
                  onChanged: (value) {},
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}