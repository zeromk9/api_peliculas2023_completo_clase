import 'dart:convert';

// Clase que representa una película.
class Movie {
  bool adult; // Indica si la película es para adultos.
  String backdropPath; // Ruta del fondo de pantalla de la película.
  List<int> genreIds; // Lista de IDs de géneros asociados con la película.
  int id; // ID único de la película.
  String originalLanguage; // Idioma original de la película.
  String originalTitle; // Título original de la película.
  String overview; // Resumen o descripción de la trama de la película.
  double popularity; // Popularidad de la película.
  String posterPath; // Ruta del póster de la película.
  DateTime releaseDate; // Fecha de lanzamiento de la película.
  String title; // Título de la película.
  bool video; // Indica si la película tiene contenido de video.
  double voteAverage; // Promedio de votos de la película.
  int voteCount; // Número total de votos de la película.

  // Constructor de la clase Movie.
  Movie({
    required this.adult, // Indica si la película es para adultos.
    required this.backdropPath, // Ruta del fondo de pantalla de la película.
    required this.genreIds, // Lista de IDs de géneros asociados con la película.
    required this.id, // ID único de la película.
    required this.originalLanguage, // Idioma original de la película.
    required this.originalTitle, // Título original de la película.
    required this.overview, // Resumen o descripción de la trama de la película.
    required this.popularity, // Popularidad de la película.
    required this.posterPath, // Ruta del póster de la película.
    required this.releaseDate, // Fecha de lanzamiento de la película.
    required this.title, // Título de la película.
    required this.video, // Indica si la película tiene contenido de video.
    required this.voteAverage, // Promedio de votos de la película.
    required this.voteCount, // Número total de votos de la película.
  });

  // Método para obtener la URL completa del póster de la película.
  get fullPosterImg {
    if (posterPath != null) {
      return 'https://image.tmdb.org/t/p/w500$posterPath';
    }
    return 'https://i.stack.imgur.com/GNhxO.png';
  }

  // Método para obtener la URL completa del fondo de pantalla de la película.
  get fullBackdropImg {
    if (backdropPath != null) {
      return 'https://image.tmdb.org/t/p/w500$backdropPath';
    }
    return 'https://i.stack.imgur.com/GNhxO.png';
  }

  // Método de fábrica para crear una instancia de Movie desde un JSON crudo.
  factory Movie.fromRawJson(String str) => Movie.fromJson(json.decode(str));

  // Método de fábrica para crear una instancia de Movie desde un mapa JSON.
  factory Movie.fromJson(Map<String, dynamic> json) => Movie(
        adult: json["adult"], // Obtiene la propiedad 'adult' desde el JSON.
        backdropPath: json[
            "backdrop_path"], // Obtiene la propiedad 'backdrop_path' desde el JSON.
        genreIds: List<int>.from(json["genre_ids"]
            .map((x) => x)), // Obtiene la propiedad 'genre_ids' desde el JSON.
        id: json["id"], // Obtiene la propiedad 'id' desde el JSON.
        originalLanguage: json[
            "original_language"], // Obtiene la propiedad 'original_language' desde el JSON.
        originalTitle: json[
            "original_title"], // Obtiene la propiedad 'original_title' desde el JSON.
        overview:
            json["overview"], // Obtiene la propiedad 'overview' desde el JSON.
        popularity: json["popularity"]
            ?.toDouble(), // Obtiene la propiedad 'popularity' desde el JSON.
        posterPath: json[
            "poster_path"], // Obtiene la propiedad 'poster_path' desde el JSON.
        releaseDate: DateTime.parse(json[
            "release_date"]), // Obtiene la propiedad 'release_date' desde el JSON.
        title: json["title"], // Obtiene la propiedad 'title' desde el JSON.
        video: json["video"], // Obtiene la propiedad 'video' desde el JSON.
        voteAverage: json["vote_average"]
            ?.toDouble(), // Obtiene la propiedad 'vote_average' desde el JSON.
        voteCount: json[
            "vote_count"], // Obtiene la propiedad 'vote_count' desde el JSON.
      );
}
