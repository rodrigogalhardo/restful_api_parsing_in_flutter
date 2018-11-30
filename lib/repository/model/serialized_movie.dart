import 'package:json_annotation/json_annotation.dart';

/// This allows the `User` class to access private members in
/// the generated file. The value for this is *.g.dart, where
/// the star denotes the source file name.
part 'serialized_movie.g.dart';

class SerializedMovieList {
  final List<Movie> movieList;

  SerializedMovieList({
    this.movieList,
  });
  factory SerializedMovieList.fromJson(List<dynamic> parsedJson) {
    return SerializedMovieList(
        movieList: parsedJson.map((i) => Movie.fromJson(i)).toList());

  }
}

@JsonSerializable()
class Movie {
  final String timestamp;
  final String name;
  final Url url;

  Movie({this.timestamp, this.name, this.url});

  factory Movie.fromJson(Map<String, dynamic> json) => _$MovieFromJson(json);
  Map<String, dynamic> toJson() => _$MovieToJson(this);
}

@JsonSerializable()
class Url {
  final String small;
  final String large;
  final String medium;

  Url({
    this.small,
    this.large,
    this.medium,
  });

  factory Url.fromJson(Map<String, dynamic> json) => _$UrlFromJson(json);
  Map<String, dynamic> toJson() => _$UrlToJson(this);
}
