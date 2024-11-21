import 'package:flutter/material.dart';

import 'package:flutter/material.dart';

class BackButtonWidget extends StatelessWidget {
  final EdgeInsets? padding;
  final EdgeInsets? margin;

  BackButtonWidget({super.key, this.padding, this.margin});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.of(context).pop(), // Navigate back on tap
      child: Container(
        padding: padding,
        margin: margin,
        decoration: BoxDecoration(
            color: Colors.white.withOpacity(0.11), shape: BoxShape.circle),
        child: const Icon(
          Icons.arrow_back,
          color: Colors.white, // Icon color
        ),
      ),
    );
  }
}
