import 'dart:async';
import 'dart:io';
import 'dart:convert';
import 'package:movie_app/helper/constants.dart';
import 'package:movie_app/model/cast.dart';
import 'package:movie_app/model/genre.dart';
import 'package:movie_app/model/movie.dart';
import 'package:movie_app/model/ws_response.dart';
import 'package:http/http.dart' as http;

Future<WSResponse> httpClientGet(Uri url, Duration timeout) async {
  try {
    final response = await http.get(url).timeout(timeout);
    return WSResponse(
        success: true, statusCode: response.statusCode, data: response.body);
  } on TimeoutException catch (err) {
    return WSResponse(success: false, data: err.message);
  } on SocketException catch (err) {
    return WSResponse(success: false, data: err.message);
  }
}

Future<Movie> getMovieDetails(int id) async {
  String url = MOVIEDETAILS_URL.replaceAll('{movieId}', id.toString());
  WSResponse reply =
      await httpClientGet(Uri.parse(url), const Duration(minutes: API_TIMEOUT));

  var results = jsonDecode(reply.data);
  var statusCode = results['status_code'];

  if (reply.statusCode == 200) {
    return Movie.fromJson(jsonDecode(reply.data));
  } else {
    if (statusCode == 7) {
      throw ('Wrong API Key');
    } else {
      throw ('asd');
    }
  }
}

Future<MovieList> getUpcomingMovieList() async {
  WSResponse reply = await httpClientGet(
      Uri.parse(UPCOMING_URL), const Duration(minutes: API_TIMEOUT));

  var results = jsonDecode(reply.data);
  var statusCode = results['status_code'];

  if (reply.statusCode == 200) {
    return MovieList.fromJson(jsonDecode(reply.data));
  } else {
    if (statusCode == 7) {
      throw ('Wrong API Key');
    } else {
      throw ('asd');
    }
  }
}

Future<MovieList> getTopMovieList() async {
  WSResponse reply = await httpClientGet(
      Uri.parse(POPULAR_URL), const Duration(minutes: API_TIMEOUT));

  var results = jsonDecode(reply.data);
  var statusCode = results['status_code'];

  if (reply.statusCode == 200) {
    return MovieList.fromJson(jsonDecode(reply.data));
  } else {
    if (statusCode == 7) {
      throw ('Wrong API Key');
    } else {
      throw ('asd');
    }
  }
}

Future<CastList> getMovieCast(int movieId) async {
  WSResponse reply = await httpClientGet(
      Uri.parse(CASTDETAILS_URL.replaceAll('{movieId}', movieId.toString())),
      const Duration(minutes: API_TIMEOUT));

  var results = jsonDecode(reply.data);
  var statusCode = results['status_code'];

  if (reply.statusCode == 200) {
    return CastList.fromJson(jsonDecode(reply.data));
  } else {
    if (statusCode == 7) {
      throw ('Wrong API Key');
    } else {
      throw ('asd');
    }
  }
}

Future<GenreList> getGenreList() async {
  WSResponse reply = await httpClientGet(
      Uri.parse(MOVIEGENRE_URL), const Duration(minutes: API_TIMEOUT));

  var results = jsonDecode(reply.data);
  var statusCode = results['status_code'];

  if (reply.statusCode == 200) {
    return GenreList.fromJson(jsonDecode(reply.data));
  } else {
    if (statusCode == 7) {
      throw ('Wrong API Key');
    } else {
      throw ('asd');
    }
  }
}

Future<MovieList> getGenreMovieList(int id) async {
  WSResponse reply = await httpClientGet(
      Uri.parse(GETMOVIEBYGENRE_URL.replaceAll('{genreId}', id.toString())),
      const Duration(minutes: API_TIMEOUT));

  var results = jsonDecode(reply.data);
  var statusCode = results['status_code'];

  if (reply.statusCode == 200) {
    return MovieList.fromJson(jsonDecode(reply.data));
  } else {
    if (statusCode == 7) {
      throw ('Wrong API Key');
    } else {
      throw ('asd');
    }
  }
}
