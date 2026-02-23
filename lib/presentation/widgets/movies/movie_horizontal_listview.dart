import 'package:animate_do/animate_do.dart';
import 'package:cinemapedia/domain/entities/movie.dart';
import 'package:flutter/material.dart';

class MovieHorizontalListview extends StatelessWidget {
  final List<Movie>movies;
  final String? title;
  final String? subTitle;
  final VoidCallback? loadNextPage;
  
  const MovieHorizontalListview(
    {
      super.key, 
      required this.movies, 
      this.title, 
      this.subTitle, 
      this.loadNextPage
    }
  );

  @override
  Widget build(BuildContext context) {

    return SizedBox(
      height: 350,
      child: Column(
        children: [
          if(title!=null || subTitle!=null)
          _Title(title:title ,subTitle: subTitle,),
          Expanded(
            child: ListView.builder(
              itemCount: movies.length,
              scrollDirection: Axis.horizontal,
              physics: BouncingScrollPhysics(),
              itemBuilder: (context,index){
                  return _Slide(movie: movies[index]);
              }
              )
          )
          

        ],
      ),

    );
  }
}

class _Slide extends StatelessWidget {
  final Movie movie;
  const _Slide({required this.movie});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          //* Imagen
          SizedBox(
            width: 150,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: Image.network(
                movie.posterPath,
                width: 150,
                loadingBuilder: (context, child, loadingProgress) {
                  if(loadingProgress!=null){
                    return const Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Center(
                        child: CircularProgressIndicator(strokeWidth: 2)
                      ),  
                    );
                  }
                  return FadeIn(child: child);
                  
                },
                ),
            ),
          ),
          const SizedBox(height: 5,),
          //* Title
          SizedBox(
            width: 150,
            child: Text(
              movie.title,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: Theme.of(context).textTheme.titleMedium,
            ),
          )

        ],
      ),
    );
  }
}

class _Title extends StatelessWidget {
  final String? title;
  final String? subTitle;
  const _Title({this.title, this.subTitle});

  @override
  Widget build(BuildContext context) {
    final titleStyle=Theme.of(context).textTheme.titleLarge;
    return Container(
      padding: EdgeInsets.only(top:10),
      margin: const EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        children: [
          if(title!=null)
            Text(title!, style: titleStyle,),
          const Spacer(),
          if(subTitle!=null)
          FilledButton(
            onPressed: (){}, 
            child: Text(subTitle!))
        ],
      ),
    );
  }
}