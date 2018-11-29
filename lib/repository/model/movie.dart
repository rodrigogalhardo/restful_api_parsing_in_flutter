class MovieList {
  final List<Movie> movieList;

  MovieList({
    this.movieList,
  });

  factory MovieList.fromJson(List<dynamic> parsedJson) {
    return MovieList(
        movieList: parsedJson.map((i) => Movie.fromJson(i)).toList());
  }
}

class Movie {
  final String timestamp;
  final String name;
  final Url url;

  Movie({this.timestamp, this.name, this.url});

  factory Movie.fromJson(Map<String, dynamic> json) {
    return Movie(
      timestamp: json['timestamp'],
      name: json['name'],
      url: Url.fromJson(json['url']),
    );
  }
}

class Url {
  final String small;
  final String large;
  final String medium;

  Url({
    this.small,
    this.large,
    this.medium,
  });

  factory Url.fromJson(Map<String, dynamic> json) {
    return Url(
      small: json['small'],
      large: json['large'],
      medium: json['medium'],
    );
  }
}
