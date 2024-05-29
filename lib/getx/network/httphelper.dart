import 'dart:convert';
import 'package:http/http.dart' as http;

class HttpHelper {
  // Method to make a POST request and parse the JSON response
  static Future<Map<String, dynamic>> postRequest(String url, Map<dynamic, dynamic> jsondata) async {
    try {
      final responsedata = await http.post(Uri.parse(url), body: json.encode(jsondata), headers: {
        'Content-Type': 'application/json',
      });
      if (responsedata.statusCode == 200) {
        final data = json.decode(responsedata.body);
        return data;
      } else {
        throw Exception('Failed to load data: ${responsedata.statusCode}');
      }
    } catch (e) {
      throw Exception('Failed to make a POST request: $e');
    }
  }
}
