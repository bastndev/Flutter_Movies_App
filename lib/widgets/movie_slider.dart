import 'package:flutter/material.dart';

class MoviSlider extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 250,
      child:  Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [

        const Padding(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child:Text('Popular',style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),)
            ),

          const SizedBox(height: 11),

          Expanded(
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: 20,
              itemBuilder: ( _, int index) => _MoviePoster()
            ),
          ),

        ],
      ),
    );
  }
}


class _MoviePoster extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 130,
      height: 190,
      margin: const EdgeInsets.symmetric(horizontal: 10,),
      child: Column(
        children: [

          GestureDetector(
            onTap: () => Navigator.pushNamed(context, 'details', arguments:'movie-instance'),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: const FadeInImage(
                placeholder: AssetImage('assets/img/no-image.jpg'),
                image: NetworkImage('https://via.placeholder.com/300x400'),
                width: 130,
                height: 190,
                fit: BoxFit.cover,
              ),
            ),
          ),

          const SizedBox(height: 5),

          const Text('Dota 2 | 7.33',
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                textAlign: TextAlign.center,
          ),
        ]
      ),
    );
  }
}