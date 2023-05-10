

import 'package:flutter/material.dart';

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
    return const Text('buildResults');
  }

  @override
  Widget buildSuggestions(BuildContext context) {
  
    if(query.isEmpty){
  return Container(
    child: Row(
      
      mainAxisAlignment: MainAxisAlignment.center,

      children: const [
        Center(
          child:Image(
            image: AssetImage('assets/img/movie.png'),
            width: 250,
            ),
          ),
        ],
      ),
    );
  }
    return Container();  
  }
}