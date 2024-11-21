import 'dart:math';

import 'package:contty_app/pages/on_boarding/login_page/login_page.dart';
import 'package:contty_app/provider/register_state_provider.dart';
import 'package:contty_app/routes/routes.dart';
import 'package:contty_app/widgets/back_button.dart';
import 'package:contty_app/widgets/background_page.dart';
import 'package:contty_app/widgets/dialog.dart';
import 'package:contty_app/widgets/email_text_field.dart';
import 'package:contty_app/widgets/loading_dialog.dart';
import 'package:contty_app/widgets/password_text_field.dart';
import 'package:contty_app/widgets/primary_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';

class SignUpPage extends ConsumerStatefulWidget {
  @override
  _SignUpPage createState() => _SignUpPage();
}

class _SignUpPage extends ConsumerState<SignUpPage> {
  TextEditingController _controller = TextEditingController();
  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(authenticationProvider);
    final controller = ref.read(authenticationProvider.notifier);
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Stack(
        children: [
          const BackgroundPageStyle(),
          Padding(
            padding: const EdgeInsets.all(10),
            child: Column(
              children: [
                space(20),
                OnBoardingAppBar(
                  showBackButton: true,
                  title: "הרשמה למערכת",
                ),
                /* Form */
                ///   space(40),
                Center(
                    child: Container(
                        padding: const EdgeInsets.symmetric(horizontal: 50),
                        child: Column(
                          children: [
                            EmailTextField(
                              controller: _controller,
                              errorText: state.emailError,
                              onChanged: (value) {
                                controller.updateEmail(value);
                              },
                            ),
                            //  space(20),
                            PasswordTextField(
                                passwordStrength: Text(
                                  state.strenghPaswword == "weak"
                                      ? "חלש"
                                      : state.strenghPaswword == "medium"
                                          ? "בינוני"
                                          : state.strenghPaswword == "strong"
                                              ? "חזק"
                                              : "",
                                  style: TextStyle(
                                      color: state.strenghPaswword
                                                  ?.toLowerCase() ==
                                              "weak"
                                          ? Colors.red
                                          : state.strenghPaswword
                                                      ?.toLowerCase() ==
                                                  "medium"
                                              ? Colors.orange
                                              : Colors.green),
                                ),
                                errorText: state.passwordError,
                                labelText: "",
                                onSubmitted: (value) => {},
                                initialValue: state.password,
                                //errorText: passwordStrengh,
                                onChanged: (value) => {
                                      controller.checkPasswordStrength(value),
                                      controller.updatePassword(value)
                                    }),
                            //space(20),
                            RepeatPassword(
                              passwordStrength: Text(
                                state.strenghPaswword == "weak"
                                    ? "חלש"
                                    : state.strenghPaswword == "medium"
                                        ? "בינוני"
                                        : state.strenghPaswword == "strong"
                                            ? "חזק"
                                            : "",
                                style: TextStyle(
                                    color:
                                        state.strenghPaswword?.toLowerCase() ==
                                                "weak"
                                            ? Colors.red
                                            : state.strenghPaswword
                                                        ?.toLowerCase() ==
                                                    "medium"
                                                ? Colors.orange
                                                : Colors.green),
                              ),
                              labelText: "",
                              errorText: state.repeatPasswordError,
                              onChanged: (value) =>
                                  controller.updateRepeatPassword(value),
                            ), //TODO: Repear password
                          ],
                        ))),
                /* Button */
                Spacer(),
                SizedBox(
                    width: MediaQuery.sizeOf(context).width * 0.8,
                    height: 54,
                    child: PrimaryButton(
                      title: "הרשמה",
                      onPress: () async {
                        final allSet = controller.validateField();

                        if (allSet) {
                          //Handle service
                          LoadingDialog.show(context);
                          final result = await ref
                              .read(authenticationProvider.notifier)
                              .registerService();
                          LoadingDialog.hide(context);
                          if (result == null) return;
                          if (result.errorMessage != null) {
                            DialogWidget.show(
                                "ההרשמה נכשלה", result.errorMessage!, context);
                            return;
                          } else {
                            Navigator.pushNamed(
                                context, Routes.personalDetails);
                          }
                        }
                      },
                    )),
                /** Or Devider **/
                space(40),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                        padding: EdgeInsets.symmetric(vertical: 5),
                        width: 118,
                        height: 2,
                        color: Color(0xff5E6272)),
                    space(15),
                    const Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 0, horizontal: 10),
                      child: Text(
                        "או",
                        style: TextStyle(fontSize: 18),
                      ),
                    ),
                    space(10),
                    Container(
                        padding: EdgeInsets.symmetric(vertical: 5),
                        width: 118,
                        height: 2,
                        color: Color(0xff5E6272)),
                  ],
                ),
                /*Sign with apple.google.facebook*/
                const Spacer(),
                SignInButtonsGroup(),
                const Spacer(),
                /** Register **/
                TextButton(
                    onPressed: () {},
                    child: RichText(
                        text: const TextSpan(
                            text: "יש לך משתמש?התחבר",
                            children: [
                          TextSpan(
                              text: "התחבר",
                              style: TextStyle(fontWeight: FontWeight.bold))
                        ]))),
                const Spacer()
              ],
            ),
          ),
        ],
      ),
    );
  }

  SizedBox space(double height) {
    return SizedBox(
      height: height,
    );
  }
}

class OnBoardingHeader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Column(
      children: [
        Center(
          child: Image.asset(
            "assets/images/logo/conty_logo.png",
            fit: BoxFit.contain,
            width: 120,
            height: 120,
          ),
        ),
      ],
    );
  }
}

class OnBoardingAppBar extends StatelessWidget {
  final bool showBackButton;
  final bool showLogoImage;
  final String title;
  OnBoardingAppBar(
      {required this.showBackButton,
      required this.title,
      this.showLogoImage = true});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: MediaQuery.sizeOf(context).height * 0.08),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          _topWidgets(context),
          const SizedBox(
            height: 10,
          ),
          Text(
            title,
            textAlign: TextAlign.left,
            style: GoogleFonts.ibmPlexSansHebrew(
                textStyle: const TextStyle(
                    fontSize: 26,
                    fontWeight: FontWeight.w700,
                    color: Colors.white)),
          )
        ],
      ),
    );
  }

  Row _topWidgets(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Visibility(
          visible: showBackButton,
          child: Padding(
              padding: const EdgeInsets.only(left: 0),
              child: BackButtonWidget(
                padding: const EdgeInsets.all(5),
              )),
        ),
        const Spacer(),
        Visibility(
          visible: showLogoImage,
          child: Image.asset(
            width: 60,
            height: 60,
            "assets/images/logo/logo.png",
          ),
        ),
        showBackButton
            ? SizedBox(
                width: MediaQuery.sizeOf(context).width * 0.4,
              )
            : Spacer()
      ],
    );
  }
}
