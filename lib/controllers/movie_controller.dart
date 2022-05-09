import '../models/movie_model.dart';

class MovieController {
  MovieModel movie = MovieModel(0, 0.0, '', '', '', 0, '');

  MovieController(int id) {
    movie = fetchMovie(id) as MovieModel;
  }

  List<String> formatting() {
    List<String> info = [];
    info.add(movie.score.toString());
    info.add(movie.title);
    info.add(movie.releaseDate);
    info.add(movie.producers);
    info.add(movie.popularity.toString());
    info.add(movie.overview);

    return info;
  }
}
