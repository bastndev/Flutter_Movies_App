


import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_movie/models/models.dart';
import 'package:flutter_movie/models/popular_response.dart';
import 'package:http/http.dart' as http;

class MoviesProvider extends ChangeNotifier{


  String _apiKey   = 'a783a3f6e6680965d7cb529249eb5ab7';
  String _baseUrl   = 'api.themoviedb.org';
  String _language = 'en-US';

  List<Movie> onDisplayMovies =[];
  List<Movie> popularMovies =[];

  int _popuparPage = 0;

  MoviesProvider(){
    print('MoviesProvider Initial ');

    getOnDisplayMovies();
    getPopularMovies();
  }

  Future<String> _getJsonData( String endpoint, [int page = 1]) async{

    var url = Uri.https(_baseUrl,endpoint, {
      'api_key':_apiKey,
      'language':_language,
      'page':'$page'
    });

    final response = await http.get(url);
    return response.body;
  }

/* --- --- -- -- -- -- -- -- - --  Card 1*/
  getOnDisplayMovies() async {

    final jsonData = await _getJsonData('3/movie/now_playing');
    final NowPlayingResponse =NowPlaingResponse.fromJson(jsonData);

    onDisplayMovies = NowPlayingResponse.results;

    notifyListeners();
  }

/* --- --- -- -- -- -- -- -- - -- Card 2 */
  getPopularMovies() async{

    _popuparPage++;

    final jsonData = await _getJsonData('3/movie/popular',_popuparPage);
    final popularResponse = PopularResponse.fromJson(jsonData);

    popularMovies = [...popularMovies,...popularResponse.results];

    print(popularMovies[0]);

    notifyListeners();

  }

}