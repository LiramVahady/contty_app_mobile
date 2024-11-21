import 'package:contty_app/globals/contants_values.dart';
import 'package:contty_app/models/service/ideas/generate_idea.dart';
import 'package:contty_app/models/service/posts/generate_post.dart';
import 'package:contty_app/service/error_handler.dart';
import 'package:contty_app/service/http_service.dart';
import 'package:contty_app/utils/json_parser.dart';
import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get_it/get_it.dart';

class GeneratePostState {
  final GenerateIdea? selected;
  final GeneratePost? post;
  final String? error;
  final isLoading;

  GeneratePostState(
      {this.selected, this.post, this.error, this.isLoading = true});

  GeneratePostState copyWith(
      {GenerateIdea? selected,
      GeneratePost? post,
      String? error,
      bool? isLoading}) {
    return GeneratePostState(
        selected: selected ?? this.selected,
        post: post ?? this.post,
        error: error,
        isLoading: isLoading ?? this.isLoading);
  }
}

class GeneratePostController extends StateNotifier<GeneratePostState> {
  final GetIt _getIt = GetIt.instance;
  late HttpService _httpService;
  GeneratePostController() : super(GeneratePostState()) {
    _httpService = _getIt<HttpService>();
  }

  void setSelectedIdea(GenerateIdea ideas) {
    state = state.copyWith(selected: ideas);
    loadPost();
  }

  Future<void> loadPost() async {
    if (state.selected == null) return;
    final ideaId = state.selected!.id;
    try {
      final path = HTTPEntPoint.createPost.replaceAll("{id}", ideaId);
      final res = await _httpService.get(path);
      if (res?.data != null) {
        final posts = JsonParser.parseList(
            res!.data as List<GeneratePost>, GeneratePost.fromJson);
        if (posts.isNotEmpty) {
          state = state.copyWith(post: posts.first);
        } else {
          print('load generate posts empty data');
        }
      }
    } catch (e) {
      if (e is DioException) {
        final error = ErrorHandler.handleDioError(e);
        print('load generate posts = $error');
      }
    }
  }

  Future<void> generateImage() async {
    if (state.post == null) return;
    final id = state.post!.id;
    try {
      state = state.copyWith(isLoading: true);
      final path = HTTPEntPoint.createImage.replaceAll("{id}", id);
      final res = await _httpService.get(path);
      state = state.copyWith(isLoading: false);
      if (res?.data != null) {
        print("image gen = ${res!.data}");
      }
    } catch (e) {}
  }
}

final genratePostProvider =
    StateNotifierProvider<GeneratePostController, GeneratePostState>(
  (ref) => GeneratePostController(),
);
