import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:fl_peliculas/models/models.dart';

class MoviesProvider extends ChangeNotifier {
  //https://api.themoviedb.org/3/movie/now_playing?api_key=f13f15ad46ff8743695b6f4ab37a82c7&language=es-ES&page=1

  String _apiKey = 'f13f15ad46ff8743695b6f4ab37a82c7';
  String _baseUrl = 'api.themoviedb.org';
  String _languaje = 'es-ES';

  List<Result> onDisplayMovies = [];
  List<Result> favoritasMovies = [];

  MoviesProvider() {
    print('MoviesProvider inicializado');

    this.getOnDisplayMovies();
    this.getFavoriteMovies();
  }

  getOnDisplayMovies() async {
    var url = Uri.https(_baseUrl, '/3/movie/now_playing',
        {'api_key': _apiKey, 'language': _languaje, 'page': '1'});
    var response =
        await http.post(url, body: {'name': 'doodle', 'color': 'blue'});

    final nowPlayingResponse = NowPlayingResponse.fromJson(response.body);

    onDisplayMovies = nowPlayingResponse.results;

    notifyListeners();
  }

  getFavoriteMovies() async {
    var url = Uri.https(_baseUrl, '/3/movie/popular',
        {'api_key': _apiKey, 'language': _languaje, 'page': '1'});
    var response =
        await http.post(url, body: {'name': 'doodle', 'color': 'blue'});

    final favoritasResponse = FavoritasResponse.fromJson(response.body);

    favoritasMovies = [...favoritasMovies, ...favoritasResponse.results];

    notifyListeners();
  }
}
