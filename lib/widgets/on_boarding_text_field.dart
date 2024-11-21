import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class UserInfoTextField extends ConsumerWidget {
  final String label;
  final Widget? rightWidget;
  final String? hintText;
  final String? placeholder;
  final String? errorText;
  final Function(bool val) endEditing;
  final Function(String val) onChange;
  // final String? Function(String) validator;

  UserInfoTextField({
    required this.label,
    required this.hintText,
    this.rightWidget,
    this.placeholder,
    this.errorText,
    required this.endEditing,
    required this.onChange,
    // required this.validator,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Text(
          textAlign: TextAlign.right,
          label,
          style: TextStyle(color: Colors.white.withOpacity(0.5)),
        ),
        const SizedBox(
          height: 5,
        ),
        Builder(builder: (context) {
          return FocusScope(
            onFocusChange: endEditing,
            child: TextField(
              textAlign: TextAlign.right,
              onChanged: onChange,
              style: TextStyle(color: Colors.white.withOpacity(0.5)),
              decoration: InputDecoration(
                errorText: errorText,
                hintText: hintText,
                hintStyle: TextStyle(
                    color: Colors.white.withOpacity(0.5), fontSize: 15),
                suffixIcon: rightWidget,
              ),
              keyboardType: TextInputType.emailAddress,
            ),
          );
        })
      ],
    );
  }
}
