import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';


void scrollToSection(ScrollController scrollController, GlobalKey key) {
  final RenderObject? renderObject = key.currentContext!.findRenderObject();
  final RenderAbstractViewport viewport = RenderAbstractViewport.of(renderObject!);
  final double targetOffset = viewport.getOffsetToReveal(renderObject, 0.0).offset - 60.0;

  scrollController.animateTo(
    targetOffset.clamp(
        0.0, scrollController.position.maxScrollExtent),
    duration: const Duration(milliseconds: 500),
    curve: Curves.ease,
  );
}