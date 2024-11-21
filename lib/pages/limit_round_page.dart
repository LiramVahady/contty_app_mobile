import 'package:contty_app/routes/routes.dart';
import 'package:contty_app/widgets/blur_modal_widger.dart';
import 'package:contty_app/widgets/dismiss_button_widget.dart';
import 'package:contty_app/widgets/primary_button.dart';
import 'package:contty_app/widgets/primary_text_title.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class LimitRoundWidget extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // TODO: implement build
    return BlurOverlay(
      opacity: 0.2,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          Align(
            alignment: Alignment.topRight,
            child: DismissButtonWidget(),
          ),
          Image.asset("assets/images/logo/logo.png"),
          const SizedBox(
            height: 20,
          ),
          PrimaryTextTitle(
              text: "נראה שהגעת למגבלת הסיבובים היומית",
              fontSize: 27,
              fontWeight: FontWeight.w500),
          const SizedBox(
            height: 20,
          ),
          Stack(
            alignment: Alignment.center,
            children: [
              Positioned(
                top: 60,
                child: PrimaryTextTitle(
                  text: "5:55:00",
                  fontSize: 40,
                  fontWeight: FontWeight.w700,
                ),
              ),
              Positioned(
                  child: Image.asset("assets/images/vectors/kav-kav.png")),
              Positioned(
                  bottom: -2,
                  child: PrimaryTextTitle(
                      text: "עד לסיבוב הבא",
                      fontSize: 14,
                      fontWeight: FontWeight.w400)),
            ],
          ),
          const SizedBox(
            height: 150,
          ),
          SizedBox(
            height: 60,
            width: MediaQuery.sizeOf(context).width * 0.7,
            child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.white.withOpacity(0.1)),
                child: const Text("רכישת מנוי"),
                onPressed: () {
                  Navigator.pushNamed(context, Routes.planPremium);
                }),
          )
        ],
      ),
    );
  }
}
