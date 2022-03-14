import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:movie_app/helper/api_helper.dart';
import 'package:movie_app/helper/custom_widget.dart';
import 'package:movie_app/model/genre.dart';
import 'package:movie_app/view/genre_page.dart';
import 'package:movie_app/view_model/movie_provider.dart';
import 'package:provider/provider.dart';

class GenreSection extends StatefulWidget {
  const GenreSection({
    Key? key,
  }) : super(key: key);
  @override
  State<GenreSection> createState() => _GenreSectionState();
}

class _GenreSectionState extends State<GenreSection> {
  late MovieProvider movieProvider;
  @override
  void initState() {
    movieProvider = Provider.of<MovieProvider>(context, listen: false);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    return FutureBuilder(
        future: fetchGenre(),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (snapshot.hasData) {
            if (snapshot.data != null) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    padding: const EdgeInsets.fromLTRB(10, 0, 0, 0),
                    child: sectionTitle(context, 'Genre'),
                  ),
                  genreListView(context, snapshot.data.genres),
                ],
              );
            } else {
              return Container();
            }
          } else {
            return Container();
          }
        });
  }

  Widget genreListView(BuildContext context, List<Genre> genreList) {
    return SizedBox(
        height: MediaQuery.of(context).size.height * 0.1,
        child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: 10,
            itemBuilder: (context, i) {
              return Container(
                padding: const EdgeInsets.all(5),
                child: genreView(context, genreList[i]),
              );
            }));
  }

  Widget genreView(BuildContext context, Genre genre) {
    return InkWell(
        onTap: () {
          toMovieGenreList(context, genre, movieProvider);
        },
        child: Container(
          width: MediaQuery.of(context).size.width * 0.3,
          decoration: BoxDecoration(
              color:
                  Colors.primaries[Random().nextInt(Colors.primaries.length)],
              borderRadius: BorderRadius.circular(10)),
          child: Center(
              child: Text(
            genre.name!,
            style: Theme.of(context).textTheme.subtitle1,
          )),
        ));
  }
}

Future<GenreList> fetchGenre() async {
  return getGenreList();
}

toMovieGenreList(
    BuildContext context, Genre genre, MovieProvider movieProvider) {
  movieProvider.setSelectedGenre(genre);
  Navigator.push(context, MaterialPageRoute(builder: (_) => const GenrePage()));
}
