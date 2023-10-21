import 'package:flutter/material.dart';
import 'package:api_movie2033_completo/widgets/actor_slider.dart';
import 'package:api_movie2033_completo/models/movie.dart';

// Pantalla de detalles de la película.
class DetailsScreen extends StatelessWidget {
  const DetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Obtiene la película pasada como argumento desde la ruta de navegación.
    final Movie movie = ModalRoute.of(context)?.settings.arguments as Movie;

    // Devuelve un Scaffold que contiene la interfaz de usuario de la pantalla de detalles.
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          // Appbar personalizado que muestra el título de la película y una imagen de fondo.
          _CustomAppbar(
            movie: movie,
          ),
          // Lista deslizante de elementos que incluye el póster, detalles y actores de la película.
          SliverList(
            delegate: SliverChildListDelegate.fixed(
              [
                // Póster y título de la película.
                _PosterAndTitle(movie: movie),
                // Resumen de la película.
                const _Overview(),
                // Carrusel de actores de la película.
                const ActorSlider()
              ],
            ),
          ),
        ],
      ),
    );
  }
}

// Appbar personalizado que muestra el título de la película y una imagen de fondo.
class _CustomAppbar extends StatelessWidget {
  final Movie movie;

  const _CustomAppbar({required this.movie});

  @override
  Widget build(BuildContext context) {
    // Appbar deslizable con una imagen de fondo y el título de la película.
    return SliverAppBar(
      backgroundColor: Colors.indigoAccent, // Color de fondo de la appbar.
      expandedHeight: 200, // Altura máxima que puede alcanzar al expandirse.
      floating:
          false, // No se mantiene en la parte superior durante el desplazamiento.
      pinned: true, // Se mantiene visible al deslizar hacia arriba.
      flexibleSpace: FlexibleSpaceBar(
        centerTitle: true, // Centra el título en la appbar.
        titlePadding: const EdgeInsets.all(0), // Padding del título.
        title: Container(
          width: double.infinity,
          alignment: Alignment.bottomCenter,
          color: Colors.black12, // Fondo semi transparente detrás del título.
          child: Text(
            movie.title, // Título de la película.
            style: const TextStyle(fontSize: 18),
          ),
        ),
        background: FadeInImage(
          placeholder: const AssetImage(
              'assets/no-image.jpg'), // Imagen de carga antes de cargar la real.
          image: NetworkImage(
              movie.fullBackdropImg), // Imagen de fondo desde la red.
        ),
      ),
    );
  }
}

// Widget que muestra el póster y el título de la película.
class _PosterAndTitle extends StatelessWidget {
  final Movie movie;

  const _PosterAndTitle({required this.movie});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 20), // Margen superior del contenedor.
      padding: const EdgeInsets.symmetric(
          horizontal: 20), // Padding horizontal del contenedor.
      child: Row(
        children: [
          // Póster de la película.
          ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: FadeInImage(
              placeholder: const AssetImage(
                  'assets/no-image.jpg'), // Imagen de carga antes de cargar la real.
              image: NetworkImage(
                  movie.fullPosterImg), // Imagen real del póster desde la red.
              height: 200,
            ),
          ),
          const SizedBox(
              width: 20), // Espacio horizontal entre el póster y el título.
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment
                  .start, // Alineación del texto a la izquierda.
              children: [
                // Título de la película.
                Text(
                  movie.title,
                  style: const TextStyle(fontSize: 30),
                  overflow: TextOverflow.ellipsis,
                  maxLines: 2,
                ),
                // Título original de la película.
                Text(
                  movie.originalTitle,
                  style: const TextStyle(fontSize: 15),
                  textAlign: TextAlign.center,
                  overflow: TextOverflow.ellipsis,
                  maxLines: 2,
                ),
                // Puntuación de la película.
                Row(
                  children: [
                    const Icon(
                      Icons.star_outline,
                      size: 20,
                      color: Colors.blueAccent,
                    ),
                    const SizedBox(width: 5),
                    Text(
                      movie.voteAverage.toString(),
                      style: const TextStyle(fontSize: 10),
                      overflow: TextOverflow.ellipsis,
                      maxLines: 2,
                    )
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}

// Widget que muestra el resumen de la película.
class _Overview extends StatelessWidget {
  const _Overview();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: const Text(
        'Description of Movie',
        textAlign: TextAlign.justify,
        style: TextStyle(fontSize: 15),
      ), // Texto de resumen de la película.
    );
  }
}
