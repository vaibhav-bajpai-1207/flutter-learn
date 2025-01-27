class Note {
  Note({required this.title, required this.body});
  String title;
  String body;

  Map<String, String> toJson() {
    return {
      'title': title,
      'body': body,
    };
  }

  factory Note.fromJson(Map<String, dynamic> json) {
    return Note(
      title: json['title'],
      body: json['body'],
    );
  }
}
