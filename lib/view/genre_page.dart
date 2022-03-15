import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:movie_app/helper/api_helper.dart';
import 'package:movie_app/helper/constants.dart';
import 'package:movie_app/helper/custom_widget.dart';
import 'package:movie_app/model/movie.dart';
import 'package:movie_app/view_model/movie_provider.dart';
import 'package:provider/provider.dart';

class GenrePage extends StatefulWidget {
  const GenrePage({
    Key? key,
  }) : super(key: key);
  @override
  State<GenrePage> createState() => _GenrePageState();
}

class _GenrePageState extends State<GenrePage> {
  late MovieProvider movieProvider;
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    return Consumer<MovieProvider>(builder: (context, movieProvider, child) {
      return FutureBuilder(
          future: fetchMovieList(movieProvider.selectedMovieId, movieProvider),
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            if (snapshot.hasData) {
              if (snapshot.data != null) {
                return Scaffold(
                  resizeToAvoidBottomInset: false,
                  body: CustomScrollView(
                    slivers: <Widget>[
                      sliverTextAppBar(
                          context, movieProvider.selectedGenre.name!),
                      SliverGrid(
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                        ),
                        delegate: SliverChildBuilderDelegate(
                          (context, index) {
                            return Container(
                                padding: index % 2 == 0
                                    ? const EdgeInsets.fromLTRB(10, 10, 10, 0)
                                    : const EdgeInsets.fromLTRB(0, 10, 10, 0),
                                child: ClipRRect(
                                    borderRadius: BorderRadius.circular(10),
                                    child: Image.network(
                                      GETPOSTERIMG_URL +
                                          snapshot
                                              .data.movies[index].posterPath!,
                                      fit: BoxFit.cover,
                                    )));
                          },
                          childCount: snapshot.data.movies.length,
                        ),
                      ),
                    ],
                  ),
                );
              } else {
                return Container();
              }
            } else {
              return Container();
            }
          });
    });
  }
}

Future<MovieList> fetchMovieList(
    int movieId, MovieProvider movieProvider) async {
  return getGenreMovieList(movieProvider.selectedGenre.id!);
}
