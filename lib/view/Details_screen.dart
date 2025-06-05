import 'package:flutter/material.dart';
import '../model/post_model.dart' show Post;

class PostDetailScreen extends StatelessWidget {
  final Post post;
  PostDetailScreen({required this.post});
  Color _getAvatarColor(int userId) {
    return Colors.primaries[userId % Colors.primaries.length];
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            // App Bar
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Row(
                children: [
                  IconButton(
                    icon: Icon(Icons.arrow_back),
                    onPressed: (){Navigator.pop(context);},
                  ),
                  Text(
                    'Post',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    post.title,
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 10),
                  Text(
                    post.body,
                    style: TextStyle(fontSize: 16),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Icon(Icons.favorite_border, color: Colors.grey),
                  Icon(Icons.comment_outlined, color: Colors.grey),
                  Icon(Icons.share, color: Colors.grey),
                ],
              ),
            ),

            Divider(height: 20),

            Expanded(
              child: ListView(
                children: [
                  _buildComment('Sophia', 'Sounds amazing! Where exactly did you go?', 25, 2),
                  _buildComment('Ethan', 'I\'m so jealous! I need a break too.', 18, 1),
                  _buildComment('Olivia', 'The mountains are calling, and I must go!', 30, 3),
                ],
              ),
            ),

            Divider(),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 4),
              child: Row(
                children: [
                  CircleAvatar(
                    backgroundColor: _getAvatarColor(post.userId),
                    child: Text(
                      post.firstLetter,
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                  SizedBox(width: 8),
                  Expanded(
                    child: TextField(
                      decoration: InputDecoration(
                        hintText: 'Add comment',
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                  Icon(Icons.image, color: Colors.grey),
                ],
              ),
            ),
            SizedBox(height: 10,)
          ],
        ),
      ),
    );
  }

  Widget _buildComment(String name, String comment, int likes, int dislikes) {
    return ListTile(
      leading: CircleAvatar(
        backgroundColor: Colors.blueGrey,
        child: Text(name[0].toUpperCase()),
      ),
      title: Text(name),
      subtitle: Text(comment),
      trailing: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(Icons.thumb_up_alt_outlined, size: 16),
          SizedBox(width: 4),
          Text('$likes'),
          SizedBox(width: 12),
          Icon(Icons.thumb_down_alt_outlined, size: 16),
          SizedBox(width: 4),
          Text('$dislikes'),
        ],
      ),
    );
  }
}
