import 'package:contty_app/controllers/auth_controller.dart';
import 'package:contty_app/generated/l10n.dart';
import 'package:contty_app/pages/main_page.dart';
import 'package:contty_app/pages/on_boarding/sign_up_page/sign_up_page.dart';
import 'package:contty_app/provider/register_state_provider.dart';
import 'package:contty_app/routes/routes.dart';
import 'package:contty_app/singelton/shared_user.dart';
import 'package:contty_app/widgets/background_page.dart';
import 'package:contty_app/widgets/dialog.dart';
import 'package:contty_app/widgets/email_text_field.dart';
import 'package:contty_app/widgets/loading_dialog.dart';
import 'package:contty_app/widgets/or_seperator.dart';
import 'package:contty_app/widgets/password_text_field.dart';
import 'package:contty_app/widgets/primary_button.dart';
import 'package:contty_app/widgets/sign_in_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class LoginPage extends ConsumerStatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends ConsumerState<LoginPage> {
  // late TextEditingController _emailController;
  // late TextEditingController _passwordController;

  // @override
  // void initState() {
  //   super.initState();
  //   _emailController = TextEditingController();
  //   _passwordController = TextEditingController();
  // }

  // @override
  // void dispose() {
  //   // TODO: implement dispose
  //   _emailController.dispose();
  //   _passwordController.dispose();
  //   super.dispose();
  // }

  @override
  Widget build(BuildContext context) {
    final controller = ref.read(authenticationProvider.notifier);
    final state = ref.watch(authenticationProvider);
    final userInfoController = ref.read(authProvider.notifier);
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Stack(
        children: [
          const Positioned.fill(child: BackgroundPageStyle(showLogo: false)),
          Column(
            children: [
              space(20),
              OnBoardingAppBar(
                showBackButton: false,
                title: "כניסה למערכת",
              ),
              /* Form */
              space(40),
              Center(
                  child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 50),
                      child: Column(
                        children: [
                          FocusScope(
                            onFocusChange: (value) {},
                            child: EmailTextField(
                              controller: null,
                              errorText: state.emailError,
                              onChanged: (value) =>
                                  controller.updateEmail(value),
                            ),
                          ),
                          space(30),
                          PasswordTextField(
                            onSubmitted: (value) => "",
                            initialValue: "",
                            labelText: "",
                            errorText: state.passwordError,
                            onChanged: (value) =>
                                controller.updatePassword(value),
                          ),
                          space(10),
                          Align(
                            alignment: Alignment.centerLeft,
                            child: TextButton(
                              style: const ButtonStyle(
                                  foregroundColor:
                                      WidgetStatePropertyAll<Color>(
                                          Colors.white)),
                              onPressed: () => {
                                Navigator.pushNamed(
                                    context, Routes.forgotPassword)
                              },
                              child: Text("שכחתי סיסמה"),
                            ),
                          )
                        ],
                      ))),
              /* Button */
              SizedBox(
                  width: MediaQuery.sizeOf(context).width * 0.8,
                  height: 54,
                  child: PrimaryButton(
                    title: "כניסה לחשבון",
                    onPress: () async {
                      LoadingDialog.show(context);
                      final result = await controller.login();
                      LoadingDialog.hide(context);
                      if (result == null) return;
                      if (result.isSuccess) {
                        //load user info
                        final userInfoResult = await controller
                            .loadUserInfo(SharedUser.instance.currentUser!.id);

                        if (userInfoResult?.data != null) {
                          if (mounted)
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (ctx) => MainPage()));
                        } else {
                          if (mounted)
                            Navigator.pushNamed(
                                context, Routes.personalDetails);
                        }
                      } else {
                        final errorMessage = result.errorMessage ?? "";
                        DialogWidget.show(
                            "התחברות נכשלה", errorMessage, context);
                      }
                      // Navigator.pushReplacementNamed(context, Routes.main);
                    },
                  )),
              /** Or Devider **/
              space(40),
              OrSeperator(),
              /*Sign with apple.google.facebook*/
              const Spacer(),
              SignInButtonsGroup(),
              const Spacer(),
              /** Register **/
              TextButton(
                  onPressed: () {
                    Navigator.pushNamed(context, Routes.signUp);
                  },
                  child: RichText(
                      text: const TextSpan(text: "אין לך משתמש?", children: [
                    TextSpan(
                        text: "הירשם",
                        style: TextStyle(fontWeight: FontWeight.bold))
                  ]))),
              const Spacer()
            ],
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

class SignInButtonsGroup extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // TODO: implement build
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: 70),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SignInButton(signInType: "apple"),
          Spacer(),
          SignInButton(signInType: "google"),
          Spacer(),
          SignInButton(signInType: "facebook")
        ],
      ),
    );
  }
}
