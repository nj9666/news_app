import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:news_app/controller/double_tappable_interactive_controller.dart';

// Author : Titto
class DoubleTappableInteractiveViewer extends StatefulWidget {
  final Duration scaleDuration;
  final Widget child;

  const DoubleTappableInteractiveViewer({
    Key? key,
    required this.scaleDuration,
    required this.child,
  });

  @override
  State<DoubleTappableInteractiveViewer> createState() => _DoubleTappableInteractiveViewerState();
}

class _DoubleTappableInteractiveViewerState extends State<DoubleTappableInteractiveViewer> with SingleTickerProviderStateMixin {
  final con = Get.put(DoubleTappableInteractiveController());

  @override
  void initState() {
    super.initState();
    con.animationController = AnimationController(
      vsync: this,
      duration: widget.scaleDuration,
    )..addListener(() {
        con.transformationController.value = con.zoomAnimation!.value;
      });
  }

  @override
  void dispose() {
    con.transformationController.dispose();
    con.animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onDoubleTapDown: con.handleDoubleTapDown,
      onDoubleTap: con.handleDoubleTap,
      child: InteractiveViewer(
        maxScale: con.scale,
        transformationController: con.transformationController,
        child: widget.child,
      ),
    );
  }
}
