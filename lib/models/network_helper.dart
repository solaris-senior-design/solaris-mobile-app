import 'package:http/http.dart' as http;
import 'dart:convert';

class NetworkHelper {
  static Future getData(http.Client client, Uri url) async {
    http.Response response = await http.get(url);

    if (response.statusCode == 200) {
      String data = response.body;
      return jsonDecode(data);
    }
  }

  static Future<http.Response> sendData(
      http.Client client, Uri url, Map<String, String> msg) async {
    http.Response response = await http.post(url,
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(msg));

    return response;
  }
}
