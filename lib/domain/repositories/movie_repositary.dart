import 'package:cinemapedia/domain/entities/movie.dart';

abstract class MovieRepositary {
  

  Future<List<Movie>> getNowPlaying({int page =1});

}
