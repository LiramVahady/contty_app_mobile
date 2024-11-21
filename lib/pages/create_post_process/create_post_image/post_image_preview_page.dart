import 'package:contty_app/globals/contants_values.dart';
import 'package:contty_app/pages/create_post_process/create_post_image/header_post_image.dart';
import 'package:contty_app/pages/social_share_page/social_share_page.dart';
import 'package:contty_app/provider/main_page_index_provider.dart';
import 'package:contty_app/routes/routes.dart';
import 'package:contty_app/utils/show_overlay.dart';
import 'package:contty_app/widgets/background_page.dart';
import 'package:contty_app/widgets/primary_text_title.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class PostImagePreviewPage extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final screenWidth = MediaQuery.sizeOf(context).height;
    final screenHeight = MediaQuery.sizeOf(context).height;

    // TODO: implement build
    return Scaffold(
      backgroundColor: ConstantColor.PRIMARY_BG_COLOR,
      body: Stack(
        children: [
          const Positioned.fill(child: BackgroundPageStyle()),
          const DiviedHeaderWidget(
            showBottomDivider: false,
            title: "סקירת פוסט",
          ),
          Positioned(
            top: screenHeight * 0.2,
            left: 25,
            right: 25,
            bottom: 20,
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  /** Image Container **/
                  SizedBox(
                    width: screenWidth * 0.8,
                    height: screenHeight * 0.4,
                    child: Image.asset("assets/images/mock/ppMock4.png"),
                  ),
                  /** Post Title **/
                  _space(40),
                  PrimaryTextTitle(
                      text: "כורת הפוסט",
                      fontSize: 19,
                      fontWeight: FontWeight.w700),
                  _space(10),
                  Container(
                    width: screenWidth * 0.35,
                    padding: const EdgeInsets.symmetric(
                        horizontal: 10, vertical: 14),
                    decoration: BoxDecoration(
                        color: Color(0xFF303239),
                        borderRadius: BorderRadius.circular(8)),
                    child: PrimaryTextTitle(
                        text: "כיצד להשיג עוד זוהר ב-5 צעדים",
                        textAlign: TextAlign.end,
                        fontSize: 14,
                        fontWeight: FontWeight.w400),
                  ),
                  /** Poset Describe **/
                  _space(26),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 21, vertical: 12),
                        decoration: BoxDecoration(
                            color: const Color(0xFF303239),
                            borderRadius: BorderRadius.circular(25)),
                        child: Center(
                          child: PrimaryTextTitle(
                              text: "עריכה",
                              fontSize: 14,
                              fontWeight: FontWeight.w600),
                        ),
                      ),
                      const Spacer(),
                      PrimaryTextTitle(
                          text: "תיאור הפוסט",
                          fontSize: 19,
                          fontWeight: FontWeight.w700),
                    ],
                  ),
                  /** Post Text Content **/
                  _space(13),
                  IntrinsicHeight(
                    child: Container(
                      padding: const EdgeInsets.only(
                          top: 12, right: 12, bottom: 40, left: 40),
                      decoration: BoxDecoration(
                          color: const Color(0xFF303239),
                          borderRadius: BorderRadius.circular(8)),
                      child: Center(
                        child: PrimaryTextTitle(
                            textAlign: TextAlign.right,
                            text:
                                "פלוני אלמוני, אישיות בדיונית שמייצגת אדם אלמוני או דמות בלתי מזוהה, משמש לעיתים קרובות בספרות, קולנוע, וטלוויזיה כדי להמחיש מצבים או דמויות שאינם זקוקים לזיהוי אישי. פלוני אלמוני מסמל את האדם הממוצע, ומאפשר להציג נרטיבים כלליים ואוניברסליים מבלי להתמקד בפרטים אישיים. במקרים משפטיים, המונח משמש להגן על זהות אנשים שאינם מעוניינים להיחשף בציבור או בהקשרים ציבוריים אחרים.",
                            fontSize: 13,
                            fontWeight: FontWeight.w400),
                      ),
                    ),
                  ),
                  /** Post Preview  **/
                  _space(24),
                  Visibility(
                    visible: false,
                    child: Align(
                      alignment: Alignment.center,
                      child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.white.withOpacity(0.1)),
                          onPressed: () {},
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                                vertical: 12, horizontal: 21),
                            child: PrimaryTextTitle(
                                text: "תצוגה מקדימה של הפוסט",
                                fontSize: 19,
                                fontWeight: FontWeight.w700),
                          )),
                    ),
                  ),
                  /** Share Buttons **/
                  _space(20),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 21),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.white.withOpacity(0.1)),
                            onPressed: () {
                              ref
                                  .read(mainPageIndexProvider.notifier)
                                  .setArcheivePage();
                              Navigator.popUntil(
                                  context, ModalRoute.withName(Routes.main));
                            },
                            child: PrimaryTextTitle(
                              text: "שמירה לגלריה",
                              fontSize: 18,
                              fontWeight: FontWeight.w700,
                            )),
                        const Spacer(),
                        ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.white.withOpacity(0.1)),
                            onPressed: () {
                              OverlayUtils.showBlurOverlay(
                                  context: context, child: SocialSharePage());
                            },
                            child: PrimaryTextTitle(
                              text: "שיתוף",
                              fontSize: 18,
                              fontWeight: FontWeight.w700,
                            ))
                      ],
                    ),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget _space(double height) {
    return SizedBox(
      height: height,
    );
  }
}
