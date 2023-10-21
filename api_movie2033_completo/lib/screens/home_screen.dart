import 'package:flutter/material.dart';
import 'package:api_movie2033_completo/widgets/widgets.dart';
import 'package:api_movie2033_completo/providers/movies_provider.dart';
import 'package:provider/provider.dart';

// Pantalla principal que muestra las películas en un carrusel y un slider.
class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Obtiene el proveedor de películas del contexto.
    final moviesProvider = Provider.of<MoviesProvider>(context);

    // Devuelve un Scaffold que contiene la interfaz de usuario de la pantalla principal.
    return Scaffold(
      appBar: AppBar(
        elevation: 0, // Sin sombra en la barra de navegación.
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons
                .search_outlined), // Icono de búsqueda en la barra de acciones.
          )
        ],
        title: const Center(
          child: Text(
              'Peliculas de cine'), // Título en el centro de la barra de navegación.
        ),
      ),
      body: Column(
        children: [
          // Carrusel de películas destacadas.
          CardSwiper(
            movies: moviesProvider
                .onDisplayMovies, // Lista de películas destacadas.
          ),
          // Slider de películas populares.
          MovieSlider(
            movies:
                moviesProvider.popularMovies, // Lista de películas populares.
          )
        ],
      ),
    );
  }
}
