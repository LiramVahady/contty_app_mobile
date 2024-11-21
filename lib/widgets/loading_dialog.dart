import 'package:contty_app/widgets/blur_modal_widger.dart';
import 'package:flutter/material.dart';

class LoadingDialog {
  static void show(BuildContext context) {
    showDialog(
      context: context,
      barrierDismissible: false, // Prevent dismissal by tapping outside
      builder: (BuildContext context) {
        return AlertDialog(
            backgroundColor: Colors.white.withOpacity(0),
            content: BlurModalWidger(
              child: Image.asset("assets/images/logo/loading.png"),
            ));
      },
    );
  }

  static void hide(BuildContext context) {
    Navigator.of(context, rootNavigator: true).pop();
  }
}
