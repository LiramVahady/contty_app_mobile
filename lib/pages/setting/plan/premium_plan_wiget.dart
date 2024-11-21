import 'package:contty_app/widgets/dismiss_button_widget.dart';
import 'package:contty_app/widgets/primary_text_title.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class PremiumPlanWiget extends ConsumerWidget {
  final int numberOfPlanOptions = 2;
//mock data
  final planDetailsData = [
    "יצירת סרטונים ללא הגבלה",
    "יצירת פוסטים ללא הגבלה",
    "יצירת פוסטים ללא הגבלה",
    "יצירת פוסטים ללא הגבלה"
  ];

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // TODO: implement build
    return Scaffold(
      //backgroundColor: Colors.black,

      body: Stack(
        alignment: Alignment.center,
        clipBehavior: Clip.none,
        children: [
          /** Background **/
          Positioned.fill(child: BackgroundPlanWidgetStyle()),
          Positioned(
            top: 50,
            right: 10,
            child: Align(
              alignment: Alignment.topLeft,
              child: DismissButtonWidget(),
            ),
          ),
          /** Body **/
          Positioned(
              top: MediaQuery.sizeOf(context).height * 0.35,
              //   bottom: 0,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  /** Title and Logo **/
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 21),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Image.asset(
                            width: 28,
                            height: 28,
                            "assets/images/logo/logo.png"),
                        PrimaryTextTitle(
                            text: "CONTTY Pro",
                            fontSize: 28,
                            fontWeight: FontWeight.w600),
                      ],
                    ),
                  ),
                  /** Plan Details **/
                  _space(45),
                  _planDetailsWidget(),
                  _space(45),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      // ListTile(
                      //   leading: Container(
                      //     width: 35,
                      //     height: 35,
                      //     decoration: BoxDecoration(
                      //         shape: BoxShape.circle,
                      //         border: Border.all(
                      //           color: Color(0xFF7B7B80),
                      //         )),
                      //   ),
                      //   title: PrimaryTextTitle(
                      //       textColor: Color(0xFF7B7B80),
                      //       text: "₪ 27.90 / לחודש",
                      //       fontSize: 16,
                      //       fontWeight: FontWeight.w500),
                      //   trailing: PrimaryTextTitle(
                      //       text: "מנוי חודשי",
                      //       fontSize: 19,
                      //       fontWeight: FontWeight.w800),
                      // ),
                      // ListTile(
                      //   leading: Container(
                      //     width: 35,
                      //     height: 35,
                      //     decoration: BoxDecoration(
                      //         shape: BoxShape.circle,
                      //         border: Border.all(
                      //           color: Color(0xFF7B7B80),
                      //         )),
                      //   ),
                      //   title: PrimaryTextTitle(
                      //       textColor: Color(0xFF7B7B80),
                      //       text: "₪ 27.90 / לחודש",
                      //       fontSize: 16,
                      //       fontWeight: FontWeight.w500),
                      //   trailing: PrimaryTextTitle(
                      //       text: "מנוי חודשי",
                      //       fontSize: 19,
                      //       fontWeight: FontWeight.w800),
                      // ),
                      _space(40),
                      // SizedBox(
                      //   width: MediaQuery.sizeOf(context).width * 0.8,
                      //   height: 55,
                      //   child: ElevatedButton(
                      //       style: ElevatedButton.styleFrom(
                      //           backgroundColor: const Color(0xFF56919D)),
                      //       onPressed: () {},
                      //       child: PrimaryTextTitle(
                      //           text: "רכישת מנוי",
                      //           fontSize: 24,
                      //           fontWeight: FontWeight.w500)),
                      // ),
                      // _space(10),
                      // PrimaryTextTitle(
                      //     textColor: Color(0xff7B7B80),
                      //     text:
                      //         "לחיצה על המשך תגרום לכך שאמצעי התשלום שלך יחויב\n  כאשר אתה מהווה הסכמה לתנאים שלנו",
                      //     fontSize: 12,
                      //     fontWeight: FontWeight.w500)
                    ],
                  ),
                ],
              ))
        ],
      ),
    );
  }

  Stack _planDetailsWidget() {
    return Stack(
      alignment: Alignment.center,
      clipBehavior: Clip.none,
      children: [
        Container(
            padding: const EdgeInsets.only(right: 20),
            margin: EdgeInsets.symmetric(horizontal: 50),
            constraints: const BoxConstraints(minWidth: 300, minHeight: 160),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                border: Border.all(color: Colors.white, width: 1)),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.end,
              mainAxisSize: MainAxisSize.min,
              children: planDetailsData.map((item) {
                return Padding(
                  padding: const EdgeInsets.only(top: 9),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    //  mainAxisSize: MainAxisSize.min,
                    children: [
                      // Add your row children here, for example:
                      PrimaryTextTitle(
                        text: item.toString(),
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                      ),
                      const SizedBox(
                        width: 15,
                      ),
                      Image.asset(
                        "assets/images/icons/check.png",
                        width: 17,
                        height: 17,
                      )
                    ],
                  ),
                );
              }).toList(),
            )),
        Positioned(
            top: -15,
            child: ClipRRect(
              clipBehavior: Clip.none,
              child: Container(
                  decoration: BoxDecoration(
                      color: const Color(0xff56919D),
                      borderRadius: BorderRadius.circular(25)),
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                  child: const FittedBox(child: Text("מה כלול במנוי"))),
            ))
      ],
    );
  }

  SizedBox _space(double h) {
    return SizedBox(
      height: h,
    );
  }
}

class BackgroundPlanWidgetStyle extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Stack(
      children: [
        Positioned(child: Image.asset("assets/images/plan_bg.png")),

        Positioned(
          left: 0,
          top: 207,
          child: Container(
            width: MediaQuery.sizeOf(context).width,
            height: 744,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment(0.0, -1),
                end: Alignment(0.1, 0.9),
                colors: [
                  Colors.black.withOpacity(0),
                  Colors.black.withOpacity(0.25),
                  Colors.black.withOpacity(1),
                  Colors.black,
                  Colors.black,
                  Colors.black,
                ],
              ),
            ),
          ),
        ),

        // Positioned(
        //     // top: 100,
        //     child: ShaderMask(
        //   shaderCallback: (bounds) => const LinearGradient(
        //       colors: [Colors.transparent, Colors.black],
        //       begin: Alignment.topRight,
        //       stops: [0.9, 1]).createShader(bounds),
        //   child: Container(
        //     decoration: BoxDecoration(color: Colors.black, boxShadow: []),
        //   ),
        // ))
      ],
    );
  }
}
