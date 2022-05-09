import 'package:flutter/cupertino.dart';

import '../models/movie_model.dart';

enum MovieState { loading, success, error }

class MovieController {
  MovieModel movie = MovieModel(0, '', '', '', '', 0.0, 0.0, '');
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

  Map<String, String> formatting() {
    Map<String, String> info = {};
    info['score'] = movie.score.toString();
    info['title'] = movie.title;
    info['releaseDate'] = movie.releaseDate;
    info['originalLanguage'] = movie.originalLanguage;
    info['popularity'] = movie.popularity.toString();
    info['overview'] = movie.overview;
    info['posterUrl'] = movie.posterUrl;

    return info;
  }
}
