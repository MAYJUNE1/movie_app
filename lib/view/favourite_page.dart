import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:movie_app/view/section/favourite_section.dart';

class FavouritePage extends StatefulWidget {
  const FavouritePage({
    Key? key,
  }) : super(key: key);
  @override
  State<FavouritePage> createState() => _FavouritePageState();
}

class _FavouritePageState extends State<FavouritePage> {
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
          'Favourite',
          style: Theme.of(context).textTheme.headline2,
        ),
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const [FavouriteSection()]),
      ),
    );
  }
}
