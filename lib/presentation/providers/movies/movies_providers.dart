import 'package:cinemapedia/domain/entities/movie.dart';
import 'package:cinemapedia/presentation/providers/movies/movies_repository_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final nowPlayingMoviesProvider= StateNotifierProvider<MoviesNotifier, List<Movie>>((ref){
  
  final fetchMoreMovies=ref.watch(movieRepositoryProvider).getNowPlaying;

  return MoviesNotifier(
    fetchMoreMovies,
  );
});

final popularMoviesProvider= StateNotifierProvider<MoviesNotifier, List<Movie>>((ref){
  
  final fetchMoreMovies=ref.watch(movieRepositoryProvider).getPopular;

  return MoviesNotifier(
    fetchMoreMovies,
  );
});

final upcomingMoviesProvider= StateNotifierProvider<MoviesNotifier, List<Movie>>((ref){
  
  final fetchMoreMovies=ref.watch(movieRepositoryProvider).getUpcoming;

  return MoviesNotifier(
    fetchMoreMovies,
  );
});

final topRatedMoviesProvider= StateNotifierProvider<MoviesNotifier, List<Movie>>((ref){
  
  final fetchMoreMovies=ref.watch(movieRepositoryProvider).getTopRated;

  return MoviesNotifier(
    fetchMoreMovies,
  );
});

  

typedef MovieCallback = Future<List<Movie>> Function ({int page});

class MoviesNotifier extends StateNotifier<List<Movie>>{
  
  int currentPage=0;
  bool isLoading=false;
  MovieCallback fecthMoreMovies;
  
  MoviesNotifier(
     this.fecthMoreMovies,
  ):super([]);
  Future<void>loadNextPage()async{
    if(isLoading)return ;
    isLoading=true;
    print('loading more movies');
    currentPage ++;
    final List<Movie> movies= await fecthMoreMovies(page: currentPage);
    state=[...state,...movies];
    await Future.delayed(Duration(milliseconds: 300));
    isLoading=false;

  }

}