import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class AuthService {
  static const String baseUrl = 'http://3.22.52.255/api/users';

  Future<String?> register(String name, String email, String password) async {
    final response = await http.post(
      Uri.parse('$baseUrl/register'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode({
        'name': name,
        'email': email,
        'password': password,
      }),
    );
    if (response.statusCode == 201) {
      final Map<String, dynamic> responseData = json.decode(response.body);
      final String? token = responseData['token'];
      return token;
    } else {
      throw Exception('Error al registrar el usuario');
    }
  }

  Future<Map<String, String>> login(String email, String password) async {
    final response = await http.post(
      Uri.parse('$baseUrl/login'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode({
        'email': email,
        'password': password,
      }),
    );
    if (response.statusCode == 200) {
      final Map<String, dynamic> responseData = json.decode(response.body);
      final String? userId = responseData['user_id'];
      final String? user = responseData['user'];
      final String message = responseData['message'];

      print('ID_USER => $userId');

      // Guardar el user_id localmente
      SharedPreferences prefs = await SharedPreferences.getInstance();
      await prefs.setString('user_id', userId ?? '');
      await prefs.setString('user', user ?? '');

      return {
        'userId': userId ?? '',
        'user': user ?? '',
        'message': message,
        'email': email,
        'name': user ?? '',
      };
    } else {
      throw Exception('Error al iniciar sesión');
    }
  }

  Future<String?> getUserId() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString('user_id');
  }

  Future<String?> getUserName() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString('user');
  }
}
