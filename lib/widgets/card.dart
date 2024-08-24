import 'package:flutter/material.dart';
import 'dart:ui';


Widget card(double width, double height, Widget child) {
  return ClipRRect(
    borderRadius: BorderRadius.circular(30),
    child: Container(
      width: width,
      height: height,
      color: Colors.transparent,
      child: Stack(
        children: [
          BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 4.0, sigmaY: 4.0),
            child: Container(),
          ),
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30),
              border: Border.all(color: Colors.white.withOpacity(0.13)),
            ),
          ),
          Center(child: child),
        ],
      ),
    ),
  );
}
