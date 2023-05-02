
import 'package:flutter/material.dart';
import 'package:flutter_movie/screens/screens.dart';


void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Peliculas',
      initialRoute: 'home',
      routes: {
        'home':(_) => HomeScreen(), 
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