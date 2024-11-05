import 'dart:convert';

import '../models/planta.dart';
import 'package:http/http.dart' as http;

class AppService {
  final String _baseUrl = "http://localhost:3000";
  final String _url;

  AppService(this._url);

  Future<List<Planta>> findAll() async {
    var response = await (http.get(Uri.parse('$_baseUrl$_url')));
    List<dynamic> data = await (jsonDecode(response.body));
    return data.map((json) => Planta.fromJson(json)).toList();
  }

  Future<Planta> findById(String id) async {
    var response = await http.get(Uri.parse('$_baseUrl$_url/$id'));

    if (response.statusCode == 200) {
      var json = jsonDecode(response.body);
      return Planta.fromJson(json);
    } else {
      throw Exception('Planta not found $id');
    }
  }

  Future<Planta> create(Planta planta) async {
    final response = await http.post(
      Uri.parse('$_baseUrl$_url'),
      headers: <String, String>{
        'Content-Type': 'application/json',
      },
      body: jsonEncode(planta.toJson()),
    );

    if (response.statusCode == 201) {
      var json = jsonDecode(response.body);
      return Planta.fromJson(json);
    } else {
      throw Exception('Falha ao criar planta');
    }
  }
}
