import 'package:contty_app/widgets/blur_modal_widger.dart';
import 'package:flutter/material.dart';

class OverlayUtils {
  static Future<T?> showBlurOverlay<T>({
    required BuildContext context,
    required Widget child,
    double opacity = 0.5,
    double blurAmount = 15,
    bool dismissible = true,
  }) {
    return Navigator.of(context).push<T>(
      PageRouteBuilder(
        opaque: false,
        barrierDismissible: dismissible,
        pageBuilder: (context, animation, secondaryAnimation) {
          return BlurOverlay(
            opacity: opacity,
            blurAmount: blurAmount,
            child: GestureDetector(
              onTap: dismissible ? () => Navigator.pop(context) : null,
              child: child,
            ),
          );
        },
        transitionsBuilder: (context, animation, secondaryAnimation, child) {
          return FadeTransition(
            opacity: animation.drive(
              CurveTween(curve: Curves.easeOut),
            ),
            child: child,
          );
        },
      ),
    );
  }
}
