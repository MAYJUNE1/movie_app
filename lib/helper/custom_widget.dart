import 'dart:math';

import 'package:flutter/material.dart';
import 'package:movie_app/model/cast.dart';
import 'package:movie_app/model/movie.dart';

import 'constants.dart';

Widget sliverAppBar(BuildContext context, String title) {
  return SliverAppBar(
    pinned: true,
    snap: true,
    floating: true,
    expandedHeight: 50.0,
    flexibleSpace: FlexibleSpaceBar(
      title: Text(title, style: Theme.of(context).textTheme.headline1),
    ),
  );
}

Widget sliverImageAppBar(BuildContext context, String title, String imagePath) {
  return SliverAppBar(
    pinned: false,
    snap: false,
    floating: true,
    expandedHeight: MediaQuery.of(context).size.height * 0.45,
    flexibleSpace: FlexibleSpaceBar(
        // centerTitle: false,
        // title: Text(
        //   title,
        //   style: Theme.of(context).textTheme.headline3,
        //   textAlign: TextAlign.left,
        // ),
        background: imagePath != ''
            ? Image.network(
                GETPOSTERIMG_URL + imagePath,
                fit: BoxFit.cover,
              )
            : null),
  );
}

Widget sliverTextAppBar(BuildContext context, String title) {
  return SliverAppBar(
    pinned: true,
    snap: false,
    floating: true,
    expandedHeight: MediaQuery.of(context).size.height * 0.15,
    flexibleSpace: FlexibleSpaceBar(
        title: Text(
          title,
          style: Theme.of(context).textTheme.headline3,
        ),
        background: Container(
          color: Colors.primaries[Random().nextInt(Colors.primaries.length)],
        )),
  );
}

Widget sectionTitle(BuildContext context, String title) {
  return Container(
    padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
    child: Text(title, style: Theme.of(context).textTheme.headline2),
  );
}

Widget infoView(BuildContext context, String title, String info) {
  return Container(
      padding: const EdgeInsets.fromLTRB(0, 5, 0, 5),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: Theme.of(context).textTheme.bodyText1,
          ),
          Text(
            info != '' ? info : '-',
            style: Theme.of(context).textTheme.bodyText2,
          ),
          const SizedBox(
            height: 10,
          )
        ],
      ));
}

Widget tagView(String title) {
  return Container(
      margin: const EdgeInsets.fromLTRB(0, 5, 5, 5),
      padding: const EdgeInsets.all(5),
      height: 30,
      child: Text(title),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),
        border: Border.all(),
      ));
}

Widget avatarView(BuildContext context, Cast cast) {
  return Container(
      padding: const EdgeInsets.all(10),
      width: MediaQuery.of(context).size.width * 0.33,
      child: Column(
        children: [
          CircleAvatar(
            radius: 50.0,
            backgroundImage: cast.profile_path != null
                ? NetworkImage(GETPOSTERIMG_URL + cast.profile_path!)
                : null,
            backgroundColor: Colors.transparent,
          ),
          const SizedBox(
            height: 10,
          ),
          Text(
            cast.name!,
            overflow: TextOverflow.ellipsis,
            maxLines: 1,
            style: const TextStyle(fontSize: 11, fontWeight: FontWeight.bold),
          ),
          Text(
            cast.character!,
            overflow: TextOverflow.ellipsis,
            maxLines: 1,
            style: const TextStyle(fontSize: 11),
          ),
        ],
      ));
}
