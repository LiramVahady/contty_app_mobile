import 'package:contty_app/pages/on_boarding/sign_up_page/sign_up_page.dart';
import 'package:contty_app/widgets/background_page.dart';
import 'package:contty_app/widgets/email_text_field.dart';
import 'package:contty_app/widgets/primary_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ForgotPasswordPage extends ConsumerWidget {
  final TextEditingController _controller = TextEditingController();
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // TODO: implement build
    return Scaffold(
      body: Stack(
        children: [
          const BackgroundPageStyle(),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                /** Header **/
                OnBoardingAppBar(showBackButton: true, title: "שכחתי סיסמה"),
                /** Email Field **/
                space(40),
                Padding(
                  padding: const EdgeInsets.all(50.0),
                  child: EmailTextField(
                    controller: _controller,
                    errorText: "",
                    onChanged: (value) => "",
                  ),
                ),
                space(40),
                SizedBox(
                    width: MediaQuery.sizeOf(context).width * 0.75,
                    height: 54,
                    child: PrimaryButton(
                      title: "שלח לינק לאיפוס סיסמה",
                      onPress: () {},
                    )),
                const Spacer()
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget space(double height) {
    return SizedBox(
      height: height,
    );
  }
}
