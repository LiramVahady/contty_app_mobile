import 'package:contty_app/controllers/generate_post_controller/generate_post_controller.dart';
import 'package:contty_app/pages/create_post_process/create_post_image/create_image_post_confirmation_page.dart';
import 'package:contty_app/pages/create_post_process/create_post_image/header_post_image.dart';
import 'package:contty_app/utils/show_overlay.dart';
import 'package:contty_app/widgets/background_page.dart';
import 'package:contty_app/widgets/blur_modal_widger.dart';
import 'package:contty_app/widgets/loading_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CreateImagePost extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    double screenWidth = MediaQuery.of(context).size.width;
    int crossAxisCount = 2;
    double crossAxisSpacing = 0.5;
    double totalSpacing = crossAxisSpacing * (crossAxisCount - 1);
    double availableWidth = screenWidth - totalSpacing;
    double itemWidth = availableWidth;
    double itemHeight = itemWidth;
    final generateImageState = ref.watch(genratePostProvider);
    final controller = ref.read(genratePostProvider.notifier);
    return Scaffold(
      body: Stack(
        alignment: Alignment.center,
        children: [
          const Positioned.fill(child: BackgroundPageStyleGradient()),
          const DiviedHeaderWidget(
            title: "בחירת תמונה",
            showBottomDivider: true,
          ),
          Positioned(
              top: MediaQuery.of(context).size.height * 0.2,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset("assets/images/logo/logo.png"),
                  SizedBox(
                      height: MediaQuery.sizeOf(context).height * 0.9,
                      width: MediaQuery.sizeOf(context).width,
                      child: GridView.builder(
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: crossAxisCount, // Number of columns
                            crossAxisSpacing: crossAxisSpacing,
                            mainAxisSpacing: 10.0,
                            childAspectRatio: itemWidth / itemHeight),
                        itemCount: 4, // Set the number of items in the grid
                        itemBuilder: (ctx, index) {
                         // final images = controller;
                          return Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 10),
                            child: GestureDetector(
                              onTap: () {
                                OverlayUtils.showBlurOverlay(
                                    dismissible: false,
                                    context: context,
                                    child:
                                        const CreateImagePostConfirmationPage());
                              },
                              child: SizedBox(
                                  child: Image.asset(
                                      "assets/images/mock/ppMock${index + 1}.png")),
                            ),
                          );
                        },
                      ))
                ],
              )),
          if (generateImageState.isLoading == true)
            AlertDialog(
                backgroundColor: Colors.white.withOpacity(0),
                content: BlurModalWidger(
                  child: Image.asset("assets/images/logo/loading.png"),
                ))
        ],
      ),
    );
  }
}
