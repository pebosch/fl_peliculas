import 'package:card_swiper/card_swiper.dart';
import 'package:fl_peliculas/models/now_playing_response.dart';
import 'package:flutter/material.dart';

class CardSwiper extends StatelessWidget {
  const CardSwiper({super.key, required this.movies});

  final List<Result> movies;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Container(
      width: double.infinity,
      height: size.height * 0.5,
      padding: const EdgeInsets.all(30),
      child: Swiper(
        itemCount: movies.length,
        layout: SwiperLayout.STACK,
        itemWidth: size.width * 0.6,
        itemHeight: size.height * 0.9,
        itemBuilder: (context, index) {
          final movie = movies[index];
          print(movie.posterPath);

          return GestureDetector(
            onTap: () => Navigator.pushNamed(context, 'details',
                arguments: 'movie-instance'),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(40),
              child: FadeInImage(
                placeholder: AssetImage('assets/no-image.jpg'),
                image: NetworkImage(movie.fullPosterImg),
                fit: BoxFit.cover,
              ),
            ),
          );
        },
      ),
    );
  }
}
