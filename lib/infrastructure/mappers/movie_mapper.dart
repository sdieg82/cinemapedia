import 'package:cinemapedia/domain/entities/movie.dart';
import 'package:cinemapedia/infrastructure/models/movie_moviedb.dart';

class MovieMapper {
  static Movie movieDbToEntity(MovieMovieDb moviedb) => Movie(
    adult: moviedb.adult,
    backdropPath: moviedb.backdropPath != '' 
    ? 'http://image.tmdb.org/t/p/w500/${moviedb.backdropPath}' 
    : 'https://media.istockphoto.com/id/1396814518/vector/image-coming-soon-no-photo-no-thumbnail-image-available-vector-illustration.jpg?s=612x612&w=0&k=20&c=hnh2OZgQGhf0b46-J2z7aHbIWwq8HNlSDaNp2wn_iko=',
    genreIds: moviedb.genreIds.map((e)=> e.toString()).toList(),
    id: moviedb.id,
    originalLanguage: moviedb.originalLanguage,
    originalTitle: moviedb.originalTitle,
    overview: moviedb.overview,
    popularity: moviedb.popularity,
    posterPath: (moviedb.posterPath != '')
    ? 'http://image.tmdb.org/t/p/w500/${moviedb.posterPath}'
    : 'no-poster',
    releaseDate: moviedb.releaseDate,
    title: moviedb.title,
    video: moviedb.video,
    voteAverage: moviedb.voteAverage,
    voteCount: moviedb.voteCount,
  );
}
