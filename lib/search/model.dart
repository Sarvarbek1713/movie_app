class MovieModel {
  String? message;
  List<Data>? data;

  MovieModel({this.message, this.data});

  MovieModel.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(new Data.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['message'] = this.message;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Data {
  String? sId;
  String? name;
  String? time;
  String? year;
  String? popularity;
  String? movieVideo;
  String? movieImage;
  String? description;
  int? iV;

  Data(
      {this.sId,
      this.name,
      this.time,
      this.year,
      this.popularity,
      this.movieVideo,
      this.movieImage,
      this.description,
      this.iV});

  Data.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    name = json['name'];
    time = json['time'];
    year = json['year'];
    popularity = json['popularity'];
    movieVideo = json['movie_video'];
    movieImage = json['movie_image'];
    description = json['description'];
    iV = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['name'] = this.name;
    data['time'] = this.time;
    data['year'] = this.year;
    data['popularity'] = this.popularity;
    data['movie_video'] = this.movieVideo;
    data['movie_image'] = this.movieImage;
    data['description'] = this.description;
    data['__v'] = this.iV;
    return data;
  }
}
