


import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_movie/models/models.dart';
import 'package:http/http.dart' as http;

class MoviesProvider extends ChangeNotifier{


  String _apiKey   = 'a783a3f6e6680965d7cb529249eb5ab7';
  String _baseUrl   = 'api.themoviedb.org';
  String _language = 'en-US';

  List<Movie> onDisplayMovies =[];

  MoviesProvider(){
    print('MoviesProvider Initial ');

    this.getOnDisplayMovies();
  }

  getOnDisplayMovies() async {
    var url = Uri.https(_baseUrl, '3/movie/now_playing', {
      'api_key':_apiKey,
      'language':_language,
      'page':'1'
    });


  // Await the http get response, then decode the json-formatted response.
    final response = await http.get(url);
    final NowPlayingResponse =NowPlaingResponse.fromJson(response.body);

    onDisplayMovies = NowPlayingResponse.results;

    notifyListeners();
  }

}