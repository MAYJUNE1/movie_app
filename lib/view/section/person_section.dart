import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:movie_app/helper/api_helper.dart';
import 'package:movie_app/helper/constants.dart';
import 'package:movie_app/helper/custom_widget.dart';
import 'package:movie_app/model/cast.dart';
import 'package:movie_app/model/person.dart';
import 'package:movie_app/view/movie_details_page.dart';
import 'package:movie_app/view_model/movie_provider.dart';
import 'package:provider/provider.dart';

class PersonSection extends StatefulWidget {
  const PersonSection({
    Key? key,
  }) : super(key: key);
  @override
  State<PersonSection> createState() => _PersonSectionState();
}

class _PersonSectionState extends State<PersonSection> {
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
        future: fetchPerson(),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (snapshot.hasData) {
            if (snapshot.data != null) {
              return Container(
                  padding: const EdgeInsets.all(10),
                  child: Card(
                    color: Colors.grey[200],
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            child: sectionTitle(
                              context,
                              'Meet ' + snapshot.data.name!,
                            ),
                          ),
                          personView(snapshot.data),
                          movieListView(snapshot.data.combined_credits)
                        ]),
                  ));
            } else {
              return Container();
            }
          } else {
            return Container();
          }
        });
  }

  Widget personView(Person person) {
    return Container(
        padding: const EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                CircleAvatar(
                  radius: 40.0,
                  backgroundImage:
                      NetworkImage(GETPOSTERIMG_URL + person.profile_path!),
                  backgroundColor: Colors.transparent,
                ),
                const SizedBox(width: 10),
                Expanded(
                    child: Text(
                  person.biography!,
                  maxLines: 10,
                  overflow: TextOverflow.ellipsis,
                ))
              ],
            ),
            const SizedBox(
              height: 10,
            ),
          ],
        ));
  }

  Widget movieListView(Credit credit) {
    return SizedBox(
        height: MediaQuery.of(context).size.height * 0.30,
        child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: 5,
            itemBuilder: (context, i) {
              return movieView(credit.cast![i]);
            }));
  }

  Widget movieView(Cast cast) {
    return InkWell(
        onTap: () {
          toMovieDetail(context, movieProvider, cast.id!);
        },
        child: Container(
            width: MediaQuery.of(context).size.width * 0.40,
            padding: const EdgeInsets.all(10),
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(child: imageCardView(cast.poster_path!)),
                  SizedBox(
                      height: 35,
                      child: Text(
                        cast.title!,
                        maxLines: 2,
                        textAlign: TextAlign.center,
                        overflow: TextOverflow.ellipsis,
                      ))
                ])));
  }
}

Future<Person> fetchPerson() async {
  return getPersonList(1136406);
}

toMovieDetail(BuildContext context, MovieProvider movieProvider, int movieId) {
  movieProvider.setSelectedMovieId(movieId);
  Navigator.push(
      context, MaterialPageRoute(builder: (_) => const MovieDetailsPage()));
}
