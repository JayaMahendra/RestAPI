import 'package:flutter/material.dart';
import 'package:rest_api_jaya/service/http_service.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/widgets.dart';

import 'movie_detail.dart';

class MovieList extends StatefulWidget {
  @override
  _MovieListState createState() => _MovieListState();
}

class _MovieListState extends State<MovieList> {
  // String result = "";
  int moviesCount;
  List movies;
  HttpService service;

  Future initialize() async {
    movies = [];
    movies = await service.getPopularMovies();
    setState(() {
      moviesCount = movies.length;
      movies = movies;
    });
  }

  String imgPath = 'https://image.tmdb.org/t/p/w500';

  @override
  void initState() {
    service = HttpService();
    initialize();
    super.initState();
  }

  Widget build(BuildContext context) {
    // service.getPopularMovies().then((value) => {
    //       setState(() {
    //         result = value;
    //       })
    //     });
    return Scaffold(
      appBar: AppBar(
        title: Text('Popular Movies'),
      ),
      body: ListView.builder(
        itemCount: (this.moviesCount == null) ? 0 : this.moviesCount,
        itemBuilder: (context, int position) {
          return Card(
              color: Colors.white,
              elevation: 2.0,
              child: ListTile(
                leading: SizedBox(
                  width: 100,
                  child: ClipRRect(
                    child: Image.network(imgPath + movies[position].posterPath),
                  ),
                ),
                //  CircleAvatar(
                //     child: ClipRRect(
                //         child: Image.network(movies[position].posterPath))),
                title: Text(movies[position].title),
                subtitle: Text(
                  'Rating = ' + movies[position].voteAverage.toString(),
                ),
                onTap: () {
                  MaterialPageRoute route = MaterialPageRoute(
                      builder: (_) => MovieDetail(movies[position]));
                  Navigator.push(context, route);
                },
              ));
        },
      ),
    );
  }
}
