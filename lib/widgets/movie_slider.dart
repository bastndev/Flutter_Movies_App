import 'package:flutter/material.dart';
import 'package:flutter_movie/models/models.dart';
import 'package:provider/provider.dart';

class MoviSlider extends StatefulWidget {

  final List<Movie> movies;
  final String? title;
  final Function onNextPage;

  const MoviSlider({super.key, required this.movies, this.title, required this.onNextPage});

  @override
  State<MoviSlider> createState() => _MoviSliderState();
}

class _MoviSliderState extends State<MoviSlider> {

  final ScrollController scrollController = new ScrollController();

  @override
  void initState(){
    super.initState();

    scrollController.addListener((){

      if (scrollController.position.pixels >= scrollController.position.maxScrollExtent -500){
        widget.onNextPage();
      }

    });
  }

    @override
  void dispose(){
    super.dispose();
    
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 250,
      child:  Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [

          if (widget.title != null)
        Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child:Text( widget.title!, style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),)
            ),

          const SizedBox(height: 11),

          Expanded(
            child: ListView.builder(
              controller: scrollController,
              scrollDirection: Axis.horizontal,
              itemCount: widget.movies.length,
              itemBuilder: ( _, int index) => _MoviePoster( widget.movies [index])
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
                placeholder: const AssetImage('assets/img/no-image.jpg'),
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