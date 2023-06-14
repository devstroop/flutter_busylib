import 'dart:convert';
import 'package:http/http.dart' as http;

class HttpUtil{

  static Future<http.Response> get({
    required String url,
    Map<String, String>? headers,
  }) async {
    final uri = Uri.parse(url);
    final response = await http.get(uri, headers: headers);

    final resultHeader = response.headers['Result'];
    if (resultHeader == 'F') {
      final descriptionHeader = response.headers['Description'];
      throw Exception(descriptionHeader);
    } else if (resultHeader == 'T') {
      if (response.statusCode == 200) {
        return response;
      } else {
        throw Exception('Invalid status code in response');
      }
    } else {
      throw Exception('Unspecified \'Result\' in response header');
    }
  }
  static Future<http.Response> post({
    required String url,
    Map<String, String>? headers,
    Map<String, dynamic>? body,
    Encoding? encoding,
  }) async {
    final uri = Uri.parse(url);
    final response = await http.post(uri, headers: headers, body: body, encoding: encoding);

    final resultHeader = response.headers['Result'];
    if (resultHeader == 'F') {
      final descriptionHeader = response.headers['Description'];
      throw Exception(descriptionHeader);
    } else if (resultHeader == 'T') {
      if (response.statusCode == 200) {
        return response;
      } else {
        throw Exception('Invalid status code in response');
      }
    } else {
      throw Exception('Unspecified \'Result\' in response header');
    }
  }
}