
import 'package:flutter/material.dart';
import 'package:gerenciador_planta/models/irrigacao.dart';

class Planta {
  final String _nome;
  final String _descricao;
  final String _regiao;
  final String _tipo;
  final String _url;
  final Irrigacao _irrigacao;

  Planta({
    required String nome,
    required String descricao,
    required String regiao,
    required String tipo,
    required String url,
    required Irrigacao irrigacao,
  })  : _nome = nome,
        _descricao = descricao,
        _regiao = regiao,
        _tipo = tipo,
        _url = url,
        _irrigacao = irrigacao;

  String get nome => _nome;
  String get descricao => _descricao;
  String get regiao => _regiao;
  String get tipo => _tipo;
  String get url => _url;
  Irrigacao get irrigacao => _irrigacao;
}

class PlantaProvider with ChangeNotifier {
  final List<Planta> _plantas = [];

  List<Planta> get getPlantas => _plantas;

  void adicionarDados(Planta planta) {
    _plantas.add(planta);
    notifyListeners();
  }
}
