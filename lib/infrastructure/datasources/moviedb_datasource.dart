import 'package:cinemapedia/config/constants/environments.dart';
import 'package:cinemapedia/domain/datasources/movie_datasource.dart';
import 'package:cinemapedia/domain/entities/movie.dart';
import 'package:cinemapedia/infrastructure/mappers/movie_mapper.dart';
import 'package:cinemapedia/infrastructure/models/moviedb_response.dart';
import 'package:dio/dio.dart';

class MoviedbDatasource extends MoviesDatasource {
  final dio=Dio(BaseOptions(
    baseUrl:'https://api.themoviedb.org/3/',
    queryParameters: {
      'api_key':Environments.movieDbKey,
      'language':'es-MX',

    }  
    ));

  @override
  Future<List<Movie>> getNowPlaying({int page = 1}) async {
    // TODO: implement getNowPlaying
    final response=await dio.get('/movie/now_playing',
     queryParameters: {
      'page':page
     }
    );
    final movieDBResponse = MovieDbResponse.fromJson(response.data);
    final List<Movie> movies=movieDBResponse.results
    .where((element)=> element.posterPath != 'no-poster')
    .map(
      (movieDb)=>MovieMapper.movieDbToEntity(movieDb)
    ).toList();
    return movies;
  }

}