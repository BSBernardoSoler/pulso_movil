import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import '../constans/host/host.dart';

class AuthService {
  final String loginUrl = APIUrls.loginUser();
  final String registerUrl = APIUrls.registerUser();
  final String loginPsaludUrl = APIUrls.loginPsalud(); // Nueva URL para login de oficial

  // Método de inicio de sesión (login) para cliente
  Future<Map<String, String>?> loginCliente(String correo, String password) async {
    final response = await http.post(
      Uri.parse(loginUrl),
      headers: {"Content-Type": "application/json"},
      body: jsonEncode({"correo": correo, "password": password}),
    );
    if (response.statusCode == 201) {
      final Map<String, dynamic> data = jsonDecode(response.body);
      final String token = data['token'];
      final String correo = data['correo']; // Asume que la respuesta incluye el correo
      final String role = data['role']; // Asume que la respuesta incluye el correo
      await _saveUserInfo(token, correo,role);
      print(token);
      print(correo);
      print(role);
      return {'token': token, 'correo': correo};
    } else {
      return null;
    }
  }

  // Método de inicio de sesión (login) para oficial
  Future<Map<String, String>?> loginOficial(String correo, String password) async {
    final response = await http.post(
      Uri.parse(loginPsaludUrl),
      headers: {"Content-Type": "application/json"},
      body: jsonEncode({"correo": correo, "password": password}),
    );
    if (response.statusCode == 201) {
      final Map<String, dynamic> data = jsonDecode(response.body);
      final String token = data['token'];
      final String correo = data['correo'];
      final String role = data['role'];// Asume que la respuesta incluye el correo
      await _saveUserInfo(token, correo,role);
      print(token);
      print(correo);
      print(role);
      return {'token': token, 'correo': correo};
    } else {
      return null;
    }
  }

  // Método de registro (register)
  Future<bool> register(String nombre, String apellido, String correo, String password, String telefono) async {
    final response = await http.post(
      Uri.parse(registerUrl),
      headers: {"Content-Type": "application/json"},
      body: jsonEncode({
        "nombre": nombre,
        "apellido": apellido,
        "correo": correo,
        "password": password,
        "numero_telef": telefono,
      }),
    );
    return response.statusCode == 201;
  }
 // funcion para guardar informacion de la sesion del usuario
  Future<void> _saveUserInfo(String token, String correo, String role) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('jwt', token);
    await prefs.setString('correo', correo);
    await prefs.setString('role', role);
  }
  // funcion para recuperar la informacion del usuario en el localstorage
  Future<Map<String, String>?> getUserInfo() async {
    final prefs = await SharedPreferences.getInstance();
    final token = prefs.getString('jwt');
    final correo = prefs.getString('correo');
    final role = prefs.getString('role');
    if (token != null && correo != null && role != null) {
      return {'token': token, 'correo': correo ,'role':role };
    }
    return null;
  }
  // funcion para cerrar sesion
  Future<void> logout() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove('jwt');
    await prefs.remove('correo');
    await prefs.remove('role');
  }
}