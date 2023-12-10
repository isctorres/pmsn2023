import 'package:flutter/material.dart';
import 'package:pmsn20232/models/popular_model.dart';

Widget itemMovieWidget(PopularModel movie, context){
  return GestureDetector(
    onTap: () => Navigator.pushNamed(
      context, '/detail',
      arguments: movie
    ),
    child: FadeInImage(
      fit: BoxFit.fill,
      fadeInDuration: const Duration(milliseconds: 500),
      placeholder: const AssetImage('assets/loading2.gif'), 
      image: NetworkImage('https://image.tmdb.org/t/p/w500/${movie.posterPath}')
    ),
  );
}