import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:movie_app/helper/api_helper.dart';
import 'package:movie_app/helper/constants.dart';
import 'package:movie_app/helper/custom_widget.dart';
import 'package:movie_app/model/movie.dart';
import 'package:movie_app/view/movie_details_page.dart';
import 'package:movie_app/view_model/movie_provider.dart';
import 'package:provider/provider.dart';

class PopularSection extends StatefulWidget {
  const PopularSection({
    Key? key,
  }) : super(key: key);
  @override
  State<PopularSection> createState() => _PopularSectionState();
}

class _PopularSectionState extends State<PopularSection> {
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
        future: fetchMovies(),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (snapshot.hasData) {
            if (snapshot.data != null) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    padding: const EdgeInsets.fromLTRB(10, 0, 0, 0),
                    child: sectionTitle(context, 'Upcoming'),
                  ),
                  movieListView(snapshot.data.movies)
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

  Widget movieListView(List<Movie> movieList) {
    return SizedBox(
        height: MediaQuery.of(context).size.height * 0.5,
        child: PageView.builder(
            controller: PageController(
              initialPage: 0,
              viewportFraction: 0.9,
            ),
            itemCount: 10,
            itemBuilder: (context, i) {
              return posterView(context, movieList[i], i == 0 ? true : false,
                  i == 9 ? true : false);
            }));
  }

  Widget posterView(
      BuildContext context, Movie movie, bool isFirst, bool isLast) {
    return InkWell(
        onTap: () {
          toMovieDetail(context, movieProvider, movie.id!);
        },
        child: Container(
            padding: isFirst
                ? const EdgeInsets.fromLTRB(0, 10, 5, 10)
                : isLast
                    ? const EdgeInsets.fromLTRB(5, 10, 0, 10)
                    : const EdgeInsets.all(5),
            child: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Image.network(
                  GETPOSTERIMG_URL + movie.posterPath!,
                  fit: BoxFit.cover,
                ))));
  }
}

Future<MovieList> fetchMovies() async {
  return getUpcomingMovieList();
}

toMovieDetail(BuildContext context, MovieProvider movieProvider, int movieId) {
  movieProvider.setSelectedMovieId(movieId);
  Navigator.push(
      context, MaterialPageRoute(builder: (_) => const MovieDetailsPage()));
}
