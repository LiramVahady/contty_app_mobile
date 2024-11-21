import 'package:contty_app/controllers/on_boarding/registe_controller.dart';
import 'package:contty_app/provider/register_state_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class EmailTextField extends ConsumerStatefulWidget {
  @override
  final String? errorText;
  final ValueChanged<String> onChanged;
  final TextEditingController? controller;
  EmailTextField(
      {required this.onChanged, this.errorText, required this.controller});
  ConsumerState<ConsumerStatefulWidget> createState() {
    // TODO: implement createState
    return _EmailTextField();
  }
}

class _EmailTextField extends ConsumerState<EmailTextField> {
  @override
  void dispose() {
    widget.controller?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Text(
          textAlign: TextAlign.left,
          "כתובת האימייל שלך",
          style: TextStyle(color: Colors.white.withOpacity(0.5)),
        ),
        TextField(
          controller: widget.controller,
          onChanged: widget.onChanged,
          style: TextStyle(color: Colors.white.withOpacity(0.5)),
          decoration: InputDecoration(
            errorText: widget.errorText,

            // error: const Text("איממיל שגוי"),
          ),
          keyboardType: TextInputType.emailAddress,
        )
      ],
    );
  }
}

class PrimaryTextField extends ConsumerStatefulWidget {
  String topTitle;
  String? errorText;
  Function(String value) onChange;
  Function(bool value) onFocusChnage;
  PrimaryTextField(
      {super.key,
      required this.topTitle,
      required this.errorText,
      required this.onChange,
      required this.onFocusChnage});
  @override
  ConsumerState<ConsumerStatefulWidget> createState() {
    return _PrimaryTextField();
  }
}

class _PrimaryTextField extends ConsumerState<PrimaryTextField> {
  final TextEditingController _controller = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Text(
          textAlign: TextAlign.left,
          widget.topTitle,
          style: TextStyle(color: Colors.white.withOpacity(0.5)),
        ),
        FocusScope(
          onFocusChange: (value) => widget.onFocusChnage(value),
          child: TextField(
            controller: _controller,
            onChanged: (value) => widget.onChange(value),
            style: TextStyle(color: Colors.white.withOpacity(0.5)),
            decoration: InputDecoration(
              errorText: widget.errorText,

              // error: const Text("איממיל שגוי"),
            ),
            keyboardType: TextInputType.emailAddress,
          ),
        )
      ],
    );
  }
}
