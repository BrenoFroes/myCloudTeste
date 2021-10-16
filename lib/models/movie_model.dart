class Movie {
  late int id;
  late int title;
  late int original_title;
  late String votation;
  late String photo;
  late String description;

  Movie(
      {required this.id,
      required this.title,
      required this.original_title,
      required this.votation,
      required this.photo,
      required this.description});

  // Converte um objeto JSON em um objeto Survey
  Movie.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    original_title = json['original_title'];
    votation = json['votation'];
    photo = json['photo'];
    description = json['description'];
  }

  // Converte um objeto Survey em um objeto JSON
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['title'] = this.title;
    data['original_title'] = this.original_title;
    data['votation'] = this.votation;
    data['photo'] = this.photo;
    data['description'] = this.description;
    return data;
  }
}
