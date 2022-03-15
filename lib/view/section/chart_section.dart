import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:movie_app/helper/api_helper.dart';
import 'package:movie_app/helper/constants.dart';
import 'package:movie_app/helper/custom_widget.dart';
import 'package:movie_app/model/movie.dart';
import 'package:movie_app/view/movie_details_page.dart';
import 'package:movie_app/view_model/movie_provider.dart';
import 'package:provider/provider.dart';

class ChartSection extends StatefulWidget {
  const ChartSection({
    Key? key,
  }) : super(key: key);
  @override
  State<ChartSection> createState() => _ChartSectionState();
}

class _ChartSectionState extends State<ChartSection> {
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
                    child: sectionTitle(context, 'Top 10'),
                  ),
                  movieListView(snapshot.data.movies),
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
        height: MediaQuery.of(context).size.height * 0.25,
        child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: 10,
            itemBuilder: (context, i) {
              return movieChartView(movieList[i], i + 1);
            }));
  }

  Widget movieChartView(
    Movie movie,
    int rank,
  ) {
    return InkWell(
        onTap: () {
          toMovieDetail(context, movieProvider, movie.id!);
        },
        child: Container(
          padding: const EdgeInsets.all(5),
          width: MediaQuery.of(context).size.width * 0.45,
          child: Stack(
            children: [
              Positioned.fill(
                  left: 30.0, child: imageCardView(movie.posterPath!)),
              Positioned(
                  top: -15,
                  left: 5,
                  child: Text(rank.toString(),
                      style: const TextStyle(
                        color: Colors.amberAccent,
                        fontSize: 94,
                        fontWeight: FontWeight.bold,
                        letterSpacing: -15.0,
                      ))),
            ],
          ),
        ));
  }
}

Future<MovieList> fetchMovies() async {
  return getTopMovieList();
}

toMovieDetail(BuildContext context, MovieProvider movieProvider, int movieId) {
  movieProvider.setSelectedMovieId(movieId);
  Navigator.push(
      context, MaterialPageRoute(builder: (_) => const MovieDetailsPage()));
}
