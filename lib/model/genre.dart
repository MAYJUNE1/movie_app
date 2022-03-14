// ignore_for_file: non_constant_identifier_names

import 'package:movie_app/model/movie.dart';

class GenreList {
  List<Genre>? genres;

  GenreList({this.genres});

  GenreList.fromJson(Map<String, dynamic> json) {
    genres = json['genres'] == null
        ? null
        : (json['genres'] as List<dynamic>?)
            ?.map((e) => Genre.fromJson(e as Map<String, dynamic>))
            .toList();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['genres'] =
        genres == null ? null : genres!.map((x) => x.toJson()).toList();
    return data;
  }
}

class Genre {
  int? id;
  String? name;

  Genre({this.id, this.name});

  Genre.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    return data;
  }
}
