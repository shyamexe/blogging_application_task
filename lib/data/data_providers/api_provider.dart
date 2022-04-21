import 'dart:convert';

import 'package:blogging_application/core/constants/strings.dart';
import 'package:blogging_application/data/models/post_content_model.dart';
import 'package:blogging_application/data/models/post_response_model.dart';
import 'package:http/http.dart' as http;

class ApiProvider {
  Future<PostResponseModel> getPosts() async {
    var response = await http.get(Uri.parse(
        'https://www.googleapis.com/blogger/v3/blogs/2399953/posts?key=${Strings.apiKey}'));

    final jsondata = jsonDecode(response.body);
    return PostResponseModel.fromJson(jsondata);
  }

  Future<PostContentModel> getContent(String url) async {
    var response = await http.get(Uri.parse('$url?key=${Strings.apiKey}'));
    final jsondata = jsonDecode(response.body);

    return PostContentModel.fromJson(jsondata);
  }
}
