import 'package:contty_app/controllers/generate_post_controller/generate_post_controller.dart';
import 'package:contty_app/controllers/home_page/home_page_controller.dart';
import 'package:contty_app/models/service/ideas/generate_idea.dart';
import 'package:contty_app/pages/create_post_process/create_post_page.dart';
import 'package:contty_app/utils/show_overlay.dart';
import 'package:contty_app/widgets/background_page.dart';
import 'package:contty_app/widgets/main_pages_header.dart';
import 'package:contty_app/widgets/primary_text_title.dart';
import 'package:contty_app/widgets/unicorn_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:contty_app/singelton/shared_user.dart';

class HomePage extends ConsumerWidget {
  _popupCreatePostPage(BuildContext context) {
    OverlayUtils.showBlurOverlay(
        context: context, child: CreatePostWizardPage(), dismissible: false);
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(ideasDataProvider);
    return Scaffold(
        backgroundColor: Colors.white.withOpacity(0),
        body: Stack(
          children: [
            //Positioned.fill(child: BackgroundPageStyle()),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                /** Header **/
                children: [
                  MainHeaderWidget(
                    titleText:
                        "היי\n${SharedUser.instance.userInfo?.fullName}👋" ??
                            "היי👋",
                  ),
                  /** Logo **/
                  spacer(30),
                  Image.asset(
                    "assets/images/logo/logo.png",
                    width: 89,
                    height: 95,
                  ),
                  /** Feed **/
                  spacer(40),
                  Align(
                    alignment: Alignment.centerRight,
                    child: Text(
                      "גלו רעיונות חדשים",
                      style: GoogleFonts.ibmPlexSansHebrew(
                          textStyle: const TextStyle(
                              fontSize: 25, fontWeight: FontWeight.w700)),
                    ),
                  ),
                  spacer(30),
                  SizedBox(
                    height: MediaQuery.sizeOf(context).height * 0.35,
                    child: state.isLoading == false
                        ? const Center(
                            child: CircularProgressIndicator(),
                          )
                        : ListView.separated(
                            clipBehavior: Clip.hardEdge,
                            separatorBuilder: (context, index) {
                              return const SizedBox(
                                height: 17,
                              );
                            },
                            itemCount: state.ideasData?.length ?? 0,
                            itemBuilder: (ctx, index) {
                              final idea = state.ideasData?[index];
                              return GestureDetector(
                                onTap: () {
                                  if (idea == null) return;
                                  final selectedIdeaSatate =
                                      ref.read(genratePostProvider.notifier);
                                  selectedIdeaSatate.setSelectedIdea(idea);
                                  _popupCreatePostPage(context);
                                },
                                child: UnicornContainer(
                                    height:
                                        MediaQuery.sizeOf(context).height * 0.1,
                                    strokeWidth: 2,
                                    radius: 15,
                                    gradient: const LinearGradient(colors: [
                                      Color(0xff00A973),
                                      Color(0xffE9B875),
                                      Color(0xffFF00B0)
                                    ]),
                                    child: Card(
                                      color: Colors.white.withAlpha(0),
                                      child: Padding(
                                        padding: const EdgeInsets.symmetric(
                                            vertical: 10),
                                        child: ListTile(
                                          titleAlignment:
                                              ListTileTitleAlignment.center,
                                          leading: CircleAvatar(
                                            backgroundColor:
                                                Colors.white.withOpacity(0.1),
                                            child: Image.asset(
                                                width: 16,
                                                height: 16,
                                                "assets/images/icons/magic_stick.png"),
                                          ),
                                          title: PrimaryTextTitle(
                                            textAlign: TextAlign.right,
                                            text: idea?.title ?? "",
                                            fontSize: 15,
                                            fontWeight: FontWeight.w400,
                                          ),
                                        ),
                                      ),
                                    )),
                              );
                            }),
                  )
                ],
              ),
            ),
          ],
        ));
  }

  SizedBox spacer(double height) {
    return SizedBox(
      height: height,
    );
  }
}

class _ideaWid extends StatelessWidget {
  const _ideaWid({
    super.key,
    required this.idea,
  });

  final GenerateIdea? idea;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Container(
                width: 30,
                height: 30,
                padding: EdgeInsets.all(8),
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.white.withOpacity(0.1)),
                child: Image.asset("assets/images/icons/magic_stick.png")),
            const Spacer(),
            Text(
              idea?.title ?? "",
              style: GoogleFonts.ibmPlexSansHebrew(
                  textStyle: const TextStyle(
                      fontSize: 15, fontWeight: FontWeight.w400)),
            ),
          ],
        ),
      ),
    );
  }
}
