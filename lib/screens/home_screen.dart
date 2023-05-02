import 'package:flutter/material.dart';
import 'package:flutter_movie/widgets/widgets.dart';

class HomeScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Movies in Cinema'),
        elevation: 0,
        actions: [
          IconButton(
            icon: const Icon(Icons.search),
            onPressed: (){},) 
        ],
      ),
      body: Column(
        children: [

          CardSwiper()

          //Horizontal list of Movies
        ]
      ),
    );
  }
}