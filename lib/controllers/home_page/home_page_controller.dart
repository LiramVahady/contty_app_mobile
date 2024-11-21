import 'package:contty_app/globals/contants_values.dart';
import 'package:contty_app/models/service/ideas/generate_idea.dart';
import 'package:contty_app/service/error_handler.dart';
import 'package:contty_app/service/http_service.dart';
import 'package:contty_app/utils/json_parser.dart';
import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get_it/get_it.dart';

class GenerateIdeasState {
  final List<GenerateIdea>? ideasData;
  final String? error;
  final bool? isLoading;

  GenerateIdeasState({this.ideasData, this.error, this.isLoading = true});

  GenerateIdeasState copyWith(
      List<GenerateIdea>? ideasData, String? error, bool? isLoadin) {
    return GenerateIdeasState(
      ideasData: ideasData ?? this.ideasData,
      error: error ?? this.error,
      isLoading: isLoading ?? this.isLoading,
    );
  }
}

class HomePageController extends StateNotifier<GenerateIdeasState> {
  final GetIt _getIt = GetIt.instance;
  late HttpService _httpService;

  HomePageController() : super(GenerateIdeasState()) {
    _httpService = _getIt.get<HttpService>();
    _loadData();
  }

  Future<void> _loadData() async {
    try {
      final ideas = HTTPEntPoint.ideas;
      final response = await _httpService.get(ideas);
      final List<GenerateIdea> ideasData = JsonParser.parseList(
          response?.data as List<dynamic>, GenerateIdea.fromJson);
      if (response?.data != null)
        state = state.copyWith(ideasData, null, false);
    } catch (e) {
      if (e is DioException) {
        final error = ErrorHandler.handleDioError(e);
        state = state.copyWith(null, error, true);
      }
    }
  }
}

final ideasDataProvider =
    StateNotifierProvider<HomePageController, GenerateIdeasState>(
  (ref) => HomePageController(),
);
