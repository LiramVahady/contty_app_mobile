import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class BlurModalWidger extends ConsumerWidget {
  final Widget? child;
  const BlurModalWidger({super.key, this.child});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // TODO: implement build
    return Stack(
      alignment: Alignment.center,
      children: [_blur(), if (child != null) child!],
    );
  }

  Positioned _blur() {
    return Positioned.fill(
        child: BackdropFilter(
      filter: ImageFilter.blur(sigmaX: 5, sigmaY: 10),
      child: Container(
        decoration: BoxDecoration(color: Colors.white.withOpacity(0.0)),
      ),
    ));
  }
}

class BlurOverlay extends StatelessWidget {
  final Widget child;
  final double opacity;
  final double blurAmount;

  const BlurOverlay({
    super.key,
    required this.child,
    this.opacity = 0.2,
    this.blurAmount = 5,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: Stack(
        fit: StackFit.expand,
        children: [
          BackdropFilter(
            filter: ImageFilter.blur(
              sigmaX: blurAmount,
              sigmaY: blurAmount,
            ),
            child: Container(
              color: Colors.black.withOpacity(opacity),
            ),
          ),
          child,
        ],
      ),
    );
  }
}
