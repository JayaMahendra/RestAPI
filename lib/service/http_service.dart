import 'dart:io';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:rest_api_jaya/models/movie.dart';

class HttpService {
  final String apiKey = '635ee6d5b61fe1ecb7c71b5f345fcfa5';
  final String baseUrl = 'https://api.themoviedb.org/3/movie/popular?api_key=';

  Future<String> getPopularMovies() async {
    final String uri = baseUrl + apiKey;

    http.Response result = await http.get(Uri.parse(uri));
    if (result.statusCode == 200) {
      print("SUKSES");
      final jsonResponse = json.decode(result.body);
      final moviesMap = jsonResponse['results'];
      List movies = moviesMap.map((i) => Movie.fromJson(i)).toList();
      return movies;
      // String response = result.body;
      // return response;
    } else {
      print("FAIL");
      return null;
    }
  }
}
