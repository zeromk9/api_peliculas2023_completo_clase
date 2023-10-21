import 'dart:convert';
import 'package:api_movie2033_completo/models/models.dart';
import 'package:api_movie2033_completo/models/movie.dart';

// Clase que representa la respuesta de la API para las películas en pantalla actualmente.
class NowPlayingResponse {
  Dates dates; // Rango de fechas de las películas.
  int page; // Número de la página actual.
  List<Movie> results; // Lista de películas en pantalla actualmente.
  int totalPages; // Número total de páginas disponibles.
  int totalResults; // Número total de resultados disponibles.

  // Constructor de la clase NowPlayingResponse.
  NowPlayingResponse({
    required this.dates, // Rango de fechas de las películas.
    required this.page, // Número de la página actual.
    required this.results, // Lista de películas en pantalla actualmente.
    required this.totalPages, // Número total de páginas disponibles.
    required this.totalResults, // Número total de resultados disponibles.
  });

  // Método de fábrica para crear una instancia de NowPlayingResponse desde un JSON crudo.
  factory NowPlayingResponse.fromRawJson(String str) =>
      NowPlayingResponse.fromJson(json.decode(str));

  // Método de fábrica para crear una instancia de NowPlayingResponse desde un mapa JSON.
  factory NowPlayingResponse.fromJson(Map<String, dynamic> json) =>
      NowPlayingResponse(
        dates: Dates.fromJson(json[
            "dates"]), // Convierte el objeto 'dates' del JSON a un objeto Dates.
        page: json["page"], // Obtiene el número de página desde el JSON.
        results: List<Movie>.from(json["results"].map((x) =>
            Movie.fromJson(x))), // Convierte los resultados a objetos Movie.
        totalPages: json[
            "total_pages"], // Obtiene el número total de páginas desde el JSON.
        totalResults: json[
            "total_results"], // Obtiene el número total de resultados desde el JSON.
      );
}

// Clase que representa el rango de fechas de las películas.
class Dates {
  DateTime maximum; // Fecha máxima del rango.
  DateTime minimum; // Fecha mínima del rango.

  // Constructor de la clase Dates.
  Dates({
    required this.maximum, // Fecha máxima del rango.
    required this.minimum, // Fecha mínima del rango.
  });

  // Método de fábrica para crear una instancia de Dates desde un JSON crudo.
  factory Dates.fromRawJson(String str) => Dates.fromJson(json.decode(str));

  // Método para convertir el objeto Dates a JSON.
  String toRawJson() => json.encode(toJson());

  // Método de fábrica para crear una instancia de Dates desde un mapa JSON.
  factory Dates.fromJson(Map<String, dynamic> json) => Dates(
        maximum: DateTime.parse(json[
            "maximum"]), // Convierte la fecha máxima del JSON a un objeto DateTime.
        minimum: DateTime.parse(json[
            "minimum"]), // Convierte la fecha mínima del JSON a un objeto DateTime.
      );

  // Método para convertir el objeto Dates a JSON.
  Map<String, dynamic> toJson() => {
        "maximum":
            "${maximum.year.toString().padLeft(4, '0')}-${maximum.month.toString().padLeft(2, '0')}-${maximum.day.toString().padLeft(2, '0')}",
        "minimum":
            "${minimum.year.toString().padLeft(4, '0')}-${minimum.month.toString().padLeft(2, '0')}-${minimum.day.toString().padLeft(2, '0')}",
      };
}
