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

  List<String> formatting(int pos) {
    List<String> info = [];
    info.add((pos + 1).toString());
    info.add(movieList[pos].score.toString());
    info.add(movieList[pos].title);
    info.add(movieList[pos].id.toString());

    return info;
  }
}
