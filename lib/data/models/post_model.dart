

class Post {
  final int? id;
  final String title;
  final String body;

  const Post({
    this.id,
    required this.title,
    required this.body,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'title': title,
      'body': body,
    };
  }

  @override
  String toString() => 'Post(id: $id, title: $title, body: $body)';
}
