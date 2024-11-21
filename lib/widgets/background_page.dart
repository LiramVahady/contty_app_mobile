import 'dart:ui';

import 'package:flutter/material.dart';

class BackgroundPageStyleGradient extends StatelessWidget {
  final showLogo;

  const BackgroundPageStyleGradient({super.key, this.showLogo = false});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.sizeOf(context).width;
    final screenHeight = MediaQuery.sizeOf(context).height;
    return Container(
      width: screenWidth,
      height: screenHeight,
      clipBehavior: Clip.antiAlias,
      decoration: ShapeDecoration(
        color: const Color(0xFF191B23),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(0),
        ),
        shadows: const [
          BoxShadow(
            color: Color(0x3F000000),
            blurRadius: 4,
            offset: Offset(0, 4),
            spreadRadius: 0,
          )
        ],
      ),
      child: Stack(
        children: [
          // Positioned(
          //   left: -77,
          //   top: 430,
          //   child: Container(
          //     width: 477,
          //     height: 488,
          //     decoration: const ShapeDecoration(
          //       color: Color(0xCC312F5B),
          //       shape: OvalBorder(),
          //     ),
          //   ),
          // ),
          Positioned(
            left: 0,
            top: -188,
            child: Container(
              width: 477,
              height: 488,
              decoration: const ShapeDecoration(
                color: Color(0xCC312F5B),
                shape: OvalBorder(),
              ),
            ),
          ),
          Positioned(
            left: 9,
            top: 5,
            child: Container(
              width: 374,
              height: 33,
              clipBehavior: Clip.antiAlias,
              decoration: BoxDecoration(),
            ),
          ),
          Positioned(
            left: 105,
            top: 300,
            child: Container(
              width: 183.89,
              height: 200,
              child: Stack(),
            ),
          ),
          Positioned.fill(
              child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 100, sigmaY: 100),
            child: Container(
              decoration: BoxDecoration(color: Colors.white.withOpacity(0.04)),
            ),
          )),
          Visibility(
            visible: showLogo,
            child: Positioned(
                top: MediaQuery.sizeOf(context).height / 2.5,
                left: MediaQuery.sizeOf(context).width / 2.5,
                child: Image.asset("assets/images/logo/logo.png")),
          ),
        ],
      ),
    );
  }
}

class BackgroundPageStyle extends StatelessWidget {
  final showLogo;

  const BackgroundPageStyle({super.key, this.showLogo = false});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.sizeOf(context).width;
    final screenHeight = MediaQuery.sizeOf(context).height;
    return Container(
      width: screenWidth,
      height: screenHeight,
      clipBehavior: Clip.antiAlias,
      decoration: ShapeDecoration(
        color: const Color(0xFF191B23),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(0),
        ),
        shadows: const [
          BoxShadow(
            color: Color(0x3F000000),
            blurRadius: 4,
            offset: Offset(0, 4),
            spreadRadius: 0,
          )
        ],
      ),
      child: Stack(
        children: [
          Positioned(
            left: -77,
            top: 430,
            child: Container(
              width: 477,
              height: 488,
              decoration: const ShapeDecoration(
                color: Color(0xCC312F5B),
                shape: OvalBorder(),
              ),
            ),
          ),
          Positioned(
            left: 0,
            top: -188,
            child: Container(
              width: 477,
              height: 488,
              decoration: const ShapeDecoration(
                color: Color(0xCC312F5B),
                shape: OvalBorder(),
              ),
            ),
          ),
          Positioned(
            left: 9,
            top: 5,
            child: Container(
              width: 374,
              height: 33,
              clipBehavior: Clip.antiAlias,
              decoration: BoxDecoration(),
            ),
          ),
          Positioned(
            left: 105,
            top: 300,
            child: Container(
              width: 183.89,
              height: 200,
              child: Stack(),
            ),
          ),
          // Positioned(
          //     bottom: 0,
          //     child: Image.asset("assets/images/vector/bg_zig_zag.png")),
          Positioned.fill(
              child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 100, sigmaY: 100),
            child: Container(
              decoration: BoxDecoration(color: Colors.white.withOpacity(0.04)),
            ),
          )),
          Visibility(
            visible: showLogo,
            child: Positioned(
                top: MediaQuery.sizeOf(context).height / 2.5,
                left: MediaQuery.sizeOf(context).width / 2.5,
                child: Image.asset("assets/images/logo/logo.png")),
          ),
        ],
      ),
    );
  }
}
