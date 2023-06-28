import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:flutter_application_1/data/http_client.dart';
import 'package:flutter_application_1/models/login_model.dart';
import 'package:crypto/crypto.dart';
import 'package:intl/intl.dart';

const baseUrl = 'https://m2admin.softkuka.com.br/api';

class LoginApi {
  Future<Map<String, dynamic>> login(
      String email, String password, String secret
    ) async {
    var formatter = DateFormat('dd/MM/yyyy');

    var secretToSend = md5.convert(utf8.encode('$email-${formatter.format(DateTime.now())}-cliente'));

    final body = json.encode({
      'email': email,
      'pwd': password,
      'secret': secretToSend.toString(),
    });

    final headers = {
      'Content-Type': 'application/json',
    };

    final response = await http.post(Uri.parse('$baseUrl/Login'),
        body: body, headers: headers);

    if (response.statusCode == 200) {
      final jsonData = json.decode(response.body);

      final token = jsonData['token'];
      final user = jsonData['user'];
      return {'token': token, 'user': user};
    } else {
      throw Exception('Erro na chamada de login: ${response.statusCode}');
      
    }
  }
}
