import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class TokenProvider extends ChangeNotifier {
  String? _token;
  SharedPreferences? _prefs;

  String? get token => _token;

  // bool isTokenExpired() {
  //   // Verifique se o token expirou comparando-o com a data atual
  //   // Aqui está um exemplo usando a biblioteca `intl` para formatar datas
  //   final expirationDate = DateTime.parse(_tokenExpiration);
  //   final now = DateTime.now();
  //   return now.isAfter(expirationDate);
  // }

  Future<dynamic> initPrefs() async {
    _prefs = await SharedPreferences.getInstance();
    _token = _prefs!.getString('token');
  }

  Future<void> setToken(String? token) async {
    _token = token;
    notifyListeners();

    if (_prefs != null) {
      await _prefs!.setString('token', token ?? '');
    }
  }
}
