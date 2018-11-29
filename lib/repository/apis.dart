import 'dart:convert';

import 'package:http/http.dart' show Client;
import 'package:rest_api_parsing/repository/model/movie.dart';

class MovieApiProvider {
  Client client = Client();

  Future<MovieList> getMovies() async {
    final _baseUrl = "https://api.androidhive.info/json/glide.json";
    final response = await client.get(_baseUrl);

    if (response.statusCode == 200) {
      // If server returns an OK response, parse the JSON
      var parsedJson = json.decode(response.body) as List;
      return MovieList.fromJson(parsedJson);
    } else {
      // If that response was not OK, throw an error.
      throw Exception('Failed to load post');
    }
  }
}
