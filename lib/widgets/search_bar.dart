import 'package:contty_app/provider/buissines_categories_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:keyboard_dismisser/keyboard_dismisser.dart';

class PrimarySearchBar extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // TODO: implement build
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 40),
      child: KeyboardDismisser(
        gestures: [GestureType.onTap, GestureType.onPanUpdateDownDirection],
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 0),
          height: 39,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: const Color(0xff1E2127),
          ),
          child: Center(
            child: TextField(
                onChanged: (value) {
                  if (value.isEmpty) {
                    ref
                        .read(categoriesStateProvider.notifier)
                        .resetCategories();
                  } else {
                    ref.read(categoriesStateProvider.notifier).filterCategories(
                          (category) => category.name.contains(value),
                        );
                  }
                },
                textAlign: TextAlign.right,
                decoration: InputDecoration(
                  suffixIcon: Image.asset("assets/images/icons/search.png"),
                  border: InputBorder.none,
                  fillColor: Colors.white,
                  // contentPadding: EdgeInsets.symmetric(horizontal: 20)),
                )),
          ),
        ),
      ),
    );
  }
}
