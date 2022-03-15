import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:movie_app/view/section/chart_section.dart';
import 'package:movie_app/view/favourite_page.dart';
import 'package:movie_app/view/section/genre_section.dart';
import 'package:movie_app/view/section/person_section.dart';
import 'package:movie_app/view/section/popular_section.dart';

class HomePage extends StatefulWidget {
  const HomePage({
    Key? key,
  }) : super(key: key);
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
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
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        iconTheme: Theme.of(context).iconTheme,
        title: Text(
          'Movie',
          style: Theme.of(context).textTheme.headline2,
        ),
        actions: <Widget>[
          Padding(
              padding: const EdgeInsets.fromLTRB(0, 0, 20, 0),
              child: GestureDetector(
                onTap: () {
                  toFavouriteMovie(context);
                },
                child: const Icon(
                  Icons.favorite_border,
                ),
              ))
        ],
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const [
              PopularSection(),
              GenreSection(),
              ChartSection(),
              PersonSection()
            ]),
      ),
    );
  }
}

toFavouriteMovie(BuildContext context) {
  Navigator.push(
      context, MaterialPageRoute(builder: (_) => const FavouritePage()));
}
