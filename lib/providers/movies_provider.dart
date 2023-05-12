
// import 'dart:convert';
import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_movie/helpers/debouncer.dart';
import 'package:flutter_movie/models/models.dart';
import 'package:flutter_movie/models/search_response.dart';
// import 'package:flutter_movie/models/popular_response.dart';
import 'package:http/http.dart' as http;

class MoviesProvider extends ChangeNotifier{


  final String _apiKey   = 'a783a3f6e6680965d7cb529249eb5ab7';
  final String _baseUrl   = 'api.themoviedb.org';
  final String _language = 'en-US';

  List<Movie> onDisplayMovies = [];
  List<Movie> popularMovies   = [];

  Map<int, List<Cast>> movieCast = {};

  int _popuparPage = 0;

  final deboucer = Debouncer(
    duration: Duration(milliseconds: 500), 
    
  );

  final StreamController<List<Movie>>_suggestionStreamController = new StreamController.broadcast();
  Stream<List<Movie>> get suggestionStream  =>this._suggestionStreamController.stream;
  



  MoviesProvider(){
    // print('MoviesProvider Initial ');

    getOnDisplayMovies();
    getPopularMovies();

  }

  Future<String> _getJsonData( String endpoint, [int page = 1]) async{

    final url = Uri.https(_baseUrl,endpoint, {
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
    final nowPlayingResponse =NowPlaingResponse.fromJson(jsonData);

    onDisplayMovies = nowPlayingResponse.results;

    notifyListeners();
  }

/* --- --- -- -- -- -- -- -- - -- Card 2 */
  getPopularMovies() async{

    _popuparPage++;

    final jsonData = await _getJsonData('3/movie/popular',_popuparPage);
    final popularResponse = PopularResponse.fromJson(jsonData);

    popularMovies = [...popularMovies,...popularResponse.results];
    notifyListeners();

  }

  Future<List<Cast>> getMovieCast ( int movieId) async{

    if (movieCast.containsKey(movieId)) return movieCast[movieId]!;

    final jsonData = await _getJsonData('3/movie/$movieId/credits');
    final creditsResponse = CreditsResponse.fromJson(jsonData);
    
    movieCast [movieId] = creditsResponse.cast;

    return creditsResponse.cast;
  }

  Future<List<Movie>> searchMovie(String query) async{

    final url = Uri.https(_baseUrl,'3/search/movie', {
      'api_key' :_apiKey,
      'language':_language, 
      // 'page':'$page'
      'query'   :query
    });
    final response = await http.get(url);
    final searchResponse = SearchResponse.fromJson( response.body);

    return searchResponse.results;  
  }

  void getSuggertionsByQuery( String searchTerm){

    deboucer.value = '';
    deboucer.onValue = ( value) async{
      // print('Tenemos Valo a Buscar papus:$value');
      final results = await this.searchMovie(value);
      this._suggestionStreamController.add(results);
    };
      final timer = Timer.periodic(Duration(milliseconds: 300), (_){
        deboucer.value =searchTerm;
      });
      Future.delayed(Duration(milliseconds: 301)).then((value) => timer.cancel());
  }
}