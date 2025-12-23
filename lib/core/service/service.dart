import 'dart:convert';
import 'dart:developer';
import 'package:exam_test/core/service/apis.dart';
import 'package:http/http.dart';
import 'package:exam_test/data/models/user/user_model.dart';

enum RequestMethod { get, post, put, patch, delete }

sealed class Network {
  static Future<String?> request({
    required String api,
    Object? id,
    RequestMethod method = RequestMethod.get,
    Map<String, Object?>? data,
    Map<String, String> headers = Apis.headers,
    Map<String, String>? queryParams,
  }) async {
    final url = Uri.parse(api);
    final String body = jsonEncode(data);

    log(url.toString());
    final response = await switch (method) {
      RequestMethod.get => get(url, headers: headers),
      RequestMethod.post => post(url, headers: headers, body: body),
      RequestMethod.put => put(url, headers: headers, body: body),
      RequestMethod.patch => patch(url, headers: headers, body: body),
      RequestMethod.delete => delete(url, headers: headers),
    };
    log("${response.body}");

    if (response.statusCode == 200 || response.statusCode == 201) {
      return utf8.decoder.convert(response.bodyBytes);
    }

    return null;
  }

  static List<UserModel> parseUserList(String data) {
    final jsonList = jsonDecode(data) as List;
    return jsonList.map((item) => UserModel.fromJson(item)).toList();
  }
}
