import 'package:flutter/material.dart';
import 'package:flutter_movie/widgets/widgets.dart';

class DetailScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    // TODO: Cambiar Luego por una instancia
    final String movie  = ModalRoute.of(context)?.settings.arguments.toString() ?? 'NO_Movie';

    return Scaffold(
      body: CustomScrollView(
        slivers: [
          _CustomAppBar(),
          SliverList(
            delegate: SliverChildListDelegate([
              _PosterAndTitle(),
              _Overview(),
              _Overview(),
              _Overview(),
              _Overview(),
              _Overview(),
              const SizedBox(height: 10,),
              CastingCards()

            ]),
          )
        ],
      )
    );
  }
}
/* --- --- --- --- --- -- --- CustomAppBar  */
class _CustomAppBar extends StatelessWidget {

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
          padding: const EdgeInsets.only(bottom: 5),
          color: Colors.black12,
          child: const Text(
            'movies.title',
            style: TextStyle(fontSize: 16),
          ),
        ),

        background: const FadeInImage(
          placeholder: AssetImage('assets/img/loading.gif'),
          image: NetworkImage('https://via.placeholder.com/500x300'),
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}

/* --- --- --- --- --- -- --- Poster Title  */
class _PosterAndTitle extends StatelessWidget {


  @override
  Widget build(BuildContext context) {

    final TextTheme textTheme = Theme.of(context).textTheme;

    return Container(
      margin: const EdgeInsets.only(top: 20),
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child:const  FadeInImage(
              placeholder: AssetImage('assets/img/no-image.jpg'),
              image: NetworkImage('https://via.placeholder.com/200x300'),
              height: 250,
            ),
          ),

          const SizedBox(width: 20,),

          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Movie.Title', style:textTheme.headline5,overflow: TextOverflow.ellipsis, maxLines: 2,),
              Text('Movie.originalTitle', style:textTheme.subtitle1,overflow: TextOverflow.ellipsis),

              Row(  
                children:  [
                  const Icon(Icons.star_border, size: 15,color: Colors.amber,),
                  const SizedBox(width: 5),
                  Text('Movie.VoteAverage', style:textTheme.bodySmall),
                ],
              )
            ],
          )

        ],
      ),
    );
  }
}

/* --- --- --- --- --- -- --- Poster Title  */
class _Overview extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
      child:  Text('Aliqua quis adipisicing in anim sint esse magna ea aute Lorem eu dolore veniam nostrud.Aliqua quis adipisicing in anim sint esse magna ea aute Lorem eu dolore veniam nostrud.Aliqua quis adipisicing in anim sint esse magna ea aute Lorem eu dolore veniam nostrud.Aliqua quis adipisicing in anim sint esse magna ea aute Lorem eu dolore veniam nostrud',
      textAlign: TextAlign.justify,
      style: Theme.of(context).textTheme.titleMedium,
      ),
    );
  }
}