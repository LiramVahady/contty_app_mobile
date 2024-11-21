import 'package:contty_app/pages/archeive_page/archeive_page.dart';
import 'package:contty_app/pages/create_post_process/create_post_page.dart';
import 'package:contty_app/widgets/blur_modal_widger.dart';
import 'package:contty_app/widgets/primary_text_title.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SocialSharePage extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // TODO: implement build
    return Scaffold(
      backgroundColor: Colors.white.withOpacity(0),
      body: Center(
        child: BlurOberlayMenuWidget(centerTitle: "", items: [
          BottomControllerRow(
              icon: Image.asset("assets/images/icons/instagram.png"),
              title: "Instagram"),
          _spacer(),
          BottomControllerRow(
              icon: Image.asset("assets/images/icons/youtube.png"),
              title: "Youtube"),
          _spacer(),
          BottomControllerRow(
              icon: Image.asset("assets/images/icons/facebook_ic.png"),
              title: "Facebook"),
          _spacer(),
          BottomControllerRow(
              icon: Image.asset("assets/images/icons/tiktok.png"),
              title: "Tok-Tok"),
          _spacer(),
          BottomControllerRow(
              icon: Image.asset("assets/images/icons/whatsapp.png"),
              title: "Whatsapp"),
          _spacer(),
          BottomControllerRow(
              icon: Image.asset("assets/images/icons/back_row.png"), title: "")
        ]),
      ),
    );
  }

  _spacer() {
    return const SizedBox(
      height: 20,
    );
  }
}
