import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:api_movie2033_completo/models/movie.dart';
import 'package:api_movie2033_completo/models/now_playing_response.dart';
import 'package:api_movie2033_completo/models/popular_response.dart';

// Clase que proporciona la lógica de negocio para las películas.
class MoviesProvider extends ChangeNotifier {
  final String _baseUrl = 'api.themoviedb.org';
  final String _apiKey = '9dc27117b000e7e5acfb365fa957971a';
  final String _language = 'es-MX';

  // Listas de películas en pantalla y películas populares.
  List<Movie> onDisplayMovies = [];
  List<Movie> popularMovies = [];

  // Constructor de la clase que obtiene las películas en pantalla y las populares.
  MoviesProvider() {
    getOnDisplayMovies();
    getPopularMovies();
  }

  // Método para obtener las películas en pantalla.
  Future<void> getOnDisplayMovies() async {
    var url = Uri.https(_baseUrl, '3/movie/now_playing',
        {'api_key': _apiKey, 'language': _language, 'page': '1'});

    final response = await http.get(url);

    final nowPlayingResponse = NowPlayingResponse.fromRawJson(response.body);
    onDisplayMovies = nowPlayingResponse.results;

    notifyListeners();
  }

  // Método para obtener las películas populares.
  Future<void> getPopularMovies() async {
    var url = Uri.https(_baseUrl, '3/movie/popular',
        {'api_key': _apiKey, 'language': _language, 'page': '1'});

    final response = await http.get(url);

    final popularResponse = PopularResponse.fromRawJson(response.body);

    // Combina las películas actuales con las nuevas películas obtenidas.
    popularMovies = [...popularMovies, ...popularResponse.results];

    notifyListeners();
  }
}
