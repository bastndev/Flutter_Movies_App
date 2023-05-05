import 'package:flutter/material.dart';
import 'package:flutter_movie/models/models.dart';

class MoviSlider extends StatelessWidget {

  final List<Movie> movies;
  final String? title;

  const MoviSlider({super.key, required this.movies, this.title});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 250,
      child:  Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [

          if (this.title != null)
        Padding(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child:Text( this.title!, style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),)
            ),

          const SizedBox(height: 11),

          Expanded(
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: movies.length,
              itemBuilder: ( _, int index) => _MoviePoster( movies [index])
            ),
          ),

        ],
      ),
    );
  }
}


class _MoviePoster extends StatelessWidget {

  final Movie movie;
  const _MoviePoster(this.movie);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 130,
      height: 190,
      margin: const EdgeInsets.symmetric(horizontal: 10,),
      child: Column(
        children: [

          GestureDetector(
            onTap: () => Navigator.pushNamed(context, 'details', arguments:'movie-instance'),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child:  FadeInImage(
                placeholder: AssetImage('assets/img/no-image.jpg'),
                image: NetworkImage(movie.fullPosterImg),
                width: 130,
                height: 175,
                fit: BoxFit.cover,
              ),
            ),
          ),

          const SizedBox(height: 5),

          Text(
                movie.title,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                textAlign: TextAlign.center,
          ),
        ]
      ),
    );
  }
}