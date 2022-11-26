import 'dart:convert';

import 'package:papered/models/imagemodel.dart';
import 'package:papered/models/secrermodel.dart';
import 'package:http/http.dart' as http;

class APIService {
  Future<String> getKey() async {
    String apiKey = await SecretManager().load();
    return apiKey;
  }

  Future<ImageModel> getRandomWallpaper(
      String perPage, String keywords, String pageNo) async {
    Map<String, String> params = {
      'per_page': perPage,
      'query': keywords,
      'page': pageNo
    };
    // String apiKey = await getKey();
    final response = await http
        .get(Uri.https('api.pexels.com', 'v1/search', params), headers: {
      "Authorization":
          "563492ad6f91700001000001a64a4f897e6d455899c27d3fabf4285c"
    });

    if (response.statusCode == 200) {
      return ImageModel.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to load data.');
    }
  }
}
