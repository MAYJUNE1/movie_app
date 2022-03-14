import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:movie_app/model/genre.dart';
import 'package:movie_app/model/movie.dart';

class MovieProvider with ChangeNotifier {
  List<Movie> _favouriteMovieList = [];
  List<Movie>? get favouriteMovieList => _favouriteMovieList;

  void setFavouriteMovieList(Movie movie) {
    int index =
        _favouriteMovieList.indexWhere((element) => element.id == movie.id);

    if (index != -1) {
      _favouriteMovieList.removeAt(index);
    } else {
      _favouriteMovieList.add(movie);
    }

    notifyListeners();
  }

  bool get isFavourite => _favouriteMovieList
              .indexWhere((element) => element.id == selectedMovieId) !=
          -1
      ? true
      : false;

  Movie _selectedMovie = Movie();
  Movie get selectedMovie => _selectedMovie;

  int _selectedMovieId = 0;
  int get selectedMovieId => _selectedMovieId;

  void setSelectedMovieId(int value) {
    _selectedMovieId = value;
    notifyListeners();
  }

  void setSelectedMovie(Movie value) {
    _selectedMovie = value;
  }

  Genre _selectedGenre = Genre();
  Genre get selectedGenre => _selectedGenre;

  void setSelectedGenre(Genre value) {
    _selectedGenre = value;
    notifyListeners();
  }
}
