class Movie {
  final int id;
  final String title;
  final String posterPath;
  final String description;
  final String releaseDate;
  final double rating;
  final List<String>? genres;
  final int? runtime;

  Movie({
    required this.id,
    required this.title,
    required this.posterPath,
    required this.description,
    required this.releaseDate,
    required this.rating,
    this.genres,
    this.runtime,
  });

  factory Movie.fromJson(Map<String, dynamic> json) {
    List<String>? genresList;
    if (json['genres'] != null && json['genres'] is List) {
      genresList = (json['genres'] as List)
          .map((genre) => genre['name'] as String? ?? '')
          .toList();
    }

    return Movie(
      id: json['id'] ?? 0, 
      title: json['title'] ?? 'Unknown',
      posterPath: json['poster_path'] ?? '',
      description: json['overview'] ??
          'No description available', 
      releaseDate: json['release_date'] ??
          'Unknown', 
      rating: (json['vote_average'] as num?)?.toDouble() ??
          0.0, 
      genres: genresList, 
      runtime: json['runtime'], 
    );
  }
}