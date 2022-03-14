import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:movie_app/helper/api_helper.dart';
import 'package:movie_app/helper/constants.dart';
import 'package:movie_app/helper/custom_widget.dart';
import 'package:movie_app/model/movie.dart';
import 'package:movie_app/view/movie_details_page.dart';
import 'package:movie_app/view_model/movie_provider.dart';
import 'package:provider/provider.dart';

class FavouriteSection extends StatefulWidget {
  const FavouriteSection({
    Key? key,
  }) : super(key: key);
  @override
  State<FavouriteSection> createState() => _FavouriteSectionState();
}

class _FavouriteSectionState extends State<FavouriteSection> {
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
    return Consumer<MovieProvider>(builder: (context, movieProvider, child) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [movieListView(movieProvider.favouriteMovieList!)],
      );
    });
  }

  Widget movieListView(List<Movie> movieList) {
    var size = MediaQuery.of(context).size;

    final double itemHeight = (size.height - kToolbarHeight - 24) / 3;
    final double itemWidth = size.width / 2;

    return Container(
        padding: const EdgeInsets.all(10),
        height: MediaQuery.of(context).size.height,
        child: GridView.builder(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2, childAspectRatio: (itemWidth / itemHeight)),
            itemCount: movieList.length,
            itemBuilder: (context, i) {
              return favouriteView(context, movieList[i], i == 0 ? true : false,
                  i == movieList.length - 1 ? true : false, () {
                toMovieDetail(context, movieProvider, movieList[i].id!);
              });
            }));
  }
}

Widget favouriteView(BuildContext context, Movie movie, bool isFirst,
    bool isLast, Function fxOnTap) {
  return InkWell(
      onTap: fxOnTap as void Function(),
      child: Container(
          padding: const EdgeInsets.all(10),
          child: Container(
            decoration: BoxDecoration(
              border: Border.all(width: 0.1),
              borderRadius: BorderRadius.circular(8.0),
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                      child: Container(
                          decoration: BoxDecoration(
                    image: DecorationImage(
                      image: NetworkImage(GETPOSTERIMG_URL + movie.posterPath!),
                      fit: BoxFit.cover,
                    ),
                  ))),
                  Container(
                      padding: const EdgeInsets.all(5),
                      height: 50,
                      child: Text(
                        movie.originalTitle!,
                        style: Theme.of(context).textTheme.subtitle1,
                        textAlign: TextAlign.left,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ))
                ],
              ),
            ),
          )));
}

toMovieDetail(BuildContext context, MovieProvider movieProvider, int movieId) {
  movieProvider.setSelectedMovieId(movieId);
  Navigator.push(
      context, MaterialPageRoute(builder: (_) => const MovieDetailsPage()));
}
