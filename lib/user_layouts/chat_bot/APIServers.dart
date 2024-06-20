import 'dart:convert';
import 'package:http/http.dart' as http;

class ApiService {
  final String baseUrl;

  ApiService(this.baseUrl);

  Future<String> sendMessage(String message) async {
    final response = await http.post(
      Uri.parse('$baseUrl'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String>{
        'message': message,
      }),
    );

    if (response.statusCode == 200) {
      return jsonDecode(response.body)['responses'];
    } else {
      throw Exception('Failed to send message');
    }
    }
}