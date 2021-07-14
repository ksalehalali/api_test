import 'package:flutter/foundation.dart';

class Post {
  final int userId;
  final int id;
  final String title;
  final String body;

  Post({
    @required this.userId,
    @required this.id,
    @required this.title,
    @required this.body,
  });

  factory Post.fromJson(Map<String, dynamic> jsonData) {
    return Post(
      userId: jsonData['userId'],
      id: jsonData['id'],
      title: jsonData['title'],
      body: jsonData['body'],
    );
  }

  static Map<String, dynamic> toJson(dynamic modelData) {
    return {
      'userId' : modelData.userId,
      'id' : modelData.id,
      'title' : modelData.title,
      'body' : modelData.body ,
    };
  }


}

class Posts {
  List<dynamic> postList = [
    Post(userId: 1, id: 1, title: "Title", body: "Body"),
    Post(userId: 1, id: 2, title: "Title 2", body: "Body 2"),
  ];

  Posts({@required this.postList});

  factory Posts.fromJson(Map<String, dynamic> jsonData) {
    return Posts(
      postList: jsonData['postList'],
    );
  }

  Map<String, dynamic> toJson(Posts modelData) {
    return {
      'postList': modelData.postList,
    };
  }
}
