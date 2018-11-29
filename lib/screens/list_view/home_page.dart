import 'package:flutter/material.dart';
import 'package:rest_api_parsing/repository/apis.dart';
import 'package:rest_api_parsing/screens/list_view/movie_list_view.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Movie List"),
        backgroundColor: Colors.blueGrey,
      ),
      body: Stack(
        fit: StackFit.expand,
        children: <Widget>[MovieListWidget(MovieApiProvider().getMovies())],
      ),
    );
  }
}
