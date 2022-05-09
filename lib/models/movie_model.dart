import 'dart:convert';
import 'package:http/http.dart' as http;

class BasicMovieModel {
  int id = 0;
  double score = -1.0;
  String title = '';

  BasicMovieModel(int id, double score, String title) {
    this.id = id;
    this.score = score;
    this.title = title;
  }
}

class MovieModel extends BasicMovieModel {
  String releaseDate = '';
  String originalLanguage = '';
  double popularity = 0.0;
  String overview = '';

  MovieModel(int id, double score, String title, String releaseDate,
      String originalLanguage, double popularity, String overview)
      : super(id, score, title) {
    this.releaseDate = releaseDate;
    this.originalLanguage = originalLanguage;
    this.popularity = popularity;
    this.overview = overview;
  }
}

Future<MovieModel> fetchMovie(String id) async {
  var url = 'https://desafio-mobile.nyc3.digitaloceanspaces.com/movies';

  var newUrlparse = Uri.parse(url + '/' + id);

  var response = await http.get(newUrlparse);
  var json = jsonDecode(response.body);

  var movie = MovieModel(
    json['id'],
    json['vote_average'],
    json['title'],
    json['release_date'],
    json['original_language'],
    json['popularity'],
    json['overview'],
  );

  return movie;
}

Future<List<BasicMovieModel>> fetchList() async {
  var url =
      Uri.parse('https://desafio-mobile.nyc3.digitaloceanspaces.com/movies');
  var response = await http.get(url);
  var jsonList = jsonDecode(response.body);
  List<BasicMovieModel> movieList = [];

  for (var unJson in jsonList) {
    var Json = unJson;
    var movie = BasicMovieModel(
      Json['id'],
      Json['vote_average'],
      Json['title'],
    );
    movieList.add(movie);
  }

  return movieList;
}
