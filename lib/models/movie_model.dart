import 'dart:ffi';
import 'dart:convert';
import 'package:http/http.dart' as http;

class BasicMovieModel {
  int id = -1;
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
  String producers = '';
  String overview = '';

  MovieModel(int id, double score, String title, String releaseDate,
      String producers, String overview)
      : super(id, score, title) {
    this.releaseDate = releaseDate;
    this.producers = producers;
    this.overview = overview;
  }
}

Future<MovieModel> fetchMovie(int id) async {
  var url = 'https://desafio-mobile.nyc3.digitaloceanspaces.com/movies';

  var newUrl = url + '/' + id.toString();

  var response = await http.get(url);
  var json = jsonDecode(response.body);

  var movie = MovieModel(
    json['id'],
    json['vote_average'],
    json['title'],
    json['release_date'],
    json['production_companies']['name'],
    json['overview'],
  );

  return movie;
}

Future<List<BasicMovieModel>> fetchList() async {
  var url = 'https://desafio-mobile.nyc3.digitaloceanspaces.com/movies';
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
