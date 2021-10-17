class Movie {
  late int id;
  late String title;
  late String original_title;
  late String votation;
  late String backdrop_path;
  late String poster_path;
  late String description;

  Movie(
      {required this.id,
      required this.title,
      required this.original_title,
      required this.votation,
      required this.backdrop_path,
      required this.poster_path,
      required this.description});

  // Converte um objeto JSON em um objeto movie
  Movie.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    original_title = json['original_title'];
    votation = json['votation'];
    backdrop_path = json['backdrop_path'];
    poster_path = json['poster_path'];
    description = json['overview'];
  }
}
