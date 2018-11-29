import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:rest_api_parsing/repository/apis.dart';
import 'package:rest_api_parsing/repository/model/movie.dart';
import 'package:rest_api_parsing/screens/page_view/page_view_list.dart';

class PageViewPage extends StatefulWidget {
  @override
  _PageViewPageState createState() => _PageViewPageState();
}

class _PageViewPageState extends State<PageViewPage> {
  String imageUrl = '';

  Future<MovieList> movieListFuture;

  @override
  void initState() {
    super.initState();

    movieListFuture = MovieApiProvider().getMovies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
          future: movieListFuture,
          builder: (BuildContext buildContext, AsyncSnapshot snapshot) {
            if (snapshot.hasData) {
              MovieList movieList = snapshot.data;
              return Stack(
                fit: StackFit.expand,
                children: [
                  Container(
                    decoration: new BoxDecoration(
                      image: new DecorationImage(
                        image: NetworkImage(imageUrl.isEmpty
                            ? movieList.movieList[0].url.large
                            : imageUrl),
                        fit: BoxFit.cover,
                      ),
                    ),
                    child: new BackdropFilter(
                      filter: new ImageFilter.blur(sigmaX: 3.0, sigmaY: 3.0),
                      child: new Container(
                        decoration: new BoxDecoration(
                            color: Colors.white.withOpacity(0.0)),
                      ),
                    ),
                  ),
                  PageViewList(
                    MediaQuery.of(context).size,
                    movieList.movieList,
                    (url) {
                      setState(() {
                        this.imageUrl = url;
                      });
                    },
                  )
                ],
              );
            } else {
              return Center(child: CircularProgressIndicator());
            }
          }),
    );
  }
}
