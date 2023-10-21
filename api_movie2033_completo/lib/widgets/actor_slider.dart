import 'package:flutter/material.dart';

// Este widget representa un carrusel de actores.
class ActorSlider extends StatelessWidget {
  const ActorSlider({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context)
        .size; // Obtiene el tamaño de la pantalla del dispositivo.

    // Devuelve un contenedor que contiene un carrusel de actores.
    return Container(
      width: double
          .infinity, // El ancho del contenedor ocupa todo el espacio disponible.
      height: size.height *
          0.30, // La altura del contenedor es el 30% de la altura de la pantalla.
      color: Colors.blue, // El fondo del contenedor es azul.
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        // Título del carrusel.
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: Text(
            'Actores', // Título del carrusel.
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        // Lista horizontal de pósters de actores (20 elementos ficticios en este caso).
        Expanded(
          child: ListView.builder(
            scrollDirection:
                Axis.horizontal, // La lista se desplaza horizontalmente.
            itemCount:
                20, // Número de elementos en la lista (actores ficticios).
            itemBuilder: (_, int index) =>
                const _ActorPoster(), // Constructor de póster de actor.
          ),
        ),
      ]),
    );
  }
}

// Este widget representa un póster de actor individual en el carrusel de actores.
class _ActorPoster extends StatelessWidget {
  const _ActorPoster();

  @override
  Widget build(BuildContext context) {
    // Devuelve un contenedor que contiene un póster de actor y el nombre del actor.
    return Container(
      width: 130, // Ancho fijo del póster de actor.
      height: 210, // Altura fija del póster de actor.
      margin: const EdgeInsets.symmetric(
          horizontal: 10), // Margen horizontal del contenedor.
      child: Column(children: [
        // Imagen del actor con la posibilidad de navegar a los detalles al hacer clic.
        GestureDetector(
          onTap: () => Navigator.pushNamed(context, 'details', arguments: ''),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: const FadeInImage(
              placeholder: AssetImage(
                  'assets/no-image.jpg'), // Imagen de carga antes de que se cargue la real.
              image: AssetImage(
                  'assets/no-image.jpg'), // Imagen ficticia del actor.
              width: 130,
              height: 120,
            ),
          ),
        ),
        const SizedBox(
            height:
                5), // Espacio vertical entre la imagen y el nombre del actor.
        const Text(
          'MOVIE', // Nombre del actor (ficticio en este caso).
          maxLines: 3,
          overflow: TextOverflow.ellipsis,
          textAlign: TextAlign.center, // Alineación centrada del texto.
        ),
      ]),
    );
  }
}
