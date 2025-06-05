class Post {
  final int userId;
  final int id;
  final String title;
  final String body;

  Post({
    required this.userId,
    required this.id,
    required this.title,
    required this.body,
  });

  factory Post.fromJson(Map<String, dynamic> json) {
    return Post(
      userId: json['userId'],
      id: json['id'],
      title: json['title'],
      body: json['body'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'userId': userId,
      'id': id,
      'title': title,
      'body': body,
    };
  }
  String get firstLetter {
    return title.isNotEmpty ? title[0].toUpperCase() : '?';
  }

// Helper method to get truncated title (first 10 characters)
  String get truncatedTitle {
    return title.length > 7 ? '${title.substring(0, 7)}' : title;
  }

// Helper method to get truncated body (first 200 characters)
  String get truncatedBody {
    return body.length > 100 ? '${body.substring(0, 100)}' : body;
  }
}

