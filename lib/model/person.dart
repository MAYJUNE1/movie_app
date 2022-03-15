// ignore_for_file: non_constant_identifier_names
import 'package:movie_app/model/cast.dart';

class Person {
  String? biography;
  int? id;
  String? name;
  String? profile_path;
  Credit? combined_credits;

  Person({
    this.id,
    this.biography,
    this.name,
    this.profile_path,
    this.combined_credits,
  });

  Person.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    biography = json['biography'];
    name = json['name'];
    profile_path = json['profile_path'];
    combined_credits = json['combined_credits'] == null
        ? null
        : Credit.fromJson(json['combined_credits'] as Map<String, dynamic>);
  }
}

class Credit {
  List<Cast>? cast;

  Credit({this.cast});

  Credit.fromJson(Map<String, dynamic> json) {
    cast = json['cast'] == null
        ? null
        : (json['cast'] as List<dynamic>?)
            ?.map((e) => Cast.fromJson(e as Map<String, dynamic>))
            .toList();
  }
}
