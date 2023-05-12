

import 'package:flutter/material.dart';
import 'package:flutter_movie/models/models.dart';
import 'package:provider/provider.dart';
import 'package:flutter_movie/providers/movies_provider.dart';

class MovieSearchDelegate extends SearchDelegate{

  @override
  String get searchFieldLabel => 'Search Movie';

  @override
  List<Widget>? buildActions(BuildContext context) {
    return[
      IconButton(
        onPressed: () => query='',
        icon: const Icon(Icons.clear),
      )
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
      onPressed: () => close(context, null), 
      icon: const Icon(Icons.arrow_back_ios),
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    return Text('Holdddddaa');
  }

  Widget _emptyContainer(){
    return Container(
        child: Center(
          child:Icon(Icons.movie,color: Colors.amber, size: 140,) 
        ),
      );
  }

@override
Widget buildSuggestions(BuildContext context) {
  if (query.isEmpty) {
    return _emptyContainer();
  }

  final moviesProvider = Provider.of<MoviesProvider>(context, listen: false);

  return FutureBuilder(
    future: moviesProvider.searchMovie(query),
    builder: (_, AsyncSnapshot<List<Movie>> snapshot) {
      if (!snapshot.hasData) {
        return _emptyContainer();
      }

      // Aquí puedes retornar el widget que deseas construir usando los datos obtenidos en el snapshot.
      final movies = snapshot.data!;


        return ListView.builder(
          itemCount: movies.length,
          itemBuilder: (_, index ) =>_MovieItem(movies[index])
        );
      },
    );
  }

}

class _MovieItem extends StatelessWidget {

  final Movie movie;

  const _MovieItem( this.movie);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Hero(
        tag: movie.id,
        child: FadeInImage(
          placeholder: AssetImage('assets/img/no-image.jpg'),
          image: NetworkImage(movie.fullPosterImg),
          width: 50,
          fit: BoxFit.contain,
        ),
      ),
      title: Text(movie.title),
      subtitle: Text(movie.originalTitle),
      onTap: (){
        Navigator.pushNamed(context,'details', arguments: movie);
      },
    );
  }
}

