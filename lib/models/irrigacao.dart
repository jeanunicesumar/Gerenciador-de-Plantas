
class Irrigacao {
  final String _horario;
  final int _tempo;
  final int _vazao;

  Irrigacao({
    required String horario,
    required int tempo,
    required int vazao,
  })  : _horario = horario,
        _tempo = tempo,
        _vazao = vazao;

  String get horario => _horario;
  int get tempo => _tempo;
  int get vazao => _vazao;
}
