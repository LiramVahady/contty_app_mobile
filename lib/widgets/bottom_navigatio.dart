// lib/widgets/bottom_navigation_widget.dart
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class BottomNavigationWidget extends StatelessWidget {
  final int currentIndex;
  final Function(int) onTap;
  final VoidCallback onMiddleButtonTap;

  const BottomNavigationWidget({
    Key? key,
    required this.currentIndex,
    required this.onTap,
    required this.onMiddleButtonTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.sizeOf(context).width;
    final screenHeight = MediaQuery.sizeOf(context).height;

    return Stack(
      alignment: Alignment.center,
      clipBehavior: Clip.none,
      children: [
        ClipRRect(
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(20.0),
            topRight: Radius.circular(20.0),
          ),
          child: BottomNavigationBar(
            selectedItemColor: Colors.blue,
            unselectedItemColor: Colors.white,
            backgroundColor: Color(0xFF262A34),
            currentIndex: currentIndex,
            onTap: onTap,
            items: [
              BottomNavigationBarItem(
                activeIcon: Image.asset(
                  "assets/images/navigation/arch.png",
                  width: 24,
                  height: 24,
                  color: Colors.blue,
                ),
                icon: Image.asset(
                  "assets/images/navigation/arch.png",
                  width: 24,
                  height: 24,
                  color: Colors.white,
                ),
                label: 'ארכיון',
              ),
              BottomNavigationBarItem(
                label: 'דף הבית',
                activeIcon: Image.asset(
                  "assets/images/navigation/home.png",
                  width: 24,
                  height: 24,
                ),
                icon: Image.asset(
                  "assets/images/navigation/home.png",
                  width: 24,
                  height: 24,
                  color: Colors.white,
                ),
              ),
            ],
          ),
        ),
        Positioned(
          bottom: -(screenHeight * (Platform.isIOS ? 0.02 : 0.05)),
          child: GestureDetector(
            onTap: () {
              onMiddleButtonTap();
            },
            child: Stack(
              children: [
                _roundeWidget(screenWidth, screenHeight),
                Positioned(
                    top: 63,
                    left: 10,
                    right: 10,
                    child: Text.rich(
                      textAlign: TextAlign.center,
                      TextSpan(
                        children: [
                          TextSpan(
                              text: '1\n',
                              style: GoogleFonts.ibmPlexSansHebrew(
                                textStyle: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 34,
                                  fontWeight: FontWeight.bold,
                                ),
                              )),
                          TextSpan(
                              text: ' סיבובים נותרו',
                              style: GoogleFonts.ibmPlexSansHebrew(
                                textStyle: const TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w400,
                                ),
                              )),
                        ],
                      ),
                    ))
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget _roundeWidget(double screenWidth, double screenHeight) {
    return Container(
      width: screenWidth * 0.26,
      height: screenHeight * 0.26,
      decoration: const BoxDecoration(
        //   color: Colors.white,
        image: DecorationImage(
            image: AssetImage(
              "assets/images/navigation/round_button.png",
            ),
            fit: BoxFit.cover),
        shape: BoxShape.circle,
      ),
    );
  }
}
