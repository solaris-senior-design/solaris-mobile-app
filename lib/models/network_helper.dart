import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:io';
import '../globals/globals.dart';

class NetworkHelper {
  static Future getData(http.Client client, Uri url) async {
    http.Response response = await http.get(url, headers: <String, String>{
      'x-access-token': token,
    });

    if (response.statusCode == 200) {
      String data = response.body;
      return jsonDecode(data);
    }
  }

  static Future<http.Response> sendData(
      http.Client client, Uri url, Map<String, String> msg) async {
    http.Response response = await http.post(url,
        headers: {
          HttpHeaders.contentTypeHeader: 'application/json',
        },
        body: jsonEncode(msg));

    return response;
  }
}
