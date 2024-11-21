import 'package:flutter/material.dart';

class PrimaryButton extends StatelessWidget {
  final String title;
  final void Function() onPress;
  const PrimaryButton({super.key, required this.title, required this.onPress});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        style: ElevatedButton.styleFrom(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15))),
        onPressed: () {
          onPress();
        },
        child: Text(title));
  }
}
