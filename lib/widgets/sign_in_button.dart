import 'package:flutter/material.dart';

class SignInButton extends StatelessWidget {
  final String signInType;

  // final Color color;
  // final IconData icon;
  // final VoidCallback onPressed;

  const SignInButton({
    Key? key,
    required this.signInType,
    // required this.color,
    // required this.icon,
    // required this.onPressed,
  }) : super(key: key);

  String get iconPath {
    switch (signInType) {
      case "apple":
        return "assets/images/icons/apple.png";
      case "google":
        return "assets/images/icons/google.png";
      case "facebook":
        return "assets/images/icons/facebook.png";
      default:
        return "";
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        child: Container(
      padding: EdgeInsets.all(10),
      width: 60,
      height: 60,
      decoration: BoxDecoration(
          border: Border.all(color: Colors.white, width: 1),
          borderRadius: BorderRadius.circular(15)),
      child: Center(
        child: Image.asset(iconPath),
      ),
    ));
  }
}
