import 'package:cinemapedia/infrastructure/moviedb_datasource.dart';
import 'package:cinemapedia/infrastructure/repositories/movie_repositorie.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

//esre repositorio es inmutable 
final movieRepositoryProvider=Provider((ref){
  
  return MovieRepositorieImpl(MoviedbDatasource());

});