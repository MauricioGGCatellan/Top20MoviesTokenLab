import 'dart:convert';
import 'package:http/http.dart' as http;

class BasicMovieModel {
  int id = 0;
  String title = '';
  String posterUrl = '';

  BasicMovieModel(int id, String title, String posterUrl) {
    this.id = id;
    this.posterUrl = posterUrl;
    this.title = title;
  }
}

class MovieModel extends BasicMovieModel {
  String releaseDate = '';
  String originalLanguage = '';
  double score = -1.0;
  double popularity = 0.0;
  String overview = '';

  MovieModel(int id, String title, String posterUrl, String releaseDate,
      String originalLanguage, double score, double popularity, String overview)
      : super(id, title, posterUrl) {
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
    json['title'],
    json['poster_url'],
    json['release_date'],
    json['original_language'],
    json['vote_average'],
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
      Json['title'],
      Json['poster_url'],
    );
    movieList.add(movie);
  }

  return movieList;
}
