import 'package:flutter/material.dart';
import '../models/movie.dart';

// Este widget representa un carrusel de películas.
class MovieSlider extends StatelessWidget {
  final List<Movie> movies; // Lista de películas a mostrar en el carrusel.
  final String? title; // Título opcional para el carrusel.

  // Constructor del widget MovieSlider.
  const MovieSlider({super.key, required this.movies, this.title});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context)
        .size; // Obtiene el tamaño de la pantalla del dispositivo.

    // Devuelve un contenedor que contiene un carrusel de películas.
    return Container(
      width: double
          .infinity, // El ancho del contenedor ocupa todo el espacio disponible.
      height: size.height *
          0.35, // La altura del contenedor es el 35% de la altura de la pantalla.
      color: Colors.red, // El fondo del contenedor es rojo.
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Título del carrusel.
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Text(
              'Populares', // Título predeterminado si no se proporciona un título personalizado.
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          // Lista horizontal de pósters de películas.
          Expanded(
            child: ListView.builder(
              scrollDirection:
                  Axis.horizontal, // La lista se desplaza horizontalmente.
              itemCount: movies
                  .length, // Número de elementos en la lista, que es la cantidad de películas.
              itemBuilder: (_, int index) => _MoviePoster(movie: movies[index]),
            ),
          )
        ],
      ),
    );
  }
}

// Este widget representa un póster de película individual en el carrusel.
class _MoviePoster extends StatelessWidget {
  final Movie movie; // Película asociada al póster.

  // Constructor del widget _MoviePoster.
  const _MoviePoster({required this.movie});

  @override
  Widget build(BuildContext context) {
    // Devuelve un contenedor que contiene un póster de película y su título.
    return Container(
      width: 130, // Ancho fijo del póster.
      height: 210, // Altura fija del póster.
      margin: const EdgeInsets.symmetric(
          horizontal: 10), // Margen horizontal del contenedor.
      child: Column(
        children: [
          // Imagen de la película con la posibilidad de navegar a los detalles al hacer clic.
          GestureDetector(
            onTap: () =>
                Navigator.pushNamed(context, 'details', arguments: movie),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: FadeInImage(
                placeholder: const AssetImage(
                    'assets/no-image.jpg'), // Imagen de carga antes de que se cargue la real.
                image: NetworkImage(movie
                    .fullPosterImg), // Imagen real de la película desde la red.
                width: 130,
                height: 165,
              ),
            ),
          ),
          const SizedBox(
              height:
                  5), // Espacio vertical entre la imagen y el texto del título.
          // Título de la película con máximo de 2 líneas y puntos suspensivos si es demasiado largo.
          Text(
            movie.title,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            textAlign: TextAlign.center, // Alineación centrada del texto.
          )
        ],
      ),
    );
  }
}
