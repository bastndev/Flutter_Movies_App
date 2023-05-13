
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_movie/screens/screens.dart';
import 'package:flutter_movie/providers/movies_provider.dart';

void main() => runApp(const AppState());

class AppState extends StatelessWidget {
  const AppState({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
          ChangeNotifierProvider(create: (_) => MoviesProvider(), lazy: false,)
      ],
      child: const MyApp(),
    );
    
  }
}


class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Pedicular',
      initialRoute: 'home',
      routes: {
        'home':(_) => const HomeScreen(), 
        'details':(_) => DetailScreen(), 
      },
      theme: ThemeData.light().copyWith(
        appBarTheme:const AppBarTheme(
          color:Colors.teal
        )
      ),
    );
  }
}