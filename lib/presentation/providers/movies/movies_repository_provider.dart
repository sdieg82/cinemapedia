import 'package:cinemapedia/infrastructure/datasources/moviedb_datasource.dart';
import 'package:cinemapedia/infrastructure/repositories/movie_repositorie.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

//este repositorio es inmutable es solo de lectura
final movieRepositoryProvider=Provider((ref){
  
  return MovieRepositorieImpl(MoviedbDatasource());

});