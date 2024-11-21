import 'package:contty_app/globals/contants_values.dart';
import 'package:contty_app/pages/archeive_page/archeive_page.dart';
import 'package:contty_app/pages/create_post_process/create_post_page.dart';
import 'package:contty_app/routes/routes.dart';
import 'package:contty_app/widgets/back_button.dart';
import 'package:flutter/material.dart';

class CreateImagePostConfirmationPage extends StatelessWidget {
  const CreateImagePostConfirmationPage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ConstantColor.clear,
      body: Center(
        child: BlurOberlayMenuWidget(
            showLogo: true,
            centerTitle: "בטוח/ה בבחירה שלך?",
            centerLogo:
                Image.asset("assets/images/logo/logo_question_mark.png"),
            items: [
              /** Next Step **/
              GestureDetector(
                onTap: () {
                  Navigator.pop(context);
                  Navigator.pushNamed(context, Routes.postImagePreview);
                },
                child: BottomControllerRow(
                    icon: Image.asset(
                      "assets/images/icons/painter.png",
                      width: 108,
                      height: 120,
                    ),
                    title: "המשך לשלב הבא"),
              ),
              const SizedBox(
                height: 30,
              ),
              /** Dismiss **/
              GestureDetector(
                behavior: HitTestBehavior.translucent,
                onTap: () => Navigator.pop(context),
                child: BottomControllerRow(
                    icon: BackButtonWidget(), title: "חזרה לשלב הקודם"),
              )
            ]),
      ),
    );
  }
}
