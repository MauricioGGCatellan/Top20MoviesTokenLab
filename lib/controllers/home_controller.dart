import 'package:flutter/cupertino.dart';

import '../models/movie_model.dart';

enum HomeState { loading, success, error }

class HomeController {
  List<BasicMovieModel> movieList = [];
  final state = ValueNotifier<HomeState>(HomeState.loading);

  Future start() async {
    state.value = HomeState.loading;
    try {
      movieList = await fetchList();
      state.value = HomeState.success;
    } catch (e) {
      state.value = HomeState.error;
    }
  }

  Map<String, String> formatting(int pos) {
    Map<String, String> info = {};

    info['ranking'] = (pos + 1).toString();
    info['posterUrl'] = movieList[pos].posterUrl;
    info['title'] = movieList[pos].title;
    info['id'] = movieList[pos].id.toString();

    return info;
  }
}
