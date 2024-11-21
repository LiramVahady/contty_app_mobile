import 'package:flutter/material.dart';

class OrSeperator extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
            padding: EdgeInsets.symmetric(vertical: 5),
            width: 118,
            height: 2,
            color: Color(0xff5E6272)),
        const SizedBox(
          height: 10,
        ),
        const Padding(
          padding: EdgeInsets.symmetric(vertical: 0, horizontal: 10),
          child: Text(
            "או",
            style: TextStyle(fontSize: 18),
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        Container(
            padding: EdgeInsets.symmetric(vertical: 5),
            width: 118,
            height: 2,
            color: Color(0xff5E6272)),
      ],
    );
  }
}
