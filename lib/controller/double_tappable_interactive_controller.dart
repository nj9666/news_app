import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class DoubleTappableInteractiveController extends GetxController {
  late AnimationController animationController;
  Animation<Matrix4>? zoomAnimation;
  TransformationController transformationController = TransformationController();
  TapDownDetails? doubleTapDetails;
  final double scale = 4;
  final curve = Curves.fastLinearToSlowEaseIn;

  void handleDoubleTapDown(TapDownDetails details) {
    doubleTapDetails = details;
  }

  void handleDoubleTap() {
    final newValue = transformationController.value.isIdentity() ? applyZoom(doubleTapDetails!.localPosition, scale) : revertZoom();

    zoomAnimation = Matrix4Tween(
      begin: transformationController.value,
      end: newValue,
    ).animate(CurveTween(curve: curve).animate(animationController));
    animationController.forward(from: 0);
  }

  Matrix4 applyZoom(Offset localPosition, double scale) {
    final tapPosition = localPosition;
    final translationCorrection = scale - 1;
    final zoomed = Matrix4.identity()
      ..translate(
        -tapPosition.dx * translationCorrection,
        -tapPosition.dy * translationCorrection,
      )
      ..scale(scale);
    return zoomed;
  }

  Matrix4 revertZoom() => Matrix4.identity();
}
