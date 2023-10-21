import 'dart:convert';

import 'movie.dart';

// Clase que representa la respuesta de la API para las películas populares.
class PopularResponse {
  int page; // Número de la página actual.
  List<Movie> results; // Lista de películas populares.
  int totalPages; // Número total de páginas disponibles.
  int totalResults; // Número total de resultados disponibles.

  // Constructor de la clase PopularResponse.
  PopularResponse({
    required this.page,
    required this.results,
    required this.totalPages,
    required this.totalResults,
  });

  // Método de fábrica para crear una instancia de PopularResponse desde un JSON crudo.
  factory PopularResponse.fromRawJson(String str) =>
      PopularResponse.fromJson(json.decode(str));

  // Método de fábrica para crear una instancia de PopularResponse desde un mapa JSON.
  factory PopularResponse.fromJson(Map<String, dynamic> json) =>
      PopularResponse(
        page: json["page"], // Obtiene el número de página desde el JSON.
        results: List<Movie>.from(json["results"].map((x) =>
            Movie.fromJson(x))), // Convierte los resultados a objetos Movie.
        totalPages: json[
            "total_pages"], // Obtiene el número total de páginas desde el JSON.
        totalResults: json[
            "total_results"], // Obtiene el número total de resultados desde el JSON.
      );
}
