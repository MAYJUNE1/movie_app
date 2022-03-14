// ignore_for_file: non_constant_identifier_names

import 'package:movie_app/model/genre.dart';

class MovieList {
  int? page;
  List<Movie>? movies;

  MovieList({this.page, this.movies});

  MovieList.fromJson(Map<String, dynamic> json) {
    page = json['page'];
    movies = json['results'] == null
        ? null
        : (json['results'] as List<dynamic>?)
            ?.map((e) => Movie.fromJson(e as Map<String, dynamic>))
            .toList();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['page'] = page;
    data['results'] =
        movies == null ? null : movies!.map((x) => x.toJson()).toList();
    return data;
  }
}

class Movie {
  int? id;
  String? originalLanguage;
  String? originalTitle;
  String? overview;
  double? popularity;
  String? posterPath;
  String? releaseDate;
  int? runtime;
  String? voteAverage;
  int? voteCount;
  String? homePage;
  List<Genre>? genres;
  List<ProductionCountry>? productionCountry;
  List<SpokenLanguage>? spokenLanguage;

  Movie({
    this.id,
    this.originalLanguage,
    this.originalTitle,
    this.overview,
    this.popularity,
    this.posterPath,
    this.releaseDate,
    this.runtime,
    this.voteAverage,
    this.voteCount,
    this.homePage,
    this.genres,
    this.productionCountry,
    this.spokenLanguage,
  });

  Movie.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    originalLanguage = json['original_language'];
    originalTitle = json['original_title'];
    overview = json['overview'];
    popularity = json['popularity'];
    posterPath = json['poster_path'];
    releaseDate = json['release_date'];
    runtime = json['runtime'];
    voteAverage = json['vote_average'].toString();
    voteCount = json['vote_count'];
    homePage = json['homepage'];
    genres = json['genres'] == null
        ? null
        : (json['genres'] as List<dynamic>?)
            ?.map((e) => Genre.fromJson(e as Map<String, dynamic>))
            .toList();
    productionCountry = json['production_countries'] == null
        ? null
        : (json['production_countries'] as List<dynamic>?)
            ?.map((e) => ProductionCountry.fromJson(e as Map<String, dynamic>))
            .toList();
    spokenLanguage = json['spoken_languages'] == null
        ? null
        : (json['spoken_languages'] as List<dynamic>?)
            ?.map((e) => SpokenLanguage.fromJson(e as Map<String, dynamic>))
            .toList();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['original_language'] = originalLanguage;
    data['original_title'] = originalTitle;
    data['overview'] = overview;
    data['popularity'] = popularity;
    data['poster_path'] = posterPath;
    data['release_date'] = releaseDate;
    data['runtime'] = runtime;
    data['vote_average'] = voteAverage;
    data['vote_count'] = voteCount;
    data['homePage'] = homePage;
    data['genres'] =
        genres == null ? null : genres!.map((x) => x.toJson()).toList();
    data['production_countries'] = productionCountry == null
        ? null
        : productionCountry!.map((x) => x.toJson()).toList();
    data['spoken_languages'] = productionCountry == null
        ? null
        : productionCountry!.map((x) => x.toJson()).toList();
    return data;
  }
}

class ProductionCountry {
  String? id;
  String? name;

  ProductionCountry.fromJson(Map<String, dynamic> json) {
    id = json['iso_3166_1'];
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['iso_3166_1'] = id;
    data['name'] = name;
    return data;
  }
}

class SpokenLanguage {
  String? english_name;
  String? iso_639_1;
  String? name;

  SpokenLanguage.fromJson(Map<String, dynamic> json) {
    english_name = json['english_name'];
    iso_639_1 = json['iso_639_1'];
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['english_name'] = english_name;
    data['iso_639_1'] = iso_639_1;
    data['name'] = name;
    return data;
  }
}
