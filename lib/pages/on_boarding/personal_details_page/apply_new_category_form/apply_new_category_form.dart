import 'package:contty_app/provider/buissines_categories_provider.dart';
import 'package:contty_app/widgets/dialog.dart';
import 'package:contty_app/widgets/email_text_field.dart';
import 'package:contty_app/widgets/loading_dialog.dart';
import 'package:contty_app/widgets/primary_button.dart';
import 'package:contty_app/widgets/primary_text_title.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

// Create a StateNotifier for managing a string state
class CategoryStateNotifier extends StateNotifier<String> {
  CategoryStateNotifier() : super('');

  // Example method to update the state
  void setCategory(String category) {
    state = category;
  }
}

// Create a StateNotifier for managing a string state
class CategoryErrorStateNotifier extends StateNotifier<String?> {
  CategoryErrorStateNotifier() : super(null);

  // Example method to update the state
  void setError(String? eror) {
    state = eror;
  }
}

final categoryStateProvider =
    StateNotifierProvider<CategoryStateNotifier, String>(
  (ref) => CategoryStateNotifier(),
);

final categoryErrorProvider =
    StateNotifierProvider<CategoryErrorStateNotifier, String?>(
  (ref) => CategoryErrorStateNotifier(),
);
final errorTextState = StateProvider<String?>((ref) => null);

class ApplyNewCategoryForm extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final controoler = ref.read(categoriesStateProvider.notifier);
    final catetoryConroller = ref.read(categoryStateProvider.notifier);
    final state = ref.watch(categoryStateProvider);
    final errorText = ref.watch(categoryErrorProvider);
    return SizedBox(
      width: MediaQuery.sizeOf(context).width,
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            const SizedBox(
              height: 10,
            ),
            Container(
              width: 75,
              height: 8,
              decoration: const BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                  color: Color(0xff616676)),
            ),
            const SizedBox(
              height: 30,
            ),
            PrimaryTextTitle(
              text: "טופס בקשה להוספת תחום עסק",
              fontSize: 20,
              fontWeight: FontWeight.w700,
              textColor: Colors.white,
            ),
            const SizedBox(
              height: 30,
            ),
            PrimaryTextField(
              onFocusChnage: (value) {
                if (value) return;
                if (state.isEmpty) {
                  ref.read(categoryErrorProvider.notifier).setError("שדה חובה");
                }
              },
              topTitle: "תחום בית העסק",
              errorText: errorText,
              onChange: (value) => {
                catetoryConroller.setCategory(value),
                ref.read(categoryErrorProvider.notifier).setError(null)
              },
            ),
            const SizedBox(
              height: 100,
            ),
            SizedBox(
                height: 64,
                width: MediaQuery.sizeOf(context).width * 0.8,
                child: PrimaryButton(
                    title: "הגש בקשה למערכת",
                    onPress: () async {
                      if (state.isEmpty) {
                        ref
                            .read(categoryErrorProvider.notifier)
                            .setError("שדה חובה");
                        return;
                      }
                      LoadingDialog.show(context);
                      final result =
                          await controoler.sendBCategoryRequest(state);
                      LoadingDialog.hide(context);

                      if (result?.errorMessage != null) {
                        DialogWidget.show(
                            "בקשה נכשלה", result!.errorMessage!, context);
                      } else {
                        Navigator.pop(context);
                        const txt =
                            "בקשתך נקלטה במערכת בהצלחה ,תוכל להתעדכן לגבי בקשתך דרך הגדרות -> הבקשות שליעד אז באפשרותך לבחור תחום עסק דומה";
                        DialogWidget.show("בקשתך התקבלה", txt, context);
                      }
                    }))
          ],
        ),
      ),
    );
  }
}
