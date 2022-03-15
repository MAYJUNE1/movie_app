import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:movie_app/helper/api_helper.dart';
import 'package:movie_app/helper/custom_widget.dart';
import 'package:movie_app/model/cast.dart';
import 'package:movie_app/model/movie.dart';
import 'package:movie_app/view_model/movie_provider.dart';
import 'package:provider/provider.dart';

class MovieDetailsPage extends StatefulWidget {
  const MovieDetailsPage({
    Key? key,
  }) : super(key: key);
  @override
  State<MovieDetailsPage> createState() => _MovieDetailsPageState();
}

class _MovieDetailsPageState extends State<MovieDetailsPage> {
  late MovieProvider movieProvider;
  @override
  void initState() {
    movieProvider = Provider.of<MovieProvider>(context, listen: false);

    fetchMovieDetails(movieProvider.selectedMovieId, movieProvider);
    // movieProvider.checkIsFavourite(movieProvider.selectedMovieId);
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
          future:
              fetchMovieDetails(movieProvider.selectedMovieId, movieProvider),
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            if (snapshot.hasData) {
              if (snapshot.data != null) {
                return Scaffold(
                  resizeToAvoidBottomInset: false,
                  body: CustomScrollView(
                    slivers: <Widget>[
                      sliverImageAppBar(
                          context,
                          movieProvider.selectedMovie.originalTitle!,
                          snapshot.data.posterPath!),
                      SliverList(
                        delegate: SliverChildBuilderDelegate(
                          (BuildContext context, int index) {
                            return Container(
                                padding: const EdgeInsets.all(20),
                                child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Row(children: [favouriteButton()]),
                                      movieTitle(),
                                      genreView(),
                                      movieOverview(),
                                      movieInformation(),
                                      movieCasting()
                                    ]));
                          },
                          childCount: 1,
                        ),
                      ),
                    ],
                  ),
                );
              } else {
                return loadingIndicator(context);
              }
            } else {
              return loadingIndicator(context);
            }
          });
    });
  }

  Widget favouriteButton() {
    return IconButton(
        onPressed: () {
          movieProvider.setFavouriteMovieList(movieProvider.selectedMovie);
        },
        iconSize: 30,
        icon: Icon(
            movieProvider.isFavourite ? Icons.favorite : Icons.favorite_border,
            color: movieProvider.isFavourite
                ? Colors.red
                : Theme.of(context).iconTheme.color));
  }

  Widget movieTitle() {
    return Container(
        padding: const EdgeInsets.fromLTRB(0, 10, 0, 10),
        height: 80,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Expanded(
                child: Text(
              movieProvider.selectedMovie.originalTitle!,
              style: Theme.of(context).textTheme.headline4,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            )),
            Container(
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(),
                ),
                width: 50,
                height: 50,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(movieProvider.selectedMovie.voteAverage!,
                        style: Theme.of(context).textTheme.headline4)
                  ],
                ))
          ],
        ));
  }

  Widget genreView() {
    List<Widget> widgetList = [];

    for (int i = 0; i < movieProvider.selectedMovie.genres!.length; i++) {
      widgetList
          .add(tagView(context, movieProvider.selectedMovie.genres![i].name!));
    }

    return Container(
        padding: const EdgeInsets.fromLTRB(0, 10, 0, 10),
        child: Wrap(
            alignment: WrapAlignment.spaceBetween,
            direction: Axis.horizontal,
            children: widgetList));
  }

  Widget movieOverview() {
    return Container(
        padding: const EdgeInsets.fromLTRB(0, 10, 0, 10),
        child: Text(
          movieProvider.selectedMovie.overview!,
          overflow: TextOverflow.ellipsis,
          maxLines: 5,
        ));
  }

  Widget movieInformation() {
    final List<String?> languageName =
        movieProvider.selectedMovie.spokenLanguage!.map((e) => e.name).toList();

    return Container(
        padding: const EdgeInsets.fromLTRB(0, 10, 0, 10),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          infoView(context, 'Release Date',
              movieProvider.selectedMovie.releaseDate!),
          infoView(context, 'Runtime',
              movieProvider.selectedMovie.runtime.toString() + ' mins'),
          infoView(context, 'Production Country',
              movieProvider.selectedMovie.productionCountry![0].name!),
          infoView(context, 'Language', languageName.join(', ')),
          infoView(context, 'HomePage', movieProvider.selectedMovie.homePage!)
        ]));
  }

  Widget movieCasting() {
    return FutureBuilder(
        future: fetchCastDetails(movieProvider.selectedMovieId),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (snapshot.hasData) {
            if (snapshot.data != null) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Casts',
                    style: Theme.of(context).textTheme.bodyText1,
                  ),
                  castListView(snapshot.data.casts)
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

  Widget castListView(List<Cast> castList) {
    return SizedBox(
        height: MediaQuery.of(context).size.height * 0.25,
        child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: 10,
            itemBuilder: (context, i) {
              return avatarView(context, castList[i]);
            }));
  }
}

Future<Movie> fetchMovieDetails(
    int movieId, MovieProvider movieProvider) async {
  Movie movie = await getMovieDetails(movieId);
  movieProvider.setSelectedMovie(movie);

  return movie;
}

Future<CastList> fetchCastDetails(int movieId) {
  return getMovieCast(movieId);
}
