import 'package:dio/dio.dart';

Future<Response> get(String url, [Map<String, dynamic>? data]) async {
  try {
    var response = await Dio().get(url, queryParameters: data);
    return response;
  } catch (e) {
    return Future.error(e);
  }
}
