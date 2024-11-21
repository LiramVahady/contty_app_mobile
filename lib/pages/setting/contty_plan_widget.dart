import 'package:contty_app/routes/routes.dart';
import 'package:contty_app/widgets/primary_button.dart';
import 'package:contty_app/widgets/primary_text_title.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ConttyPlanStatusWidget extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // TODO: implement build
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30),
          border: Border.all(
              color: const Color.fromARGB(255, 255, 255, 255), width: 1)),
      child: Column(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                "assets/images/logo/logo.png",
                width: 40,
                height: 40,
              ),
              const SizedBox(
                width: 10,
              ),
              PrimaryTextTitle(
                  text: "CONTTY Pro",
                  fontSize: 20,
                  fontWeight: FontWeight.w600),
            ],
          ),
          _space(25),
          PrimaryTextTitle(
              textColor: Color(0xff7B7B80),
              text:
                  "ליהנות מיצירתיות בלתי מוגבלת עם הכלים המתקדמים שלנו ליצירת תמונות וסרטונים בכל הסגנונות האפשריים.",
              fontSize: 12,
              fontWeight: FontWeight.w400),
          _space(25),
          _inactiveMember(context)
        ],
      ),
    );
  }

  Widget _inactiveMember(BuildContext context) {
    return SizedBox(
        height: 50,
        width: MediaQuery.sizeOf(context).width * 0.7,
        child: PrimaryButton(
            title: "שדרגו כעת",
            onPress: () {
              Navigator.pushNamed(context, Routes.planPremium);
            }));
  }

  Widget _activeMember() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        PrimaryTextTitle(
            textColor: Color(0xff246BFD),
            text: "ברשותך רישיון למנוי חודשי",
            fontSize: 14,
            fontWeight: FontWeight.w500),
        const SizedBox(
          width: 15,
        ),
        Image.asset(
          "assets/images/icons/diamond.png",
          width: 25,
          height: 25,
        ),
      ],
    );
  }

  _space(double height) {
    return SizedBox(
      height: height,
    );
  }
}
