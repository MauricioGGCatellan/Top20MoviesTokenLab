import 'package:flutter/cupertino.dart';

import '../models/movie_model.dart';

enum MovieState { loading, success, error }

class MovieController {
  MovieModel movie = MovieModel(0, 0.0, '', '', '', 0.0, '');
  final state = ValueNotifier<MovieState>(MovieState.loading);

  Future start(String id) async {
    state.value = MovieState.loading;
    try {
      movie = await fetchMovie(id);
      state.value = MovieState.success;
    } catch (e) {
      state.value = MovieState.error;
    }
  }

  List<String> formatting() {
    List<String> info = [];
    info.add(movie.score.toString());
    info.add(movie.title);
    info.add(movie.releaseDate);
    info.add(movie.originalLanguage);
    info.add(movie.popularity.toString());
    info.add(movie.overview);

    return info;
  }
}
