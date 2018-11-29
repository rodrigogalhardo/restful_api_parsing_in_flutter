import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:rest_api_parsing/repository/model/movie.dart';
import 'package:rest_api_parsing/screens/movie_detail/movie_detial.dart';

class PageViewList extends StatelessWidget {
  final Size size;
  final List<Movie> movieList;
  final Function onCardChanged;

  PageViewList(this.size, this.movieList, this.onCardChanged);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Center(
        child: Container(
          height: MediaQuery.of(context).orientation == Orientation.portrait
              ? size.height / 3
              : size.height / 2,
          child: PageView.builder(
            controller: PageController(viewportFraction: 0.75),
            onPageChanged: (value) {
              onCardChanged(movieList[value].url.large);
            },
            itemCount: movieList.length,
            itemBuilder: (context, index) {
              final item = movieList[index];
              return MovieCard(
                movie: item,
              );
            },
          ),
        ),
      ),
    );
  }
}

class MovieCard extends StatelessWidget {
  MovieCard({
    @required this.movie,
  });

  final Movie movie;

  var linearBlueGradient = const BoxDecoration(
    gradient: const LinearGradient(
      begin: FractionalOffset.bottomCenter,
      end: FractionalOffset.topCenter,
      colors: <Color>[
        Colors.black,
        Colors.transparent,
      ],
      stops: [0.0, 1.0],
    ),
  );

  TextStyle TextStyle16 = const TextStyle(
    color: Colors.white,
    fontFamily: 'Rubik',
    fontWeight: FontWeight.w600,
    fontSize: 20.0,
  );

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.of(context).push(PageRouteBuilder(
          pageBuilder: (_, __, ___) => MovieDetailPage(movie),
        ));
      },
      child: Hero(
        tag: movie.name,
        child: Card(
          child: Stack(
            fit: StackFit.expand,
            overflow: Overflow.visible,
            children: <Widget>[
              Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.transparent,
                  image: DecorationImage(
                    image: NetworkImage(movie.url.large),
                    fit: BoxFit.cover,
                  ),
                ),
                child: new Container(
                  decoration: linearBlueGradient,
                ),
              ),
              Align(
                widthFactor: 1.0,
                alignment: Alignment.bottomCenter,
                child: Container(
                  width: double.infinity,
                  color: Colors.white.withOpacity(0.1),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      movie.name,
                      style: TextStyle16,
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
