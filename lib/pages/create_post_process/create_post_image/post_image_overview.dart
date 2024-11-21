import 'package:contty_app/pages/create_post_process/create_post_image/header_post_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class PostImageOverview extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // TODO: implement build
    return Scaffold(
      body: Stack(
        children: [
          DiviedHeaderWidget(
            showBottomDivider: false,
            title: "סקירת פוסט",
          )
        ],
      ),
    );
  }
}
