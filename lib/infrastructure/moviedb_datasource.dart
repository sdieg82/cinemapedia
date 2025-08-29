import 'package:cinemapedia/config/constants/environments.dart';
import 'package:cinemapedia/domain/datasources/movie_datasource.dart';
import 'package:cinemapedia/domain/entities/movie.dart';
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
    final response=await dio.get('/movie/now_playing');
    final List<Movie> movies=[];
    if(response.statusCode==200)return [

    ];
    return movies;
  }

}