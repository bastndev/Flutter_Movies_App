import 'package:flutter/material.dart';
import 'package:flutter_movie/models/models.dart';
import 'package:flutter_movie/widgets/widgets.dart';

class DetailScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    final Movie movie  = ModalRoute.of(context)!.settings.arguments as Movie;
    print(movie.title );

    return Scaffold(
      body: CustomScrollView( 
        slivers: [
          _CustomAppBar( movie),
          SliverList(
            delegate: SliverChildListDelegate([
              _PosterAndTitle(movie),
              _Overview(movie),
              _Overview(movie),
              _Overview(movie),
              _Overview(movie),
              _Overview(movie),
              const SizedBox(height: 10,),
              CastingCards(movie.id)

            ]),
          )
        ],
      )
    );
  }
}
/* --- --- --- --- --- -- --- CustomAppBar  */
class _CustomAppBar extends StatelessWidget {

  final Movie movie;
  const _CustomAppBar( this.movie);

  @override
  Widget build(BuildContext context) {
    return  SliverAppBar(
      backgroundColor: Colors.teal,
      expandedHeight: 200,
      floating: false,
      pinned: true,
      flexibleSpace: FlexibleSpaceBar(
        centerTitle: true,
        titlePadding: const EdgeInsets.all(0),
        
        //Text And bacnkgound 
        title: Container(
          width: double.infinity,
          alignment: Alignment.bottomCenter,
          padding: const EdgeInsets.only(bottom: 5, left: 10, right: 10),
          color: Colors.black12,
          child: Text(
            movie.title,
            style: const TextStyle(fontSize: 16),
            textAlign: TextAlign.center,
          ),
        ),
        
        background: FadeInImage(
          placeholder: const AssetImage('assets/img/loading.gif'),
          image: NetworkImage(movie.fullBackdropPath),
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}

/* --- --- --- --- --- -- --- Poster Title  */
class _PosterAndTitle extends StatelessWidget {

  final Movie movie;
  const _PosterAndTitle(this.movie);

  @override
  Widget build(BuildContext context) {

    final TextTheme textTheme = Theme.of(context).textTheme;
    final size = MediaQuery.of(context).size;

    return Container(
      margin: const EdgeInsets.only(top: 20),
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        children: [
          Hero(
            tag: movie.id,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child:  FadeInImage(
                placeholder: const AssetImage('assets/img/no-image.jpg'),
                image: NetworkImage( movie.fullPosterImg),
                height: 250,
                // width: 110,
              ),
            ),
          ),

          const SizedBox(width: 20,),

          ConstrainedBox(
            constraints:BoxConstraints(maxWidth: size.width -250),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
          
                Text(movie.title, style:textTheme.headline5,overflow: TextOverflow.ellipsis, maxLines: 2,), 
                Text(movie.originalTitle, style:textTheme.subtitle1,overflow: TextOverflow.ellipsis),
          
                Row(  
                  children:  [
                    const Icon(Icons.star_border, size: 15,color: Colors.amber,),
                    const SizedBox(width: 5),
                    Text('${movie.voteAverage}', style:textTheme.bodySmall),
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

/* --- --- --- --- --- -- --- Poster Title  */
class _Overview extends StatelessWidget {

  final Movie movie;
  const _Overview (this.movie);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
      child:  Text(movie.overview,
      textAlign: TextAlign.justify,
      style: Theme.of(context).textTheme.titleMedium,
      ),
    );
  }
}