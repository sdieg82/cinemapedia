import 'package:cinemapedia/domain/entities/movie.dart';

abstract class MoviesRepositary {
  

  Future<List<Movie>> getNowPlaying({int page =1});

}
