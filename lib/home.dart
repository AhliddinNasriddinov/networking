import 'dart:convert';
import 'package:http/http.dart';
import 'package:networking/post.dart';

class HttpService {
  final String postsURL = "https://jsonplaceholder.typicode.com/posts";

  Future<List<Post>> getPosts() async {
    Response res = await get(postsURL);

    if (res.statusCode == 200) {
      List<dynamic> body = jsonDecode(res.body);

      List<Post> posts = body
          .map(
            (dynamic item) => Post.fromJson(item),
      )
          .toList();

      return posts;
    } else {
      throw "Unable to retrieve posts.";
    }
  }

  Future<void> deletePost(int id) async {
    Response res = await delete("$postsURL/$id");

    if (res.statusCode == 200) {
      print("DELETED");
    } else {
      throw "Unable to delete post.";
    }
  }
}