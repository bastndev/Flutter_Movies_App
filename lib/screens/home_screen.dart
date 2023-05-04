import 'package:flutter/material.dart';
import 'package:flutter_movie/providers/movies_provider.dart';
import 'package:flutter_movie/widgets/widgets.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {


    final moviesProvider = Provider.of<MoviesProvider>(context);
    print(moviesProvider.onDisplayMovies);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Movies in Cinema'),
        elevation: 0,
        actions: [
          IconButton(
            icon: const Icon(Icons.search),
            onPressed: (){},) 
        ],
      ),
      body: SingleChildScrollView(
        child:Column(
        children: [
           /* --- --- --- --- --- --- Tarjetas Principales  */
            CardSwiper(movies: moviesProvider.onDisplayMovies),
           /* --- --- --- --- --- --- Tarjetas Principales  */
            MoviSlider(),

          ]
        ),
      )
    );
  }
}