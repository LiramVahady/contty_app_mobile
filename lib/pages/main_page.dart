import 'package:contty_app/pages/archeive_page/archeive_page.dart';
import 'package:contty_app/pages/home_page/home_page.dart';
import 'package:contty_app/pages/limit_round_page.dart';
import 'package:contty_app/provider/main_page_index_provider.dart';
import 'package:contty_app/utils/show_overlay.dart';
import 'package:contty_app/widgets/background_page.dart';
import 'package:contty_app/widgets/bottom_navigatio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class MainPage extends ConsumerWidget {
  final List<Widget> _screens = [
    ArcheivePage(),
    HomePage(),
  ];

  _popupCreatePostPage(BuildContext context, WidgetRef ref) {
    OverlayUtils.showBlurOverlay(context: context, child: LimitRoundWidget());
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final screenHeight = MediaQuery.sizeOf(context).height;
    final selectedIndex = ref.watch(mainPageIndexProvider);
    return Scaffold(
      appBar: PreferredSize(
          preferredSize: Size.fromHeight(screenHeight * 0.02),
          child: Container()),
      body: Stack(
        children: [
          // Positioned.fill(child: BackgroundPageStyleGradient()),
          IndexedStack(
            index: selectedIndex,
            children: _screens,
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationWidget(
        currentIndex: selectedIndex,
        onMiddleButtonTap: () {
          _popupCreatePostPage(context, ref);
        },
        onTap: (indexSelected) {
          if (indexSelected == 0) {
            ref.read(mainPageIndexProvider.notifier).setArcheivePage();
          } else if (indexSelected == 1) {
            ref.read(mainPageIndexProvider.notifier).setHomePage();
          }
        },
      ),
    );
  }
}
