import '../models/movie_model.dart';

class HomeController {
  List<BasicMovieModel> movieList = [];

  HomeController() {
    movieList = fetchList() as List<BasicMovieModel>;
  }

  List<String> formatting(int pos) {
    List<String> info = [];
    info.add(pos.toString());
    info.add(movieList[pos - 1].score.toString());
    info.add(movieList[pos - 1].title);
    info.add(movieList[pos - 1].id.toString());

    return info;
  }
}
