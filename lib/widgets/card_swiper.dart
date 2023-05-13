import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_movie/models/models.dart';

class CardSwiped extends StatelessWidget {

  final List <Movie> movies;

  const CardSwiped({super.key, required this.movies}); 

  @override
  Widget build(BuildContext context) {

    final size = MediaQuery.of(context).size;


    if(movies.isEmpty ){
      return  Container(
        width: double.infinity,
        height: size.height* 0.5,
        child: const Center(
          child: CircularProgressIndicator(), 
        ),
      );
    }

    return SizedBox(
      width: double.infinity,
      height: size.height * 0.5,
      // color: Colors.red,
      child: Swiper(
        itemCount: movies.length,
        layout: SwiperLayout.STACK,
        itemWidth: size.width * 0.6,
        itemHeight: size.height * 0.4,
        itemBuilder: ( _ , int index) {

          final movie = movies[index];

          return GestureDetector(
            onTap: () => Navigator.pushNamed(context, 'details', arguments:movie),
            child: Hero(
              tag: movie.id,
              child: ClipRRect(
                borderRadius: BorderRadius.circular (20),
                child: FadeInImage(
                  placeholder: const AssetImage('assets/img/no-image.jpg'),
                  image: NetworkImage(movie.fullPosterImg),
                  fit: BoxFit.cover,
                  
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}