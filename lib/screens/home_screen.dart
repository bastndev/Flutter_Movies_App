import 'package:flutter/material.dart';

import 'package:provider/provider.dart';
import 'package:flutter_movie/widgets/widgets.dart';

import 'package:flutter_movie/search/search_delegate.dart';
import 'package:flutter_movie/providers/movies_provider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});


  @override
  Widget build(BuildContext context) {

    final moviesProvider = Provider.of<MoviesProvider>(context);
    /* Si te bota algun error Activa esto  */
    // final moviePopular = Provider.of<MoviesProvider>(context);
    // print(moviesProvider.onDisplayMovies);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Movies in Cinema'),
        elevation: 0,
        actions: [
          IconButton(
            icon: const Icon(Icons.search),
            onPressed: () => showSearch(context: context, delegate: MovieSearchDelegate() ),
          ) 
        ],
      ),
      body: SingleChildScrollView(
        child:Column(
        children: [
           /* --- --- --- --- --- --- Tarjetas Principales  */
            CardSwiper(movies: moviesProvider.onDisplayMovies),
           /* --- --- --- --- --- --- Tarjetas Principales  */
            MoviSlider(
              movies: moviesProvider.popularMovies,
              title : 'Populares',
              onNextPage: ()=> moviesProvider.getPopularMovies(),
            ),
            MoviSlider(
              movies: moviesProvider.popularMovies,
              title : 'Populares',
              onNextPage: ()=> moviesProvider.getPopularMovies(),
            ),
            MoviSlider(
              movies: moviesProvider.popularMovies,
              title : 'Populares',
              onNextPage: ()=> moviesProvider.getPopularMovies(),
            ),
          ]
        ),
      )
    );
  }
}