class JokeModel {
  final String type;
  final String setup;
  final String punchline;
  final int id;

  JokeModel(
      {required this.type,
      required this.setup,
      required this.punchline,
      required this.id});

  factory JokeModel.fromJson(Map<String, dynamic> json) {
    return JokeModel(
      type: json['type'],
      setup: json['setup'],
      punchline: json['punchline'],
      id: json['id'],
    );
  }

  String get fullJoke => '$setup\n$punchline';
}
