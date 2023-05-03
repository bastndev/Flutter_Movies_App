import 'package:flutter/material.dart';
import 'package:flutter_movie/widgets/widgets.dart';

class HomeScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
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
            CardSwiper(),
           /* --- --- --- --- --- --- Tarjetas Principales  */
            MoviSlider(),
            MoviSlider(),
            MoviSlider(),
            MoviSlider(),

          ]
        ),
      )
    );
  }
}