import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:rest_api_parsing/repository/model/movie.dart';

class MovieDetailPage extends StatefulWidget {
  final Movie movie;

  MovieDetailPage(this.movie);

  @override
  _MovieDetailPageState createState() => _MovieDetailPageState();
}

class _MovieDetailPageState extends State<MovieDetailPage> {
  double _appBarHeight = 256.0;

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

  @override
  Widget build(BuildContext context) {
    timeDilation = 0.7;
    return Scaffold(
      body: Hero(
        tag: widget.movie.url.large,
        child: NestedScrollView(
          headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
            return <Widget>[
              SliverAppBar(
                expandedHeight: MediaQuery.of(context).size.height / 2,
                backgroundColor: Colors.transparent,
                elevation: 0.0,
                flexibleSpace: FlexibleSpaceBar(
                  title: Text(widget.movie.name),
                  background: Stack(
                    fit: StackFit.expand,
                    children: <Widget>[
                      Container(
                          width: MediaQuery.of(context).size.width,
                          height: _appBarHeight,
                          decoration: BoxDecoration(
                            color: Colors.transparent,
                            image: DecorationImage(
                              image: NetworkImage(widget.movie.url.large),
                              fit: BoxFit.cover,
                            ),
                          ),
                          child: new Container(
                            decoration: linearBlueGradient,
                          )),
                    ],
                  ),
                ),
              ),
            ];
          },
          body: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(35.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Container(
                    padding: EdgeInsets.only(bottom: 20.0),
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        border:
                            Border(bottom: BorderSide(color: Colors.black12))),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Row(
                          children: <Widget>[
                            Icon(
                              Icons.access_time,
                              color: Colors.cyan,
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text("10:00  AM"),
                            )
                          ],
                        ),
                        Row(
                          children: <Widget>[
                            Icon(
                              Icons.map,
                              color: Colors.cyan,
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text("15 MILES"),
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 16.0, bottom: 8.0),
                    child: Text(
                      "ABOUT",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                  Text(
                      "It's party, party, party like a nigga just got out of jail Flyin' in my 'Rari like a bat that just flew outta hell I'm from the east of ATL, but ballin' in the Cali hills Lil mama booty boomin', that bitch movin' and she standin' still I know these bitches choosin' me, but I got 80 on me still. host for the purposes of socializing, conversation, recreation, or as part of a festival or other commemoration of a special occasion. A party will typically feature food and beverages, and often music and dancing or other forms of entertainment.  "),
                  Container(
                    margin: EdgeInsets.only(top: 25.0),
                    padding: EdgeInsets.only(top: 5.0, bottom: 10.0),
                    height: 120.0,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        border: Border(top: BorderSide(color: Colors.black12))),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          "ATTENDEES",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            CircleAvatar(
                                backgroundImage:
                                    NetworkImage(widget.movie.url.large)),
                            CircleAvatar(
                              backgroundImage:
                                  NetworkImage(widget.movie.url.large),
                            ),
                            CircleAvatar(
                              backgroundImage:
                                  NetworkImage(widget.movie.url.large),
                            ),
                            CircleAvatar(
                              backgroundImage:
                                  NetworkImage(widget.movie.url.large),
                            ),
                            CircleAvatar(
                              backgroundImage:
                                  NetworkImage(widget.movie.url.large),
                            ),
                            CircleAvatar(
                              backgroundImage:
                                  NetworkImage(widget.movie.url.large),
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                  Container(
                    height: 100.0,
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
