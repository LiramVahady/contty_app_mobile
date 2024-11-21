import 'package:contty_app/controllers/on_boarding/registe_controller.dart';
import 'package:contty_app/provider/register_state_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final passwordSecureProvider = StateProvider<bool>((ref) => true);

class RepeatPassword extends ConsumerWidget {
  final String labelText;
  final String? errorText;
  final Widget? passwordStrength;
  final Function(String value) onChanged;

  RepeatPassword(
      {required this.labelText,
      required this.onChanged,
      required this.errorText,
      this.passwordStrength});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isSecure = ref.watch(passwordSecureProvider);
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Text(
            textAlign: TextAlign.right,
            "סיסמה",
            style: TextStyle(color: Colors.white.withOpacity(0.5)),
          ),
          TextField(
            obscureText: isSecure,
            onChanged: onChanged,
            decoration: InputDecoration(
                hintText: "",
                labelText: labelText,
                errorText: errorText,
                suffixIcon: GestureDetector(
                    onTap: () => ref
                        .read(passwordSecureProvider.notifier)
                        .state = !isSecure,
                    child: SecureTextFieldIcon())),
            keyboardType: TextInputType.emailAddress,
          )
        ],
      ),
    );
  }
}

class SecureTextFieldIcon extends StatelessWidget {
  const SecureTextFieldIcon({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(10),
      width: 22,
      height: 22,
      decoration:
          const BoxDecoration(shape: BoxShape.circle, color: Color(0xff5E6272)),
      child: Center(
          child: Padding(
              padding: const EdgeInsets.all(5),
              child: Image.asset("assets/images/icons/eye.png"))),
    );
  }
}

class PasswordTextField extends ConsumerWidget {
  final String initialValue;
  final String labelText;
  final String? errorText;
  final Widget? passwordStrength;
  final TextEditingController? controller;
  final Function(String value) onChanged;
  final Function(String value)? onSubmitted;
  PasswordTextField(
      {required this.initialValue,
      required this.labelText,
      required this.onChanged,
      required this.onSubmitted,
      required this.errorText,
      this.controller,
      this.passwordStrength});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isSecure = ref.watch(passwordSecureProvider);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Text(
          textAlign: TextAlign.right,
          "סיסמה",
          style: TextStyle(color: Colors.white.withOpacity(0.5)),
        ),
        TextField(
          controller: controller,
          obscureText: isSecure,
          onChanged: (value) => onChanged(value),
          onSubmitted: (value) => onSubmitted ?? onSubmitted!(value),
          decoration: InputDecoration(
              hintText: "",
              labelText: labelText,
              errorText: errorText,
              suffixIcon: GestureDetector(
                  onTap: () => ref.read(passwordSecureProvider.notifier).state =
                      !isSecure,
                  child: SecureTextFieldIcon())),
        ),
        if (passwordStrength != null) passwordStrength!
      ],
    );
  }
}
