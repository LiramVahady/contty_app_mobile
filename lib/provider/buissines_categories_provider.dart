import 'package:contty_app/globals/contants_values.dart';
import 'package:contty_app/models/service/categories.dart';
import 'package:contty_app/service/error_handler.dart';
import 'package:contty_app/service/http_response.dart';
import 'package:contty_app/service/http_service.dart';
import 'package:contty_app/utils/json_parser.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get_it/get_it.dart';

class BuissinesCategoriesProvider
    extends StateNotifier<List<BuissinesCategory>> {
  final GetIt _getIt = GetIt.instance;
  late HttpService _httpService;
  late List<BuissinesCategory> _originalCategories;
  BuissinesCategoriesProvider() : super([]) {
    _httpService = _getIt<HttpService>();
    _loadCategories();
  }

  Future<void> _loadCategories() async {
    List<BuissinesCategory> categories = [];
    try {
      state = [];
      final res = await _httpService.get(HTTPEntPoint.buissinesCategories);
      if (res == null) return;

      _originalCategories =
          JsonParser.parseList(res.data, BuissinesCategory.fromJson);
      state = List.from(_originalCategories);
      // return categories;
    } catch (e) {
      print(e);
      return;
    }
  }

  /// Filter categories by a specific condition
  void filterCategories(bool Function(BuissinesCategory category) condition) {
    // Apply the filter and update the state
    state = _originalCategories.where(condition).toList();
  }

  /// Reset the state to the original categories after filtering
  Future<void> resetCategories() async {
    state = List.from(_originalCategories);
  }

  Future<HttpResult?> sendBCategoryRequest(String name) async {
    try {
      final res = await _httpService.post(HTTPEntPoint.buissinesCategories,
          {"name": name, "isAprroved": false});
      if (res == null || res.statusCode == null) {
        return HttpResult(
            errorMessage: "אירעה שגיאה נסה מאוחר יותר",
            data: {},
            isSuccess: false);
      }
      if (res.statusCode! >= 200 || res.statusCode! <= 299) {
        return HttpResult(errorMessage: null, data: "success", isSuccess: true);
      }
    } catch (e) {
      if (e is DioException) {
        final errorMessage = ErrorHandler.handleDioError(e);
        return HttpResult(
            errorMessage: errorMessage, data: {}, isSuccess: false);
      }
      return HttpResult(
          errorMessage: "אירעה שגיאה נסה מאוחר יותר",
          data: {},
          isSuccess: false);
    }
  }
}

final categoriesStateProvider =
    StateNotifierProvider<BuissinesCategoriesProvider, List<BuissinesCategory>>(
        (ref) => BuissinesCategoriesProvider());
