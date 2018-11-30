import 'package:flutter/material.dart';
import 'package:rest_api_parsing/repository/model/movie.dart';
import 'package:rest_api_parsing/repository/model/serialized_movie.dart';

class MovieListWidget extends StatelessWidget {
  final Future<SerializedMovieList> movieListFuture;

  MovieListWidget(this.movieListFuture);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: movieListFuture,
        builder: (BuildContext buildContext, AsyncSnapshot snapshot) {
          if (snapshot.hasData) {
            SerializedMovieList movieList = snapshot.data;
            return ListView.builder(
                itemCount: movieList.movieList.length,
                padding: const EdgeInsets.all(14.0),
                itemBuilder: (BuildContext buildContext, index) {
                  return Text(movieList.movieList[index].name);
                });
          } else {
            return Center(child: CircularProgressIndicator());
          }
        });
  }
}
