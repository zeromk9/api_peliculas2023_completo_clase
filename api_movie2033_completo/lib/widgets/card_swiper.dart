import 'package:api_movie2033_completo/models/movie.dart';
import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';
import 'package:api_movie2033_completo/models/models.dart';

class CardSwiper extends StatelessWidget {
  final List<Movie> movies;
  const CardSwiper({super.key, required this.movies});

  @override
  Widget build(BuildContext context) {
    final size =
        MediaQuery.of(context).size; //tamanionde  pantalla de dispositio
    return SizedBox(
      width: double.infinity, //este agarra el ancho de la pantalla
      height: size.height * 0.5,
      child: Swiper(
        itemCount: movies.length,
        layout: SwiperLayout.STACK, //foma en que se comporta el swiper al pasar
        itemWidth: size.width * 0.6,
        itemHeight: size.height * 0.4, //40 porciento del tamanio
        itemBuilder: (_, int index) {
          final movie = movies[index];
          //print(movie.posterPath);
          //print(movie.fullPosterImg);
          return GestureDetector(
            onTap: () =>
                Navigator.pushNamed(context, 'details', arguments: movie),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: FadeInImage(
                placeholder: const AssetImage('assets/no-image.jpg'),
                image: NetworkImage(movie.fullPosterImg),
              ),
            ),
          ); //saber que se hace con el tactil con el dedo
        }, //identificaar en qe elemento de tarjetas esta
      ),
    );
  }
}
