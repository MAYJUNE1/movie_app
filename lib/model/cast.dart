// ignore_for_file: non_constant_identifier_names

class CastList {
  int? page;
  List<Cast>? casts;

  CastList({this.page, this.casts});

  CastList.fromJson(Map<String, dynamic> json) {
    page = json['id'];
    casts = json['cast'] == null
        ? null
        : (json['cast'] as List<dynamic>?)
            ?.map((e) => Cast.fromJson(e as Map<String, dynamic>))
            .toList();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = page;
    data['cast'] =
        casts == null ? null : casts!.map((x) => x.toJson()).toList();
    return data;
  }
}

class Cast {
  int? id;
  String? adult;
  int? gender;
  String? name;
  String? profile_path;
  String? character;
  String? title;
  String? poster_path;

  Cast(
      {this.id,
      this.gender,
      this.name,
      this.profile_path,
      this.character,
      this.title,
      this.poster_path});

  Cast.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    gender = json['gender'];
    name = json['name'];
    profile_path = json['profile_path'];
    character = json['character'];
    title = json['title'];
    poster_path = json['poster_path'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['gender'] = gender;
    data['name'] = name;
    data['character'] = character;
    data['profile_path'] = profile_path;

    return data;
  }
}
