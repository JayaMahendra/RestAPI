import 'dart:io';

import 'package:http/http.dart' as http;

class HttpService {
  final String apiKey = '635ee6d5b61fe1ecb7c71b5f345fcfa5';
  final String baseUrl = 'https://api.themoviedb.org/3/movie/popular?api_key=';

  Future<String> getPopularMovies() async {
    final String uri = baseUrl + apiKey;

    http.Response result = await http.get(Uri.parse(uri));
    if (result.statusCode == 200) {
      print("SUKSES");
      String response = result.body;
      return response;
    } else {
      print("FAIL");
      return null;
    }
  }
}
