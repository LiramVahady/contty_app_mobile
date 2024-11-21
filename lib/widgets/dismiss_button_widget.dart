import 'package:flutter/material.dart';

class DismissButtonWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return IconButton(
        onPressed: () {
          Navigator.pop(context);
        },
        icon: Image.asset("assets/images/icons/close.png"));
  }
}
